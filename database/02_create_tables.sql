-- Institutions
CREATE TABLE Institutions (
    InstitutionID INT IDENTITY(1,1) PRIMARY KEY,
    InstitutionName VARCHAR(150),
    InstitutionType VARCHAR(50),
    Location VARCHAR(150),
    ContactEmail VARCHAR(100),
    ContactPhone VARCHAR(20),
    Status VARCHAR(30)
);

-- Students
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    InstitutionID INT,
    FullName VARCHAR(100),
    StudentRoll VARCHAR(50),
    Department VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    DateOfBirth DATE,
    VerificationStatus VARCHAR(30),
    CreatedAt DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (InstitutionID) REFERENCES Institutions(InstitutionID)
);

-- Admins
CREATE TABLE Admins (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    PasswordHash VARCHAR(255),
    Role VARCHAR(50),
    Status VARCHAR(30)
);

-- VerificationRequests
CREATE TABLE VerificationRequests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    InstitutionID INT,
    AdminID INT NULL,
    DocumentType VARCHAR(50),
    DocumentURL VARCHAR(255),
    RequestStatus VARCHAR(30),
    SubmittedAt DATETIME DEFAULT GETDATE(),
    ReviewedAt DATETIME,
    Remarks VARCHAR(255),

    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (InstitutionID) REFERENCES Institutions(InstitutionID),
    FOREIGN KEY (AdminID) REFERENCES Admins(AdminID)
);

-- MetroCards
CREATE TABLE MetroCards (
    CardID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CardNumber VARCHAR(50) UNIQUE,
    Balance DECIMAL(10,2) DEFAULT 0,
    IssueDate DATE,
    ExpiryDate DATE,
    CardStatus VARCHAR(30),

    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- CardTopUps
CREATE TABLE CardTopUps (
    TopUpID INT IDENTITY(1,1) PRIMARY KEY,
    CardID INT,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    TransactionID VARCHAR(100),
    TopUpDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(30),

    FOREIGN KEY (CardID) REFERENCES MetroCards(CardID)
);

-- Stations
CREATE TABLE Stations (
    StationID INT IDENTITY(1,1) PRIMARY KEY,
    StationName VARCHAR(100),
    Location VARCHAR(150),
    Zone VARCHAR(50),
    Status VARCHAR(30)
);

-- Routes
CREATE TABLE Routes (
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    StartStationID INT,
    EndStationID INT,
    DistanceKM DECIMAL(6,2),
    BaseFare DECIMAL(10,2),
    StudentFare DECIMAL(10,2),
    RouteStatus VARCHAR(30),

    FOREIGN KEY (StartStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (EndStationID) REFERENCES Stations(StationID)
);

-- Trips
CREATE TABLE Trips (
    TripID INT IDENTITY(1,1) PRIMARY KEY,
    CardID INT,
    RouteID INT,
    EntryStationID INT,
    ExitStationID INT,
    EntryTime DATETIME,
    ExitTime DATETIME,
    FareDeducted DECIMAL(10,2),
    TripStatus VARCHAR(30),

    FOREIGN KEY (CardID) REFERENCES MetroCards(CardID),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
    FOREIGN KEY (EntryStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (ExitStationID) REFERENCES Stations(StationID)
);

-- PassTypes
CREATE TABLE PassTypes (
    PassTypeID INT IDENTITY(1,1) PRIMARY KEY,
    PassName VARCHAR(100),
    DurationDays INT,
    Price DECIMAL(10,2),
    DiscountRate DECIMAL(5,2),
    Description VARCHAR(255)
);

-- StudentPasses
CREATE TABLE StudentPasses (
    PassID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    PassTypeID INT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(30),

    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (PassTypeID) REFERENCES PassTypes(PassTypeID)
);

-- LostCardReports
CREATE TABLE LostCardReports (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    CardID INT,
    StudentID INT,
    ReportDate DATETIME DEFAULT GETDATE(),
    ReportStatus VARCHAR(30),
    ReplacementCardID INT,
    Remarks VARCHAR(255),

    FOREIGN KEY (CardID) REFERENCES MetroCards(CardID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- FraudAlerts
CREATE TABLE FraudAlerts (
    AlertID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CardID INT,
    AlertType VARCHAR(100),
    Description VARCHAR(255),
    AlertDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(30),

    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CardID) REFERENCES MetroCards(CardID)
);
