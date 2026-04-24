CREATE TABLE [Institutions] (
  [InstitutionID] int PRIMARY KEY IDENTITY(1, 1),
  [InstitutionName] varchar(150),
  [InstitutionType] varchar(50),
  [Location] varchar(150),
  [ContactEmail] varchar(100),
  [ContactPhone] varchar(20),
  [Status] varchar(30)
)
GO

CREATE TABLE [Students] (
  [StudentID] int PRIMARY KEY IDENTITY(1, 1),
  [InstitutionID] int,
  [FullName] varchar(100),
  [StudentRoll] varchar(50),
  [Department] varchar(100),
  [Email] varchar(100),
  [Phone] varchar(20),
  [DateOfBirth] date,
  [VerificationStatus] varchar(30),
  [CreatedAt] datetime
)
GO

CREATE TABLE [Admins] (
  [AdminID] int PRIMARY KEY IDENTITY(1, 1),
  [FullName] varchar(100),
  [Email] varchar(100),
  [PasswordHash] varchar(255),
  [Role] varchar(50),
  [Status] varchar(30)
)
GO

CREATE TABLE [VerificationRequests] (
  [RequestID] int PRIMARY KEY IDENTITY(1, 1),
  [StudentID] int,
  [InstitutionID] int,
  [AdminID] int,
  [DocumentType] varchar(50),
  [DocumentURL] varchar(255),
  [RequestStatus] varchar(30),
  [SubmittedAt] datetime,
  [ReviewedAt] datetime,
  [Remarks] varchar(255)
)
GO

CREATE TABLE [MetroCards] (
  [CardID] int PRIMARY KEY IDENTITY(1, 1),
  [StudentID] int,
  [CardNumber] varchar(50) UNIQUE,
  [Balance] decimal(10,2),
  [IssueDate] date,
  [ExpiryDate] date,
  [CardStatus] varchar(30)
)
GO

CREATE TABLE [CardTopUps] (
  [TopUpID] int PRIMARY KEY IDENTITY(1, 1),
  [CardID] int,
  [Amount] decimal(10,2),
  [PaymentMethod] varchar(50),
  [TransactionID] varchar(100),
  [TopUpDate] datetime,
  [Status] varchar(30)
)
GO

CREATE TABLE [Stations] (
  [StationID] int PRIMARY KEY IDENTITY(1, 1),
  [StationName] varchar(100),
  [Location] varchar(150),
  [Zone] varchar(50),
  [Status] varchar(30)
)
GO

CREATE TABLE [Routes] (
  [RouteID] int PRIMARY KEY IDENTITY(1, 1),
  [StartStationID] int,
  [EndStationID] int,
  [DistanceKM] decimal(6,2),
  [BaseFare] decimal(10,2),
  [StudentFare] decimal(10,2),
  [RouteStatus] varchar(30)
)
GO

CREATE TABLE [Trips] (
  [TripID] int PRIMARY KEY IDENTITY(1, 1),
  [CardID] int,
  [RouteID] int,
  [EntryStationID] int,
  [ExitStationID] int,
  [EntryTime] datetime,
  [ExitTime] datetime,
  [FareDeducted] decimal(10,2),
  [TripStatus] varchar(30)
)
GO

CREATE TABLE [PassTypes] (
  [PassTypeID] int PRIMARY KEY IDENTITY(1, 1),
  [PassName] varchar(100),
  [DurationDays] int,
  [Price] decimal(10,2),
  [DiscountRate] decimal(5,2),
  [Description] varchar(255)
)
GO

CREATE TABLE [StudentPasses] (
  [PassID] int PRIMARY KEY IDENTITY(1, 1),
  [StudentID] int,
  [PassTypeID] int,
  [StartDate] date,
  [EndDate] date,
  [Status] varchar(30)
)
GO

CREATE TABLE [LostCardReports] (
  [ReportID] int PRIMARY KEY IDENTITY(1, 1),
  [CardID] int,
  [StudentID] int,
  [ReportDate] datetime,
  [ReportStatus] varchar(30),
  [ReplacementCardID] int,
  [Remarks] varchar(255)
)
GO

CREATE TABLE [FraudAlerts] (
  [AlertID] int PRIMARY KEY IDENTITY(1, 1),
  [StudentID] int,
  [CardID] int,
  [AlertType] varchar(100),
  [Description] varchar(255),
  [AlertDate] datetime,
  [Status] varchar(30)
)
GO

ALTER TABLE [Students] ADD FOREIGN KEY ([InstitutionID]) REFERENCES [Institutions] ([InstitutionID])
GO

ALTER TABLE [VerificationRequests] ADD FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID])
GO

ALTER TABLE [VerificationRequests] ADD FOREIGN KEY ([InstitutionID]) REFERENCES [Institutions] ([InstitutionID])
GO

ALTER TABLE [VerificationRequests] ADD FOREIGN KEY ([AdminID]) REFERENCES [Admins] ([AdminID])
GO

ALTER TABLE [MetroCards] ADD FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID])
GO

ALTER TABLE [CardTopUps] ADD FOREIGN KEY ([CardID]) REFERENCES [MetroCards] ([CardID])
GO

ALTER TABLE [Routes] ADD FOREIGN KEY ([StartStationID]) REFERENCES [Stations] ([StationID])
GO

ALTER TABLE [Routes] ADD FOREIGN KEY ([EndStationID]) REFERENCES [Stations] ([StationID])
GO

ALTER TABLE [Trips] ADD FOREIGN KEY ([CardID]) REFERENCES [MetroCards] ([CardID])
GO

ALTER TABLE [Trips] ADD FOREIGN KEY ([RouteID]) REFERENCES [Routes] ([RouteID])
GO

ALTER TABLE [Trips] ADD FOREIGN KEY ([EntryStationID]) REFERENCES [Stations] ([StationID])
GO

ALTER TABLE [Trips] ADD FOREIGN KEY ([ExitStationID]) REFERENCES [Stations] ([StationID])
GO

ALTER TABLE [StudentPasses] ADD FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID])
GO

ALTER TABLE [StudentPasses] ADD FOREIGN KEY ([PassTypeID]) REFERENCES [PassTypes] ([PassTypeID])
GO

ALTER TABLE [LostCardReports] ADD FOREIGN KEY ([CardID]) REFERENCES [MetroCards] ([CardID])
GO

ALTER TABLE [LostCardReports] ADD FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID])
GO

ALTER TABLE [FraudAlerts] ADD FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID])
GO

ALTER TABLE [FraudAlerts] ADD FOREIGN KEY ([CardID]) REFERENCES [MetroCards] ([CardID])
GO
