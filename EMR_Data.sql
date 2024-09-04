CREATE TABLE CleanedEMRData (
    PatientID UNIQUEIDENTIFIER,
    Age INT,
    Gender NVARCHAR(50),
    Race NVARCHAR(50),
    PrimaryDiagnosis NVARCHAR(10),
    SecondaryDiagnosis1 NVARCHAR(10),
    SecondaryDiagnosis2 NVARCHAR(10),
    Medication NVARCHAR(100),
    ProcedureCode NVARCHAR(10),
    VisitDate DATE,
    DischargeDate DATE,
    LengthOfStay INT,
    InsuranceType NVARCHAR(50),
    PhysicianID UNIQUEIDENTIFIER,
    HospitalDepartment NVARCHAR(50),
    SourceSystem NVARCHAR(50),
    BloodPressure NVARCHAR(10),
    HeartRate INT,
    Temperature FLOAT,
    BloodGlucose INT,
    Cholesterol INT
);


WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY
                Patient_ID, Age, Gender, Race, Primary_Diagnosis,
                Secondary_Diagnosis_1, Secondary_Diagnosis_2, Medication, Procedure_Code,
                Visit_Date, Discharge_Date, Length_Of_Stay, Insurance_Type, Physician_ID,
                Hospital_Department, Source_System, Blood_Pressure, Heart_Rate,
                Temperature, Blood_Glucose, Cholesterol
                ORDER BY (SELECT NULL)) AS rn
    FROM Emr
)
DELETE FROM CTE WHERE rn > 1;


UPDATE Emr
SET Age = (SELECT P50_Age FROM (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Age) OVER () AS P50_Age FROM Emr) AS T)
WHERE Age IS NULL;

UPDATE Emr
SET Length_Of_Stay = (SELECT P50_Length_Of_Stay FROM (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Length_Of_Stay) OVER () AS P50_Length_Of_Stay FROM Emr) AS T)
WHERE Length_Of_Stay IS NULL;

-- Update categorical fields with the mode
UPDATE Emr
SET Gender = (SELECT TOP 1 Gender FROM Emr WHERE Gender IS NOT NULL GROUP BY Gender ORDER BY COUNT(*) DESC)
WHERE Gender IS NULL;

UPDATE Emr
SET Insurance_Type = (SELECT TOP 1 Insurance_Type FROM Emr WHERE Insurance_Type IS NOT NULL GROUP BY Insurance_Type ORDER BY COUNT(*) DESC)
WHERE Insurance_Type IS NULL;


WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY
                Patient_ID, Age, Gender, Race, Primary_Diagnosis,
                Secondary_Diagnosis_1, Secondary_Diagnosis_2, Medication, Procedure_Code,
                Visit_Date, Discharge_Date, Length_Of_Stay, Insurance_Type, Physician_ID,
                Hospital_Department, Source_System, Blood_Pressure, Heart_Rate,
                Temperature, Blood_Glucose, Cholesterol
                ORDER BY (SELECT NULL)) AS rn
    FROM Emr
)
DELETE FROM CTE WHERE rn > 1;


UPDATE Emr
SET Blood_Pressure = 'Unknown' -- Placeholder for invalid entries
WHERE Blood_Pressure IS NULL OR Blood_Pressure NOT LIKE '%/%';

-- Optionally, you can split BloodPressure into two separate columns for Systolic and Diastolic
ALTER TABLE Emr ADD Systolic INT, Diastolic INT;

UPDATE Emr
SET Systolic = TRY_CAST(SUBSTRING(Blood_Pressure, 1, CHARINDEX('/', Blood_Pressure) - 1) AS INT),
    Diastolic = TRY_CAST(SUBSTRING(Blood_Pressure, CHARINDEX('/', Blood_Pressure) + 1, LEN(Blood_Pressure)) AS INT)
WHERE Blood_Pressure LIKE '%/%';

-- Remove original BloodPressure column if no longer needed
ALTER TABLE Emr DROP COLUMN Blood_Pressure;

ALTER TABLE CleanedEMRData ADD Systolic INT, Diastolic INT;
ALTER TABLE CleanedEMRData DROP COLUMN BloodPressure;


INSERT INTO CleanedEMRData (
    PatientID, Age, Gender, Race, PrimaryDiagnosis,
    SecondaryDiagnosis1, SecondaryDiagnosis2, Medication, ProcedureCode,
    VisitDate, DischargeDate, LengthOfStay, InsuranceType, PhysicianID,
    HospitalDepartment, SourceSystem, HeartRate,
    Temperature, BloodGlucose, Cholesterol, Systolic, Diastolic
)
SELECT
    Patient_ID, Age, Gender, Race, Primary_Diagnosis,
    Secondary_Diagnosis_1, Secondary_Diagnosis_2, Medication, Procedure_Code,
    Visit_Date, Discharge_Date, Length_Of_Stay, Insurance_Type, Physician_ID,
    Hospital_Department, Source_System, Heart_Rate,
    Temperature, Blood_Glucose, Cholesterol, Systolic, Diastolic
FROM Emr;


-- Check for any remaining nulls
SELECT * FROM CleanedEMRData WHERE Age IS NULL OR Gender IS NULL OR BloodGlucose IS NULL;

-- Validate that there are no duplicates
SELECT PatientID, COUNT(*)
FROM CleanedEMRData
GROUP BY PatientID
HAVING COUNT(*) > 1;

SELECT * FROM CleanedEMRData