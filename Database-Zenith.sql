create database ZenithDatabase
Use ZenithDatabase

CREATE TABLE [User] (
  [UserID] int PRIMARY KEY IDENTITY(1, 1),
  [FullName] varchar(200) NOT NULL,
  [Email] varchar(150) UNIQUE NOT NULL,
  [PasswordHash] varchar(256) NOT NULL,
  [UserType] varchar(50) NOT NULL,
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [UpdatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [Patient] (
  [PatientID] int PRIMARY KEY,
  [DateOfBirth] date NOT NULL,
  [Gender] varchar(20),
  [Address] varchar(250),
  [PhoneNumber] varchar(20)
)
GO

CREATE TABLE [Professional] (
  [ProfessionalID] int PRIMARY KEY,
  [LicenseNumber] varchar(50) NOT NULL,
  [Specialty] varchar(100) NOT NULL,
  [Description] varchar(MAX),
  [Photo] varchar(255),
  [ContactEmail] varchar(150),
  [Biography] varchar(MAX),
  [TypeID] int NOT NULL,
  [CityID] int,
  [YearsExperience] int NOT NULL,
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [UpdatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [Moderator] (
  [ModeratorID] int PRIMARY KEY,
  [AssignedArea] varchar(100),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [UpdatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [TherapeuticRelationship] (
  [RelationshipID] int PRIMARY KEY IDENTITY(1, 1),
  [PatientID] int NOT NULL,
  [ProfessionalID] int NOT NULL,
  [StartDate] date NOT NULL,
  [EndDate] date,
  [IsActive] bit NOT NULL DEFAULT (1)
)
GO

CREATE TABLE [Appointment] (
  [AppointmentID] int PRIMARY KEY IDENTITY(1, 1),
  [PatientID] int NOT NULL,
  [ProfessionalID] int NOT NULL,
  [AppointmentDateTime] datetime2 NOT NULL,
  [Modality] varchar(20) NOT NULL,
  [SessionType] varchar(20) NOT NULL,
  [Location] varchar(200),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [UpdatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [Commission] (
  [CommissionID] int PRIMARY KEY IDENTITY(1, 1),
  [AppointmentID] int NOT NULL,
  [BaseRate] decimal(5,2) NOT NULL,
  [ModalityFactor] decimal(5,2) NOT NULL,
  [SessionTypeFactor] decimal(5,2) NOT NULL,
  [VolumeFactor] decimal(5,2) NOT NULL,
  [SealFactor] decimal(5,2) NOT NULL,
  [SeniorityFactor] decimal(5,2) NOT NULL,
  [TotalCommission] decimal(7,2) NOT NULL,
  [CalculatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [EmotionalLog] (
  [LogID] int PRIMARY KEY IDENTITY(1, 1),
  [PatientID] int NOT NULL,
  [LogDate] date NOT NULL,
  [ScaleType] varchar(50) NOT NULL,
  [Value] int NOT NULL,
  [Description] varchar(1000),
  [SharedWithTherapist] bit NOT NULL DEFAULT (0),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [TherapeuticExercise] (
  [ExerciseID] int PRIMARY KEY IDENTITY(1, 1),
  [Title] varchar(200) NOT NULL,
  [Description] varchar(MAX),
  [CreatedByProfessionalID] int,
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [ExerciseAssignment] (
  [AssignmentID] int PRIMARY KEY IDENTITY(1, 1),
  [ExerciseID] int NOT NULL,
  [PatientID] int NOT NULL,
  [Frequency] varchar(20) NOT NULL,
  [StartDate] date NOT NULL,
  [EndDate] date,
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [ProgressReport] (
  [ReportID] int PRIMARY KEY IDENTITY(1, 1),
  [PatientID] int NOT NULL,
  [ProfessionalID] int NOT NULL,
  [ReportDate] datetime2 NOT NULL,
  [Notes] varchar(MAX)
)
GO

CREATE TABLE [Feedback] (
  [FeedbackID] int PRIMARY KEY IDENTITY(1, 1),
  [PatientID] int NOT NULL,
  [ProfessionalID] int NOT NULL,
  [Rating] int NOT NULL,
  [Comments] varchar(MAX),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [EventType] (
  [EventTypeID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(100) UNIQUE NOT NULL,
  [Description] varchar(255)
)
GO

CREATE TABLE [Event] (
  [EventID] int PRIMARY KEY IDENTITY(1, 1),
  [Title] varchar(200) NOT NULL,
  [EventTypeID] int NOT NULL,
  [EventDescription] varchar(MAX),
  [StartDate] datetime2 NOT NULL,
  [EventModalityID] int NOT NULL,
  [EndDate] datetime2,
  [Status] varchar(50) NOT NULL DEFAULT 'Scheduled',
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [UpdatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [EventCreator] (
  [EventID] int NOT NULL,
  [UserID] int NOT NULL,
  [RoleInEvent] varchar(50),
  PRIMARY KEY ([EventID], [UserID])
)
GO

CREATE TABLE [EventRole] (
  [EventRoleID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(50) UNIQUE NOT NULL,
  [Description] varchar(200)
)
GO

CREATE TABLE [EventRegistration] (
  [RegistrationID] int PRIMARY KEY IDENTITY(1, 1),
  [EventID] int NOT NULL,
  [UserID] int NOT NULL,
  [EventRoleID] int NOT NULL,
  [RegistrationDate] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [EventMedia] (
  [MediaID] int PRIMARY KEY IDENTITY(1, 1),
  [EventID] int NOT NULL,
  [MediaType] varchar(50) NOT NULL,
  [MediaURL] varchar(500) NOT NULL,
  [AltText] varchar(255),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [EventModality] (
  [EventModalityID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(50) UNIQUE NOT NULL,
  [Description] varchar(MAX)
)
GO

CREATE TABLE [MalpracticeReport] (
  [ReportID] int PRIMARY KEY IDENTITY(1, 1),
  [ReporterID] int NOT NULL,
  [ProfessionalID] int NOT NULL,
  [ReportDate] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [Description] varchar(MAX),
  [Status] varchar(20) NOT NULL DEFAULT 'Pending',
  [ResolvedByModeratorID] int,
  [ResolutionNotes] varchar(MAX)
)
GO

CREATE TABLE [ClinicalRecord] (
  [RecordID] int PRIMARY KEY IDENTITY(1, 1),
  [PatientID] int NOT NULL,
  [ProfessionalID] int NOT NULL,
  [Diagnosis] varchar(MAX),
  [Treatment] varchar(MAX),
  [Medication] varchar(MAX),
  [Notes] varchar(MAX),
  [RecordDate] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [PrivacySetting] (
  [SettingID] int PRIMARY KEY IDENTITY(1, 1),
  [PatientID] int NOT NULL,
  [CanShareEmotions] bit NOT NULL DEFAULT (0),
  [CanShareReports] bit NOT NULL DEFAULT (0),
  [DataRetentionConsent] bit NOT NULL DEFAULT (0),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [SupportTicket] (
  [TicketID] int PRIMARY KEY IDENTITY(1, 1),
  [UserID] int NOT NULL,
  [Subject] varchar(200),
  [Description] varchar(MAX),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [ResolvedAt] datetime2,
  [Status] varchar(20) NOT NULL DEFAULT 'Open',
  [AssignedModeratorID] int
)
GO

CREATE TABLE [ContactList] (
  [ContactID] int PRIMARY KEY IDENTITY(1, 1),
  [UserID] int NOT NULL,
  [ContactUserID] int NOT NULL,
  [Status] varchar(20) NOT NULL,
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [ChatRoom] (
  [ChatRoomID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(100),
  [IsGroup] bit NOT NULL DEFAULT (0),
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE TABLE [ChatParticipant] (
  [ChatRoomID] int,
  [UserID] int,
  [JoinedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [IsAdmin] bit NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [Message] (
  [MessageID] int PRIMARY KEY IDENTITY(1, 1),
  [ChatRoomID] int NOT NULL,
  [SenderID] int NOT NULL,
  [Content] varchar(MAX) NOT NULL,
  [SentAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME()),
  [IsRead] bit NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [StatisticType] (
  [StatisticTypeID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(50) UNIQUE NOT NULL,
  [DisplayName] varchar(100) NOT NULL,
  [Description] varchar(MAX),
  [Unit] varchar(20),
  [AppliesTo] varchar(20)
)
GO

CREATE TABLE [Statistic] (
  [StatisticID] int PRIMARY KEY IDENTITY(1, 1),
  [UserID] int NOT NULL,
  [StatisticTypeID] int NOT NULL,
  [Value] decimal(10,2) NOT NULL,
  [Date] date NOT NULL
)
GO

CREATE TABLE [ProfessionalType] (
  [TypeID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(50) UNIQUE NOT NULL,
  [Description] varchar(MAX)
)
GO

CREATE TABLE [City] (
  [CityID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(100) NOT NULL,
  [State] varchar(100),
  [Country] varchar(100)
)
GO

CREATE TABLE [Project] (
  [ProjectID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(200) NOT NULL,
  [Year] int NOT NULL,
  [Description] varchar(MAX),
  [FileUrl] varchar(255),
  [ProfessionalID] int NOT NULL,
  [CreatedAt] datetime2 NOT NULL DEFAULT (SYSUTCDATETIME())
)
GO

CREATE UNIQUE INDEX [EventRegistration_index_0] ON [EventRegistration] ("EventID", "UserID")
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Patient, Professional, Moderator',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'User',
@level2type = N'Column', @level2name = 'UserType';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Online, InPerson, Hybrid',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Appointment',
@level2type = N'Column', @level2name = 'Modality';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Individual, Couple, Group',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Appointment',
@level2type = N'Column', @level2name = 'SessionType';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'CHECK: Value BETWEEN 0 AND 10',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'EmotionalLog',
@level2type = N'Column', @level2name = 'Value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Daily, Weekly, etc.',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ExerciseAssignment',
@level2type = N'Column', @level2name = 'Frequency';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'CHECK: Rating BETWEEN 1 AND 5',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Feedback',
@level2type = N'Column', @level2name = 'Rating';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Conferencia, Taller, Webinar',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'EventType',
@level2type = N'Column', @level2name = 'Name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Creado, Confirmado, Cancelado, Completado',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Event',
@level2type = N'Column', @level2name = 'Status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Organizador, Co-Organizador',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'EventCreator',
@level2type = N'Column', @level2name = 'RoleInEvent';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Participante, Ponente, VIP',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'EventRole',
@level2type = N'Column', @level2name = 'Name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Banner, Icon, Video',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'EventMedia',
@level2type = N'Column', @level2name = 'MediaType';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Virtual, Presencial, Híbrido',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'EventModality',
@level2type = N'Column', @level2name = 'Name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Pending, Accepted, Blocked',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ContactList',
@level2type = N'Column', @level2name = 'Status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Patient, Professional, Moderator',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'StatisticType',
@level2type = N'Column', @level2name = 'AppliesTo';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'e.g., Specialist, General, Psychiatrist',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ProfessionalType',
@level2type = N'Column', @level2name = 'Name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Path to PDF or image',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Project',
@level2type = N'Column', @level2name = 'FileUrl';
GO

ALTER TABLE [Patient] ADD FOREIGN KEY ([PatientID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Professional] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Professional] ADD FOREIGN KEY ([TypeID]) REFERENCES [ProfessionalType] ([TypeID])
GO

ALTER TABLE [Professional] ADD FOREIGN KEY ([CityID]) REFERENCES [City] ([CityID])
GO

ALTER TABLE [Moderator] ADD FOREIGN KEY ([ModeratorID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [TherapeuticRelationship] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [TherapeuticRelationship] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO

ALTER TABLE [Appointment] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [Appointment] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO

ALTER TABLE [Commission] ADD FOREIGN KEY ([AppointmentID]) REFERENCES [Appointment] ([AppointmentID])
GO

ALTER TABLE [EmotionalLog] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [TherapeuticExercise] ADD FOREIGN KEY ([CreatedByProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO

ALTER TABLE [ExerciseAssignment] ADD FOREIGN KEY ([ExerciseID]) REFERENCES [TherapeuticExercise] ([ExerciseID])
GO

ALTER TABLE [ExerciseAssignment] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [ProgressReport] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [ProgressReport] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO

ALTER TABLE [Feedback] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [Feedback] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO

ALTER TABLE [Event] ADD FOREIGN KEY ([EventTypeID]) REFERENCES [EventType] ([EventTypeID])
GO

ALTER TABLE [Event] ADD FOREIGN KEY ([EventModalityID]) REFERENCES [EventModality] ([EventModalityID])
GO

ALTER TABLE [EventCreator] ADD FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID])
GO

ALTER TABLE [EventCreator] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [EventRegistration] ADD FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID])
GO

ALTER TABLE [EventRegistration] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [EventRegistration] ADD FOREIGN KEY ([EventRoleID]) REFERENCES [EventRole] ([EventRoleID])
GO

ALTER TABLE [EventMedia] ADD FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID])
GO

ALTER TABLE [MalpracticeReport] ADD FOREIGN KEY ([ReporterID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [MalpracticeReport] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO

ALTER TABLE [MalpracticeReport] ADD FOREIGN KEY ([ResolvedByModeratorID]) REFERENCES [Moderator] ([ModeratorID])
GO

ALTER TABLE [ClinicalRecord] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [ClinicalRecord] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO

ALTER TABLE [PrivacySetting] ADD FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID])
GO

ALTER TABLE [SupportTicket] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [SupportTicket] ADD FOREIGN KEY ([AssignedModeratorID]) REFERENCES [Moderator] ([ModeratorID])
GO

ALTER TABLE [ContactList] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [ContactList] ADD FOREIGN KEY ([ContactUserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [ChatParticipant] ADD FOREIGN KEY ([ChatRoomID]) REFERENCES [ChatRoom] ([ChatRoomID])
GO

ALTER TABLE [ChatParticipant] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Message] ADD FOREIGN KEY ([ChatRoomID]) REFERENCES [ChatRoom] ([ChatRoomID])
GO

ALTER TABLE [Message] ADD FOREIGN KEY ([SenderID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Statistic] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Statistic] ADD FOREIGN KEY ([StatisticTypeID]) REFERENCES [StatisticType] ([StatisticTypeID])
GO

ALTER TABLE [Project] ADD FOREIGN KEY ([ProfessionalID]) REFERENCES [Professional] ([ProfessionalID])
GO
