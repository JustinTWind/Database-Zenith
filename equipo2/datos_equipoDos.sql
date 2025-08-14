--HU043C5 ya estaba hecho 
INSERT INTO [User] (FullName, Email, PasswordHash, UserType)
VALUES 
('Dra. Laura Gómez', 'laura.gomez@zenith.com', 'hash123', 'Professional'),
('Carlos Pérez', 'carlos.perez@zenith.com', 'hash456', 'Patient'),
('Mariana Ruiz', 'mariana.ruiz@zenith.com', 'hash789', 'Moderator'),
('Dr. Miguel Herrera', 'miguel.herrera@zenith.com', 'hash101', 'Professional'),
('Lucía Fernández', 'lucia.fernandez@zenith.com', 'hash202', 'Patient'),
('Ana Torres', 'ana.torres@zenith.com', 'hash303', 'Patient'),
('Javier Morales', 'javier.morales@zenith.com', 'hash404', 'Moderator');

--tipo profesional 
INSERT INTO [ProfessionalType] ([Name], [Description])
VALUES
('Psicólogo Clínico', 'Profesional especializado en la evaluación, diagnóstico y tratamiento de trastornos emocionales y conductuales.'),

('Psiquiatra', 'Médico especializado en el diagnóstico y tratamiento de trastornos mentales, incluyendo el uso de medicación.'),

('Terapeuta Ocupacional', 'Especialista en ayudar a las personas a desarrollar habilidades para la vida diaria y mejorar su bienestar emocional.'),

('Neuropsicólogo', 'Experto en la evaluación y rehabilitación de funciones cognitivas afectadas por lesiones o trastornos neurológicos.');
--ciudades
INSERT INTO [City] ([Name], [State], [Country])
VALUES
('Medellín', 'Antioquia', 'Colombia'),
('Bogotá', 'Cundinamarca', 'Colombia');

--profesionales
INSERT INTO [Professional] 
([ProfessionalID], [LicenseNumber], [Specialty], [Description], [Photo], [ContactEmail], [Biography], [TypeID], [CityID], [YearsExperience])
VALUES
(1, 'LIC-PSI-001', 'Psicoterapia Cognitivo-Conductual', 'Especialista en terapia para ansiedad y depresión.', 'https://example.com/photos/pro1.jpg', 'maria.garcia@gmail.com', 'Psicóloga con enfoque en adultos jóvenes y manejo de crisis.', 1, 1, 8),

(2, 'LIC-PSIQ-002', 'Psiquiatría Infantil', 'Manejo de trastornos de conducta y emocionales en niños.', 'https://example.com/photos/pro2.jpg', 'juan.rodriguez@gmail.com', 'Psiquiatra con énfasis en terapia familiar y medicación responsable.', 2, 2, 12),

(3, 'LIC-TO-003', 'Terapia Ocupacional en Rehabilitación Psicosocial', 'Apoyo en la reintegración social de pacientes con trastornos mentales.', 'https://example.com/photos/pro3.jpg', 'laura.martinez@gmail.com', 'Terapeuta ocupacional con experiencia en talleres creativos y programas de inclusión.', 3, 1, 7),

(4, 'LIC-NEURO-004', 'Evaluación Neuropsicológica', 'Diagnóstico y tratamiento de alteraciones cognitivas.', 'https://example.com/photos/pro4.jpg', 'carlos.suarez@gmail.com', 'Neuropsicólogo con trayectoria en investigación y trabajo clínico en hospitales.', 4, 1, 10),

(5, 'LIC-PSI-005', 'Terapia de Pareja', 'Atención a parejas y relaciones interpersonales.', 'https://example.com/photos/pro5.jpg', 'ana.lopez@gmail.com', 'Psicóloga clínica especializada en relaciones afectivas y comunicación.', 1, 1, 9);


--HU044C5 crear proyectos
INSERT INTO [Project] ([Name], [Year], [Description], [FileUrl], [ProfessionalID])
VALUES
('Programa de Apoyo Psicológico Universitario', 2024, 'Iniciativa para brindar terapia breve a estudiantes universitarios.', 'https://example.com/files/proyecto1.pdf', 1),

('Red de Atención Psiquiátrica Infantil', 2024, 'Plataforma para coordinar atención médica a niños con problemas emocionales.', 'https://example.com/files/proyecto2.pdf', 2),

('Talleres de Inclusión y Habilidades Sociales', 2025, 'Actividades para la reintegración social de pacientes con trastornos mentales.', 'https://example.com/files/proyecto3.pdf', 3),

('Investigación sobre Memoria y Funciones Ejecutivas', 2025, 'Estudio neuropsicológico sobre memoria en adultos mayores.', 'https://example.com/files/proyecto4.pdf', 4),

('Escuela para Parejas', 2025, 'Programa integral para mejorar la comunicación y resolución de conflictos en parejas.', 'https://example.com/files/proyecto5.pdf', 5);
