USE master;
GO

--Create the Farm database only if it doesn't already exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Farm')
BEGIN
    CREATE DATABASE Farm;
END
GO

--Switch to the Farm database
USE Farm;
GO

-- Create the Chicken table
CREATE TABLE Chicken (
    ChickID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Breed NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    EggProduction DECIMAL(5,2) NOT NULL, --eggs per day
    IsPregnant BIT NOT NULL, --1 for yes, 0 for no
    LastVetCheck DATE NOT NULL
);
GO

-- Insert sample data into the Chicken table
INSERT INTO Chicken (Name, Breed, Age, EggProduction, IsPregnant, LastVetCheck)
VALUES 
('Clucky', 'Leghorn', 5, 25.5, 1, '2026-04-01'),
('Feathers', 'Rhode Island Red', 3, 20.0, 0, '2026-03-15'),
('Pecky', 'Plymouth Rock', 4, 23.8, 1, '2026-03-30');
GO