-- ContactList
INSERT INTO ContactList (UserID, ContactUserID, Status, CreatedAt) VALUES (1, 5, 'Pending', SYSUTCDATETIME());
INSERT INTO ContactList (UserID, ContactUserID, Status, CreatedAt) VALUES (2, 4, 'Accepted', SYSUTCDATETIME());
INSERT INTO ContactList (UserID, ContactUserID, Status, CreatedAt) VALUES (3, 3, 'Blocked', SYSUTCDATETIME());
INSERT INTO ContactList (UserID, ContactUserID, Status, CreatedAt) VALUES (4, 2, 'Accepted', SYSUTCDATETIME());
INSERT INTO ContactList (UserID, ContactUserID, Status, CreatedAt) VALUES (5, 1, 'Pending', SYSUTCDATETIME());

-- ChatRoom
INSERT INTO ChatRoom (Name, IsGroup, CreatedAt) VALUES ('ChatRoom_1', 1, SYSUTCDATETIME());
INSERT INTO ChatRoom (Name, IsGroup, CreatedAt) VALUES ('ChatRoom_2', 0, SYSUTCDATETIME());
INSERT INTO ChatRoom (Name, IsGroup, CreatedAt) VALUES ('ChatRoom_3', 1, SYSUTCDATETIME());
INSERT INTO ChatRoom (Name, IsGroup, CreatedAt) VALUES ('ChatRoom_4', 0, SYSUTCDATETIME());
INSERT INTO ChatRoom (Name, IsGroup, CreatedAt) VALUES ('ChatRoom_5', 1, SYSUTCDATETIME());

-- ChatParticipant
INSERT INTO ChatParticipant (ChatRoomID, UserID, JoinedAt, IsAdmin) VALUES (1, 1, SYSUTCDATETIME(), 1);
INSERT INTO ChatParticipant (ChatRoomID, UserID, JoinedAt, IsAdmin) VALUES (2, 2, SYSUTCDATETIME(), 0);
INSERT INTO ChatParticipant (ChatRoomID, UserID, JoinedAt, IsAdmin) VALUES (3, 3, SYSUTCDATETIME(), 0);
INSERT INTO ChatParticipant (ChatRoomID, UserID, JoinedAt, IsAdmin) VALUES (4, 4, SYSUTCDATETIME(), 0);
INSERT INTO ChatParticipant (ChatRoomID, UserID, JoinedAt, IsAdmin) VALUES (5, 5, SYSUTCDATETIME(), 0);

-- Message
INSERT INTO Message (ChatRoomID, SenderID, Content, SentAt, IsRead) VALUES (1, 1, 'Hola soy Dariannys', SYSUTCDATETIME(), 0);
INSERT INTO Message (ChatRoomID, SenderID, Content, SentAt, IsRead) VALUES (2, 2, 'Hola soy Jose Jesus', SYSUTCDATETIME(), 0);
INSERT INTO Message (ChatRoomID, SenderID, Content, SentAt, IsRead) VALUES (3, 3, 'Hola soy Javier', SYSUTCDATETIME(), 0);
INSERT INTO Message (ChatRoomID, SenderID, Content, SentAt, IsRead) VALUES (4, 4, 'Hola soy Sara', SYSUTCDATETIME(), 0);
INSERT INTO Message (ChatRoomID, SenderID, Content, SentAt, IsRead) VALUES (5, 5, 'Hola soy Sofia', SYSUTCDATETIME(), 0);