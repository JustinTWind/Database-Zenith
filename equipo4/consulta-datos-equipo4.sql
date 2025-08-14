-- Verificar ContactList
SELECT * FROM ContactList;

-- Verificar ChatRoom
SELECT * FROM ChatRoom;

-- Verificar ChatParticipant
SELECT * FROM ChatParticipant;

-- Verificar Message
SELECT * FROM Message;

-- Eliminar mensajes recientes
DELETE FROM Message WHERE SenderID IN (1, 2, 3, 4, 5);

-- Eliminar participantes recientes
DELETE FROM ChatParticipant WHERE UserID IN (1, 2, 3, 4, 5);

-- Eliminar salas creadas
DELETE FROM ChatRoom WHERE Name IN ('ChatRoom_1', 'ChatRoom_2', 'ChatRoom_3', 'ChatRoom_4', 'ChatRoom_5');

-- Eliminar relaciones de contacto recientes
DELETE FROM ContactList WHERE UserID IN (1, 2, 3, 4, 5);

-- Cambiar estado de contactos (por ejemplo, marcar todos como 'Accepted')
UPDATE ContactList SET Status = 'Accepted' WHERE UserID IN (1, 2, 3, 4, 5);

-- O cambiar cada uno individualmente si prefieres
 UPDATE ContactList SET Status = 'Blocked' WHERE UserID = 3;
 UPDATE ContactList SET Status = 'Accepted' WHERE UserID = 1;