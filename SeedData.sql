COPY FitnessCenters(FitnessCenterID, Name, WorkingHours)
FROM 'C:\Users\Public\Documents\Seeds\FitnessCenter.csv'
DELIMITER ','
CSV HEADER

COPY Countries(CountryID, Name, Population, AverageSalary)
FROM 'C:\Users\Public\Documents\Seeds\Countries.csv'
DELIMITER ','
CSV HEADER

COPY Trainers(TrainerID, Name, Surname, BirthDate, Gender, TrainerType, CountryID, FitnessCenterID)
FROM 'C:\Users\Public\Documents\Seeds\Trainers.csv'
DELIMITER ','
CSV HEADER

COPY Trainers(TrainerID, Name, Surname, BirthDate, Gender, TrainerType, CountryID, FitnessCenterID)
FROM 'C:\Users\Public\Documents\Seeds\Trainers2.csv'
DELIMITER ','
CSV HEADER

COPY Trainers(TrainerID, Name, Surname, BirthDate, Gender, TrainerType, CountryID, FitnessCenterID)
FROM 'C:\Users\Public\Documents\Seeds\Trainers3.csv'
DELIMITER ','
CSV HEADER

COPY Activities(ActivityID, Type, PricePerSession, MaxMembers)
FROM 'C:\Users\Public\Documents\Seeds\Activities.csv'
DELIMITER ','
CSV HEADER

COPY Schedule(ScheduleID, ActivityID, FitnessCenterID, StartTime)
FROM 'C:\Users\Public\Documents\Seeds\Schedule.csv'
DELIMITER ','
CSV HEADER

COPY Schedule(ScheduleID, ActivityID, FitnessCenterID, StartTime)
FROM 'C:\Users\Public\Documents\Seeds\Schedule2.csv'
DELIMITER ','
CSV HEADER

COPY ActivitiesTrainers(ActivitiesTrainersID, ActivityID, TrainerID, IsHeadTrainer)
FROM 'C:\Users\Public\Documents\Seeds\ActivitiesTrainers.csv'
DELIMITER ','
CSV HEADER

COPY ActivitiesTrainers(ActivitiesTrainersID, ActivityID, TrainerID, IsHeadTrainer)
FROM 'C:\Users\Public\Documents\Seeds\ActivitiesTrainers2.csv'
DELIMITER ','
CSV HEADER

COPY Members(MemberID, Name, Surname, MembershipStartDate)
FROM 'C:\Users\Public\Documents\Seeds\Members.csv'
DELIMITER ','
CSV HEADER

COPY Members(MemberID, Name, Surname, MembershipStartDate)
FROM 'C:\Users\Public\Documents\Seeds\Members2.csv'
DELIMITER ','
CSV HEADER

COPY Members(MemberID, Name, Surname, MembershipStartDate)
FROM 'C:\Users\Public\Documents\Seeds\Members3.csv'
DELIMITER ','
CSV HEADER

COPY ActivitiesMembers(ActivitiesMembersID, ActivityID, MemberID)
FROM 'C:\Users\Public\Documents\Seeds\ActivitiesMembers.csv'
DELIMITER ','
CSV HEADER

COPY ActivitiesMembers(ActivitiesMembersID, ActivityID, MemberID)
FROM 'C:\Users\Public\Documents\Seeds\ActivitiesMembers2.csv'
DELIMITER ','
CSV HEADER

COPY ActivitiesMembers(ActivitiesMembersID, ActivityID, MemberID)
FROM 'C:\Users\Public\Documents\Seeds\ActivitiesMembers3.csv'
DELIMITER ','
CSV HEADER

select * from members



