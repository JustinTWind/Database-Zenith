-- 1. Usuarios (Pacientes, Profesionales, Moderadores)
INSERT INTO [User] (FullName, Email, PasswordHash, UserType)
VALUES 
('Dra. Laura Gómez', 'laura.gomez@zenith.com', 'hash123', 'Professional'),
('Carlos Pérez', 'carlos.perez@zenith.com', 'hash456', 'Patient'),
('Mariana Ruiz', 'mariana.ruiz@zenith.com', 'hash789', 'Moderator'),
('Dr. Miguel Herrera', 'miguel.herrera@zenith.com', 'hash101', 'Professional'),
('Lucía Fernández', 'lucia.fernandez@zenith.com', 'hash202', 'Patient'),
('Ana Torres', 'ana.torres@zenith.com', 'hash303', 'Patient'),
('Javier Morales', 'javier.morales@zenith.com', 'hash404', 'Moderator');

-- 2. Catálogos
INSERT INTO EventModality (Name, Description)
VALUES
('Virtual', 'Evento en línea mediante videollamada'),
('Presencial', 'Evento realizado en una ubicación física'),
('Híbrido', 'Evento presencial con transmisión en línea');

INSERT INTO EventType (Name, Description)
VALUES
('Conferencia', 'Presentación dirigida a una audiencia sobre un tema específico'),
('Taller', 'Actividad práctica con participación activa de los asistentes'),
('Webinar', 'Seminario en línea sobre un tema especializado');

INSERT INTO EventRole (Name, Description)
VALUES
('Ponente', 'Persona que expone un tema en el evento'),
('Participante', 'Persona que asiste al evento'),
('Organizador', 'Persona encargada de la logística y coordinación del evento');

-- 3. Eventos
INSERT INTO Event (Title, EventTypeID, EventDescription, StartDate, EventModalityID, EndDate, Status)
VALUES
('Taller de Mindfulness para Reducir el Estrés', 2, 'Aprende técnicas prácticas de mindfulness para tu vida diaria', '2025-09-15 10:00', 1, '2025-09-15 12:00', 'Scheduled'),
('Conferencia sobre Depresión y Ansiedad en Jóvenes', 1, 'Charla informativa sobre detección temprana y manejo de la depresión y ansiedad en adolescentes', '2025-09-20 09:00', 3, '2025-09-20 11:30', 'Scheduled'),
('Webinar sobre Autoestima y Resiliencia', 3, 'Sesión virtual para desarrollar habilidades de resiliencia emocional', '2025-10-05 18:00', 1, '2025-10-05 20:00', 'Scheduled'),
('Taller de Comunicación Asertiva', 2, 'Dinámicas y ejercicios para mejorar la comunicación personal y laboral', '2025-10-12 14:00', 2, '2025-10-12 17:00', 'Scheduled'),
('Conferencia Internacional de Psicología Positiva', 1, 'Evento híbrido con ponentes internacionales en psicología positiva', '2025-11-01 09:00', 3, '2025-11-01 18:00', 'Scheduled');

-- 4. Creadores de eventos
INSERT INTO EventCreator (EventID, UserID, RoleInEvent)
VALUES
(1, 1, 'Organizador'), -- Dra. Laura Gómez
(2, 1, 'Ponente'), -- Dra. Laura Gómez
(3, 4, 'Ponente'),  -- Dr. Miguel Herrera
(4, 4, 'Organizador'), -- Dr. Miguel Herrera
(5, 1, 'Ponente');  -- Dra. Laura Gómez

-- 5. Medios del evento
INSERT INTO EventMedia (EventID, MediaType, MediaURL, AltText)
VALUES
(1, 'Banner', 'https://zenith.com/media/mindfulness-banner.jpg', 'Banner promocional del Taller de Mindfulness'),
(2, 'Icon', 'https://zenith.com/media/depresion-icon.png', 'Ícono de la conferencia sobre depresión'),
(3, 'Banner', 'https://zenith.com/media/autoestima-banner.jpg', 'Banner del webinar sobre autoestima'),
(4, 'Icon', 'https://zenith.com/media/comunicacion-icon.png', 'Ícono del taller de comunicación'),
(5, 'Banner', 'https://zenith.com/media/psicologia-positiva-banner.jpg', 'Banner de la conferencia internacional');

-- 6. Registros de participación
INSERT INTO EventRegistration (EventID, UserID, EventRoleID)
VALUES
(1, 2, 2), -- Carlos Pérez como participante en el Taller de Mindfulness
(2, 2, 2), -- Carlos Pérez como participante en la Conferencia
(3, 5, 2), -- Lucía Fernández como participante
(3, 6, 2), -- Ana Torres como participante
(4, 2, 2), -- Carlos Pérez como participante
(4, 5, 2), -- Lucía Fernández como participante
(5, 2, 2), -- Carlos Pérez como participante
(5, 6, 2); -- Ana Torres como participante
Go
