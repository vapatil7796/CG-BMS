--1. Technology Table
CREATE TABLE bms.Technology(TechId INT IDENTITY(1,1) PRIMARY KEY, TechnologyName NVARCHAR(20) NOT NULL)

--2. Employee Table
CREATE TABLE bms.Employee(EmpId INT PRIMARY KEY,EmpName NVARCHAR(30) NOT NULL,Email NVARCHAR(40) NOT NULL,Grade NVARCHAR(5) NOT NULL,
	UserName NVARCHAR(10) NOT NULL,Password NVARCHAR(15) NOT NULL,IsOnBench BIT NOT NULL,OnBenchDate DATE,
	PrimaryTechId INT NOT NULL REFERENCES bms.Technology(TechId) ON DELETE NO ACTION ON UPDATE CASCADE,
	SelfLearnedTechId INT,
	AccountName NVARCHAR(50), ProjectReportingDate Date)

--3. Administrator Table
CREATE TABLE bms.Administrator(EmpId INT PRIMARY KEY REFERENCES bms.Employee(EmpId) ON DELETE NO ACTION ON UPDATE CASCADE,
	UserName NVARCHAR(10) NOT NULL,Password NVARCHAR(15) NOT NULL)

--4. LoginLogs Table: LoginPurpose necessary for Admin,Spoc1,Spoc2
CREATE TABLE bms.LoginLogs(EmpId INT PRIMARY KEY REFERENCES bms.Employee(EmpId) ON DELETE NO ACTION ON UPDATE CASCADE,
	LoginTime DATETIME NOT NULL,LoginPurpose NVARCHAR(100))

--5. Interview Table
CREATE TABLE bms.Interview(InterviewId INT IDENTITY(1,1) PRIMARY KEY,EmpId INT NOT NULL REFERENCES bms.Employee(EmpId) ON DELETE NO ACTION ON UPDATE CASCADE,
	ProjectName NVARCHAR(50) NOT NULL, InterviewerName NVARCHAR(30) NOT NULL, TechId INT NOT NULL REFERENCES bms.Technology(TechId),
	Question NVARCHAR(MAX) NOT NULL)

--6. TempEmployee Table
CREATE TABLE bms.TempEmployee(EmpId INT PRIMARY KEY,EmpName NVARCHAR(30) NOT NULL,Email NVARCHAR(40) NOT NULL,Grade NVARCHAR(5) NOT NULL,
	UserName NVARCHAR(10) NOT NULL,Password NVARCHAR(15) NOT NULL,IsOnBench BIT NOT NULL,OnBenchDate DATE,
	PrimaryTechId INT NOT NULL REFERENCES bms.Technology(TechId) ON DELETE NO ACTION ON UPDATE CASCADE,
	SelfLearnedTechId INT,
	AccountName NVARCHAR(50), ProjectReportingDate Date)