CREATE TABLE FitnessCenters (
	FitnessCenterID SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	WorkingHours VARCHAR(50) NOT NULL
);

CREATE TABLE Countries (
	CountryID SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL UNIQUE,
	Population INT NOT NULL,
	AverageSalary DECIMAL(10, 2) NOT NULL
);

ALTER TABLE Countries
ALTER COLUMN Name TYPE VARCHAR(50);

CREATE TABLE Trainers (
	TrainerID SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Surname VARCHAR(20) NOT NULL,
	BirthDate DATE NOT NULL,
	Gender CHAR(1) NOT NULL CHECK (Gender IN('M','Z')),
	TrainerType VARCHAR(20) NOT NULL CHECK (TrainerType IN('Glavni','Pomocni')),
	CountryID INT REFERENCES Countries(CountryID),
	FitnessCenterID INT REFERENCES FitnessCenters(FitnessCenterID)
);

CREATE TABLE Activities (
	ActivityID SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Type VARCHAR(30) NOT NULL CHECK (Type IN('trening snage', 'kardio', 'yoga', 'ples', 'injury rehabilitation')),
	PricePerSession DECIMAL(10, 2) NOT NULL,
	MaxMembers INT NOT NULL
);

ALTER TABLE Activities
	DROP COLUMN Name

CREATE TABLE Schedule (
	ScheduleID SERIAL PRIMARY KEY,
	ActivityID INT REFERENCES Activities(ActivityID),
    FitnessCenterID INT REFERENCES FitnessCenters(FitnessCenterID),
    StartTime TIMESTAMP NOT NULL
);

CREATE TABLE ActivitiesTrainers (
	ActivitiesTrainersID SERIAL PRIMARY KEY,
	ActivityID INT REFERENCES Activities(ActivityID),
    TrainerID INT REFERENCES Trainers(TrainerID),
    IsHeadTrainer BOOLEAN NOT NULL
);

CREATE UNIQUE INDEX OneHeadTrainerPerActivity
ON ActivitiesTrainers (ActivityID)
WHERE IsHeadTrainer;

CREATE FUNCTION CheckHeadTrainerLimit()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM ActivitiesTrainers WHERE TrainerID = NEW.TrainerID AND IsHeadTrainer = TRUE) >= 2 THEN
        RAISE EXCEPTION 'Trainer can only be head trainer on at most two activities.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER HeadTrainerLimitTrigger
BEFORE INSERT OR UPDATE ON ActivitiesTrainers
FOR EACH ROW
WHEN (NEW.IsHeadTrainer = TRUE)
EXECUTE FUNCTION CheckHeadTrainerLimit();

CREATE TABLE Members (
	MemberID SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Surname VARCHAR(50) NOT NULL,
	MembershipStartDate DATE NOT NULL
);

CREATE TABLE ActivitiesMembers (
	ActivitiesMembersID SERIAL PRIMARY KEY,
	ActivityID INT REFERENCES Activities(ActivityID),
    MemberID INT REFERENCES Members(MemberID),
	UNIQUE(ActivityID, MemberID)
);












