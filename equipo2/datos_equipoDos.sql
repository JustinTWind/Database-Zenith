--HU043C5 ya estaba hecho 
INSERT INTO [User] (FullName, Email, PasswordHash, UserType)
VALUES 
('Dra. Laura G�mez', 'laura.gomez@zenith.com', 'hash123', 'Professional'),
('Carlos P�rez', 'carlos.perez@zenith.com', 'hash456', 'Patient'),
('Mariana Ruiz', 'mariana.ruiz@zenith.com', 'hash789', 'Moderator'),
('Dr. Miguel Herrera', 'miguel.herrera@zenith.com', 'hash101', 'Professional'),
('Luc�a Fern�ndez', 'lucia.fernandez@zenith.com', 'hash202', 'Patient'),
('Ana Torres', 'ana.torres@zenith.com', 'hash303', 'Patient'),
('Javier Morales', 'javier.morales@zenith.com', 'hash404', 'Moderator');

--tipo profesional 
INSERT INTO [ProfessionalType] ([Name], [Description])
VALUES
('Psic�logo Cl�nico', 'Profesional especializado en la evaluaci�n, diagn�stico y tratamiento de trastornos emocionales y conductuales.'),

('Psiquiatra', 'M�dico especializado en el diagn�stico y tratamiento de trastornos mentales, incluyendo el uso de medicaci�n.'),

('Terapeuta Ocupacional', 'Especialista en ayudar a las personas a desarrollar habilidades para la vida diaria y mejorar su bienestar emocional.'),

('Neuropsic�logo', 'Experto en la evaluaci�n y rehabilitaci�n de funciones cognitivas afectadas por lesiones o trastornos neurol�gicos.');
--ciudades
INSERT INTO [City] ([Name], [State], [Country])
VALUES
('Medell�n', 'Antioquia', 'Colombia'),
('Bogot�', 'Cundinamarca', 'Colombia');

--profesionales
INSERT INTO [Professional] 
([ProfessionalID], [LicenseNumber], [Specialty], [Description], [Photo], [ContactEmail], [Biography], [TypeID], [CityID], [YearsExperience])
VALUES
(1, 'LIC-PSI-001', 'Psicoterapia Cognitivo-Conductual', 'Especialista en terapia para ansiedad y depresi�n.', 'https://example.com/photos/pro1.jpg', 'maria.garcia@gmail.com', 'Psic�loga con enfoque en adultos j�venes y manejo de crisis.', 1, 1, 8),

(2, 'LIC-PSIQ-002', 'Psiquiatr�a Infantil', 'Manejo de trastornos de conducta y emocionales en ni�os.', 'https://example.com/photos/pro2.jpg', 'juan.rodriguez@gmail.com', 'Psiquiatra con �nfasis en terapia familiar y medicaci�n responsable.', 2, 2, 12),

(3, 'LIC-TO-003', 'Terapia Ocupacional en Rehabilitaci�n Psicosocial', 'Apoyo en la reintegraci�n social de pacientes con trastornos mentales.', 'https://example.com/photos/pro3.jpg', 'laura.martinez@gmail.com', 'Terapeuta ocupacional con experiencia en talleres creativos y programas de inclusi�n.', 3, 1, 7),

(4, 'LIC-NEURO-004', 'Evaluaci�n Neuropsicol�gica', 'Diagn�stico y tratamiento de alteraciones cognitivas.', 'https://example.com/photos/pro4.jpg', 'carlos.suarez@gmail.com', 'Neuropsic�logo con trayectoria en investigaci�n y trabajo cl�nico en hospitales.', 4, 1, 10),

(5, 'LIC-PSI-005', 'Terapia de Pareja', 'Atenci�n a parejas y relaciones interpersonales.', 'https://example.com/photos/pro5.jpg', 'ana.lopez@gmail.com', 'Psic�loga cl�nica especializada en relaciones afectivas y comunicaci�n.', 1, 1, 9);


--HU044C5 crear proyectos
INSERT INTO [Project] ([Name], [Year], [Description], [FileUrl], [ProfessionalID])
VALUES
('Programa de Apoyo Psicol�gico Universitario', 2024, 'Iniciativa para brindar terapia breve a estudiantes universitarios.', 'https://example.com/files/proyecto1.pdf', 1),

('Red de Atenci�n Psiqui�trica Infantil', 2024, 'Plataforma para coordinar atenci�n m�dica a ni�os con problemas emocionales.', 'https://example.com/files/proyecto2.pdf', 2),

('Talleres de Inclusi�n y Habilidades Sociales', 2025, 'Actividades para la reintegraci�n social de pacientes con trastornos mentales.', 'https://example.com/files/proyecto3.pdf', 3),

('Investigaci�n sobre Memoria y Funciones Ejecutivas', 2025, 'Estudio neuropsicol�gico sobre memoria en adultos mayores.', 'https://example.com/files/proyecto4.pdf', 4),

('Escuela para Parejas', 2025, 'Programa integral para mejorar la comunicaci�n y resoluci�n de conflictos en parejas.', 'https://example.com/files/proyecto5.pdf', 5);
