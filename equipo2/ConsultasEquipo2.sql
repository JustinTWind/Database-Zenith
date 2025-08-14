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
select p.ProfessionalID as Id_Professional, u.FullName as [Name], 
pt.[Name] as Professional_Type, count(j.ProjectID) as Cant_Projects
from Professional p
inner join [User] u on  p.UserID = u.UserID
inner join project j on j.ProfessionalID = p.ProfessionalID
inner join ProfessionalType pt on p.TypeID = pt.TypeID
where u.UserType = 'Professional'
group by p.ProfessionalID,u.FullName,pt.[Name]
order by Cant_Projects asc;
