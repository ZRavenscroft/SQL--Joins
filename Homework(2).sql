CREATE DATABASE StudentList
USE StudentList

CREATE TABLE Students(
Id INT PRIMARY KEY IDENTITY,
FullName NVARCHAR(40) NOT NULL,
GroupId INT CONSTRAINT FK_St_GroupId FOREIGN KEY REFERENCES Groups(Id)
)

CREATE TABLE Groups(
Id INT PRIMARY KEY IDENTITY,
No NVARCHAR(10)
)

INSERT INTO Students
VALUES
('Zakcary Ravenscroft', 1),
('Zack Ravenscroft', 1),
('Zackary Williams', 2),
('Zack Williams', 2),
('Will Smith', 4),
('Black Panter', 3),
('Johnny Depp', 4),
('Robert Downey Jr', 3)

INSERT INTO Groups
VALUES
('P132'),
('P432'),
('Avengers'),
('Pirates')

SELECT St.Id, St.FullName,Gr.No AS 'Group'
FROM Students AS St
JOIN Groups AS Gr
ON St.GroupId=Gr.Id

CREATE TABLE Subjects(
Id INT PRIMARY KEY IDENTITY,
Subject NVARCHAR(20) UNIQUE NOT NULL
)

CREATE TABLE Exams(
Id INT PRIMARY KEY IDENTITY,
SubjectId INT CONSTRAINT FK_Ex_SubjectId FOREIGN KEY REFERENCES Subjects(Id),
ExDate DATETIME2 NOT NULL
)
CREATE TABLE StudentExams(
Id INT PRIMARY KEY IDENTITY,
StudentId INT CONSTRAINT FK_SE_StudentId FOREIGN KEY REFERENCES Students(Id)
)
ALTER TABLE StudentExams
ADD ExamId INT CONSTRAINT FK_SE_ExamId FOREIGN KEY REFERENCES Exams(Id)
ALTER TABLE StudentExams
ADD Result TINYINT

INSERT INTO Subjects
VALUES
('Math'),
('Science'),
('English'),
('Chemistry'),
('Physics')


SELECT COUNT(Id) FROM StudentExams WHERE StudentId=St.Id AS 'Exams',
FROM Students AS St

SELECT * FROM Subjects AS Sb
WHERE 0=(SELECT COUNT(Id) FROM Exams AS Ex WHERE Ex.SubjectId=Sb.Id)

SELECT *,
(SELECT AVG(Result) FROM StudentExams AS StEx
WHERE StudentId=St.Id) AS 'AVG'
FROM Students AS St