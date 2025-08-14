
BEGIN TRANSACTION;

-- =============================================
-- 1. Crear tabla de usuarios
-- =============================================
CREATE TABLE tbl_User (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(200) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(256) NOT NULL,
    UserType NVARCHAR(50) NOT NULL CHECK (UserType IN (N'Patient', N'Professional', N'Moderator')),
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    UpdatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

-- =============================================
-- 2. Crear tabla de tipos de estadísticas
-- =============================================
CREATE TABLE tbl_StatisticType (
    StatisticTypeID INT PRIMARY KEY IDENTITY(1, 1),
    Name NVARCHAR(100) UNIQUE NOT NULL,
    DisplayName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Unit NVARCHAR(20),
    AppliesTo NVARCHAR(20)
);
GO

-- =============================================
-- 3. Crear tabla de estadísticas
-- =============================================
CREATE TABLE tbl_statistic (
    StatisticID INT PRIMARY KEY IDENTITY(1, 1),
    UserID INT NOT NULL,
    StatisticTypeID INT NOT NULL,
    Value DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    CONSTRAINT FK_tbl_statistic_User FOREIGN KEY (UserID) REFERENCES tbl_User(UserID),
    CONSTRAINT FK_tbl_statistic_Type FOREIGN KEY (StatisticTypeID) REFERENCES tbl_StatisticType(StatisticTypeID)
);
GO

-- =============================================
-- 4. Insertar datos de prueba en tbl_User
-- =============================================
INSERT INTO tbl_User (FullName, Email, PasswordHash, UserType, CreatedAt, UpdatedAt)
VALUES
  (N'Ana Torres',    N'ana.torres@example.com',    N'HASH_A1', N'Patient',      '2000-05-01', '2000-05-01'),
  (N'Luis Gómez',    N'luis.gomez@example.com',    N'HASH_L1', N'Professional', '2001-11-01', '2001-11-01'),
  (N'María Pérez',   N'maria.perez@example.com',   N'HASH_M1', N'Patient',      '2005-07-01', '2005-07-01'),
  (N'Carlos Díaz',   N'carlos.diaz@example.com',   N'HASH_C1', N'Moderator',    '2010-03-01', '2010-03-01'),
  (N'Sofía Herrera', N'sofia.herrera@example.com', N'HASH_S1', N'Patient',      '2015-12-01', '2015-12-01');
GO

-- =============================================
-- 5. Insertar tipos de estadísticas
-- =============================================
INSERT INTO tbl_StatisticType (Name, DisplayName, Description, Unit, AppliesTo)
VALUES
  (N'Tiempo Total Sesión En Plataforma',              N'Tiempo de Sesión',             N'Duración total de la sesión en la plataforma', N'minutos',       N'Usuario'),
  (N'Cantidad De Tests Psicológicos Realizados',      N'Número de Tests Realizados',   N'Cantidad de pruebas psicológicas completadas', N'tests',         N'Usuario'),
  (N'Puntaje De Ansiedad Medido En Test',             N'Puntaje de Ansiedad',          N'Nivel de ansiedad medido en el test',          N'puntos',        N'Usuario'),
  (N'Puntaje De Depresión Medido En Test',            N'Puntaje de Depresión',         N'Nivel de depresión medido en el test',         N'puntos',        N'Usuario'),
  (N'Cantidad De Artículos De Psicología Leídos',     N'Artículos Leídos',             N'Cantidad de artículos de psicología leídos',   N'artículos',     N'Usuario'),
  (N'Número De Sesiones De Terapia Realizadas',       N'Número de Sesiones de Terapia',N'Cantidad de sesiones de terapia realizadas',   N'sesiones',      N'Usuario'),
  (N'Calificación Promedio De Satisfacción Del Usuario', N'Satisfacción del Usuario',  N'Calificación promedio de satisfacción',       N'puntos',        N'Usuario'),
  (N'Tiempo Promedio Invertido En Lectura De Contenido', N'Tiempo Promedio de Lectura',N'Tiempo promedio invertido leyendo contenido', N'minutos',       N'Usuario'),
  (N'Número De Interacciones En Comunidad Foros Y Chats', N'Participación en Comunidad',N'Número de interacciones en foros o chats',    N'interacciones', N'Usuario'),
  (N'Porcentaje De Cumplimiento De Objetivos Terapéuticos', N'Cumplimiento de Objetivos', N'Porcentaje de objetivos terapéuticos cumplidos', N'%',        N'Usuario');
GO

-- =============================================
-- 6. Insertar estadísticas
-- =============================================
INSERT INTO tbl_statistic (UserID, StatisticTypeID, Value, Date)
VALUES 
  (1, 1, 75.50, '2000-05-15'),
  (2, 2, 88.75, '2001-11-22'),
  (3, 1, 92.10, '2005-07-30'),
  (4, 3, 67.80, '2010-03-10'),
  (5, 2, 85.00, '2015-12-01'),
  (1, 1, 78.90, '2023-01-10'),
  (2, 3, 90.50, '2024-04-15'),
  (3, 2, 88.25, '2024-07-05'),
  (4, 1, 95.00, '2025-02-20'),
  (5, 3, 80.75, '2025-08-10'); 
GO

-- =============================================
-- 7. Consultas de verificación
-- =============================================
SELECT * FROM tbl_User;
SELECT * FROM tbl_StatisticType;
SELECT * FROM tbl_statistic;

-- =============================================
-- 8. Crear índices para mejorar rendimiento de claves foráneas
-- =============================================
CREATE INDEX IX_tbl_statistic_UserID
ON tbl_statistic (UserID);

CREATE INDEX IX_tbl_statistic_StatisticTypeID
ON tbl_statistic (StatisticTypeID);
GO

-- Eliminar estadísticas

DECLARE @Fechalimite Date = '2024-01-01';

DELETE FROM tbl_statistic
WHERE Date < @Fechalimite;

-- HU043C4 Consultar estadísticas de un usuario específico ordenadas por fecha.

SELECT u.FullName, t.DisplayName, s.Value, s.Date
FROM tbl_statistic sx
JOIN tbl_User u ON s.UserID = u.UserID
JOIN tbl_StatisticType t ON s.StatisticTypeID = t.StatisticTypeID
WHERE s.UserID = 1
ORDER BY s.Date;

ROLLBACK;

COMMIT;
