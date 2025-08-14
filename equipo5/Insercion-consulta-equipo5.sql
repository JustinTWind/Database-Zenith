
BEGIN TRANSACTION;

-- 1. Insertar tipos de estadísticas
INSERT INTO StatisticType (Name, DisplayName, Description, Unit, AppliesTo)
VALUES
  ('Tiempo Total Sesión En Plataforma',              'Tiempo de Sesión',             'Duración total de la sesión en la plataforma', 'minutos',       'Usuario'),
  ('Cantidad De Tests Psicológicos Realizados',      'Número de Tests Realizados',   'Cantidad de pruebas psicológicas completadas', 'tests',         'Usuario'),
  ('Puntaje De Ansiedad Medido En Test',             'Puntaje de Ansiedad',          'Nivel de ansiedad medido en el test',          'puntos',        'Usuario'),
  ('Puntaje De Depresión Medido En Test',            'Puntaje de Depresión',         'Nivel de depresión medido en el test',         'puntos',        'Usuario'),
  ('Cantidad De Artículos De Psicología Leídos',     'Artículos Leídos',             'Cantidad de artículos de psicología leídos',   'artículos',     'Usuario'),
  ('Número De Sesiones De Terapia Realizadas',       'Número de Sesiones de Terapia','Cantidad de sesiones de terapia realizadas',   'sesiones',      'Usuario'),
  ('Calificación Promedio De Satisfacción Del Usuario', 'Satisfacción del Usuario',  'Calificación promedio de satisfacción',       'puntos',        'Usuario'),
  ('Tiempo Promedio Invertido En Lectura De Contenido', 'Tiempo Promedio de Lectura','Tiempo promedio invertido leyendo contenido', 'minutos',       'Usuario'),
  ('Número De Interacciones En Comunidad Foros Y Chats', 'Participación en Comunidad','Número de interacciones en foros o chats',    'interacciones', 'Usuario'),
  ('Porcentaje De Cumplimiento De Objetivos Terapéuticos', 'Cumplimiento de Objetivos', 'Porcentaje de objetivos terapéuticos cumplidos', '%',        'Usuario');
GO

INSERT INTO Statistic (UserID, StatisticTypeID, Value, Date)
VALUES
(1, 11, 120.00, '2025-08-13'), -- Tiempo Total Sesión En Plataforma
(1, 12, 85.00,  '2025-08-13'), -- Porcentaje de Cumplimiento
(2, 13, 10.00,  '2025-08-13'), -- Cantidad de Tests Psicológicos
(2, 14, 4.50,   '2025-08-13'); -- Calificación Promedio Satisfacción

-- 3. Consultas de verificación
SELECT * FROM [User];
SELECT * FROM StatisticType; --  Hay que fijarse primero en los ID's para poder cambiarlos en la Query de arriba, si se usan ID's que no existen, se jode todo
SELECT * FROM Statistic;
GO 

-- 4. Crear índices para optimizar búsquedas
CREATE INDEX IX_Statistic_UserID
ON Statistic (UserID);

CREATE INDEX IX_Statistic_StatisticTypeID
ON Statistic (StatisticTypeID);
GO


ROLLBACK;

COMMIT;
