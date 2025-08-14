

-- 1. Listar todos los eventos con su tipo, modalidad y estado
SELECT 
    E.EventID,
    E.Title,
    ET.Name AS EventType,
    EM.Name AS Modality,
    E.Status,
    E.StartDate,
    E.EndDate
FROM Event E
JOIN EventType ET ON E.EventTypeID = ET.EventTypeID
JOIN EventModality EM ON E.EventModalityID = EM.EventModalityID;

-- 2. Ver todos los participantes de un evento específico
SELECT 
    E.Title AS EventTitle,
    U.FullName AS ParticipantName,
    ERo.Name AS Role
FROM EventRegistration R
JOIN Event E ON R.EventID = E.EventID
JOIN [User] U ON R.UserID = U.UserID
JOIN EventRole ERo ON R.EventRoleID = ERo.EventRoleID
WHERE E.EventID = 1; -- Cambiar por el ID del evento que se quiera consultar

-- 3. Contar cuántos eventos hay por tipo
SELECT 
    ET.Name AS EventType,
    COUNT(*) AS TotalEvents
FROM Event E
JOIN EventType ET ON E.EventTypeID = ET.EventTypeID
GROUP BY ET.Name;

-- 4. Ver los medios asociados a cada evento
SELECT 
    E.Title AS EventTitle,
    M.MediaType,
    M.MediaURL
FROM EventMedia M
JOIN Event E ON M.EventID = E.EventID;

-- 5. Próximos eventos (fecha actual en adelante)
SELECT 
    E.Title,
    E.StartDate,
    E.EndDate
FROM Event E
WHERE E.StartDate >= GETDATE()
ORDER BY E.StartDate;


-- ========================================================

-- Transacción con Modificación y Eliminación de Registros

-- ========================================================


BEGIN TRANSACTION;

-- 1. MODIFICACIONES
-- Cambiar fecha y descripción del evento 3
UPDATE Event
SET EventDescription = 'Sesión virtual interactiva con ejercicios prácticos para fortalecer autoestima y resiliencia',
    StartDate = '2025-10-06 19:00'
WHERE EventID = 3;

-- Cambiar el correo de Lucía Fernández
UPDATE [User]
SET Email = 'lucia.fernandez2025@zenith.com'
WHERE UserID = 5;

-- Cambiar el título del evento 4
UPDATE Event
SET Title = 'Taller Intensivo de Comunicación Asertiva'
WHERE EventID = 4;

-- 2. ELIMINACIONES
-- Eliminar a Carlos Pérez como participante del evento 4
DELETE FROM EventRegistration
WHERE EventID = 4
  AND UserID = 2;

-- Eliminar completamente el evento 5 y sus dependencias
DELETE FROM EventRegistration WHERE EventID = 5;
DELETE FROM EventCreator WHERE EventID = 5;
DELETE FROM EventMedia WHERE EventID = 5;
DELETE FROM Event WHERE EventID = 5;

--COMMIT;
Rollback;

