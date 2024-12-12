--1
SELECT 
    t.Name AS Ime,
    t.Surname AS Prezime,
    CASE 
        WHEN t.Gender = 'M' THEN 'MUŠKI'
        WHEN t.Gender = 'Z' THEN 'ŽENSKI'
		WHEN t.Gender = 'N' THEN 'NEPOZNATO'
        ELSE 'OSTALO'
    END AS Spol,
    c.Name AS Država,
    c.AverageSalary AS ProsječnaPlaća
FROM Trainers t
JOIN Countries c ON t.CountryID = c.CountryID;

--2
SELECT 
    a.Type AS Aktivnost,
    s.StartTime AS Termin,
    CONCAT(t.Surname, ', ', LEFT(t.Name, 1), '.') AS GlavniTrener
FROM Activities a
JOIN Schedule s ON a.ActivityID = s.ActivityID
JOIN ActivitiesTrainers at ON a.ActivityID = at.ActivityID AND at.IsHeadTrainer = TRUE
JOIN Trainers t ON at.TrainerID = t.TrainerID;

--3
SELECT 
    f.Name AS FitnessCenter,
    COUNT(s.ActivityID) AS BrojAktivnosti
FROM FitnessCenters f
JOIN Schedule s ON f.FitnessCenterID = s.FitnessCenterID
GROUP BY f.FitnessCenterID
ORDER BY BrojAktivnosti DESC
LIMIT 3;

--4
SELECT 
    t.Name AS Ime,
    t.Surname AS Prezime,
    COUNT(s.ActivityID) AS BrojAktivnosti,
    CASE
        WHEN COUNT(s.ActivityID) = 0 THEN 'DOSTUPAN'
        WHEN COUNT(s.ActivityID) <= 3 THEN 'AKTIVAN'
        ELSE 'POTPUNO ZAUZET'
    END AS Status
FROM Trainers t
LEFT JOIN ActivitiesTrainers at ON t.TrainerID = at.TrainerID
LEFT JOIN Schedule s ON at.ActivityID = s.ActivityID
GROUP BY t.TrainerID;

--5
SELECT 
    m.Name AS Ime,
    m.Surname AS Prezime,
	a.Type AS Aktivnost
FROM Members m
JOIN ActivitiesMembers am ON m.MemberID = am.MemberID
JOIN Activities a ON am.ActivityID = a.ActivityID;

--6
SELECT DISTINCT 
    t.Name AS Ime,
    t.Surname AS Prezime,
	s.StartTime AS Termin
FROM Trainers t
JOIN ActivitiesTrainers at ON t.TrainerID = at.TrainerID
JOIN Schedule s ON at.ActivityID = s.ActivityID
WHERE s.StartTime BETWEEN '2019-01-01' AND '2022-12-31'
ORDER BY Termin ASC;

--7
SELECT 
    c.Name AS Država,
    a.Type AS TipAktivnosti,
    AVG(am.ActivityID) AS ProsječanBrojSudjelovanja
FROM Countries c
JOIN Trainers t ON c.CountryID = t.CountryID
JOIN ActivitiesTrainers at ON t.TrainerID = at.TrainerID
JOIN ActivitiesMembers am ON at.ActivityID = am.ActivityID
JOIN Activities a ON am.ActivityID = a.ActivityID
GROUP BY c.Name, a.Type;

--8
SELECT 
    c.Name AS Država,
    COUNT(am.ActivityID) AS BrojSudjelovanja
FROM Countries c
JOIN Trainers t ON c.CountryID = t.CountryID
JOIN ActivitiesTrainers at ON t.TrainerID = at.TrainerID
JOIN ActivitiesMembers am ON at.ActivityID = am.ActivityID
JOIN Activities a ON am.ActivityID = a.ActivityID
WHERE a.Type = 'injury rehabilitation'
GROUP BY c.Name
ORDER BY BrojSudjelovanja DESC
LIMIT 10;

--9
SELECT
	a.ActivityID,
    a.Type AS Aktivnost,
    CASE
        WHEN COUNT(s.ActivityID) < a.MaxMembers THEN 'IMA MJESTA'
        ELSE 'POPUNJENO'
    END AS Status
FROM Activities a
LEFT JOIN Schedule s ON a.ActivityID = s.ActivityID
GROUP BY a.ActivityID, a.MaxMembers;

--10
SELECT 
    t.Name AS Ime,
    t.Surname AS Prezime,
    SUM(a.PricePerSession * member_count) AS Prihod
FROM Trainers t
JOIN ActivitiesTrainers at ON t.TrainerID = at.TrainerID
JOIN Activities a ON at.ActivityID = a.ActivityID
LEFT JOIN (
    SELECT 
        ActivityID, 
        COUNT(MemberID) AS member_count 
    FROM ActivitiesMembers 
    GROUP BY ActivityID
) am ON a.ActivityID = am.ActivityID
GROUP BY t.TrainerID, t.Name, t.Surname
HAVING SUM(a.PricePerSession * member_count) > 0
ORDER BY Prihod DESC
LIMIT 10;
