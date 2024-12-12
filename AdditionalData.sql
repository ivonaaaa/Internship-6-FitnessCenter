INSERT INTO Activities (ActivityID, Type, PricePerSession, MaxMembers) VALUES 
(1001, 'trening snage', 30.00, 20),
(1002, 'kardio', 15.00, 30);

INSERT INTO Trainers (TrainerID, Name, Surname, BirthDate, Gender, TrainerType, CountryID, FitnessCenterID) VALUES 
(4001, 'Ron', 'McDonald', '1985-05-15', 'M', 'Pomocni', 1, 1),
(4002, 'Lisa', 'Beckett', '1990-08-20', 'Z', 'Pomocni', 2, 1);

INSERT INTO Schedule (ScheduleID, ActivityID, FitnessCenterID, StartTime) VALUES 
(2001, 1, 1, '2020-03-01 10:00:00'),
(2002, 2, 1, '2021-06-15 09:00:00');

INSERT INTO ActivitiesTrainers (ActivitiesTrainersID, ActivityID, TrainerID, IsHeadTrainer) VALUES 
(3001, 1, 4001, FALSE),
(3002, 2, 4002, TRUE);
