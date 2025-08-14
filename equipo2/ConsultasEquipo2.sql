 --HU045C5
SELECT 
    p.ProjectID,
    p.Name AS ProjectName,
    p.Year,
    p.Description AS ProjectDescription,
    pt.Name AS ProfessionalType
FROM Project p
JOIN Professional pr ON p.ProfessionalID = pr.ProfessionalID
JOIN ProfessionalType pt ON pr.TypeID = pt.TypeID
WHERE pr.ProfessionalID = 4;

--HU048C5 LISTAR PROFESIONALES Y SUS PROYECTOS
select p.ProfessionalID, u.FullName, pt.[Name], y.[Name], y.[Year], y.[Description] from Professional p
inner join [User] u on  p.UserID = u.UserID
inner join project y on y.ProfessionalID = p.ProfessionalID
inner join ProfessionalType pt on p.TypeID = pt.TypeID
where u.FullName LIKE 'Dr%'