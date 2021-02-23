
CREATE DATABASE dbUsers
GO
USE dbUsers
GO

CREATE TABLE UserProfile(
UserId INT PRIMARY KEY,
UserName VARCHAR(100),
Membership_UserId INT)

CREATE TABLE webpages_UsersInRoles(
UserId INT NOT NULL,
RoleId INT NOT NULL)

CREATE TABLE webpages_Roles(
RoleId INT PRIMARY KEY,
RoleName VARCHAR(100))

ALTER TABLE webpages_UsersInRoles ADD PRIMARY KEY(UserId,RoleId);

ALTER TABLE webpages_UsersInRoles ADD FOREIGN KEY(UserId) REFERENCES UserProfile(UserId);

ALTER TABLE webpages_UsersInRoles ADD FOREIGN KEY(RoleId) REFERENCES webpages_Roles(RoleId);


---FILL MY DATABASE WITH DATA---

INSERT INTO UserProfile VALUES(1,'Fadi',NULL);

INSERT INTO UserProfile VALUES(3,'Tony',NULL);

INSERT INTO UserProfile VALUES(4,'Joseph',NULL);

INSERT INTO UserProfile VALUES(5,'Osama',NULL);

INSERT INTO UserProfile VALUES(6,'Salim',NULL);


INSERT INTO webpages_Roles VALUES(1,'Admin');

INSERT INTO webpages_Roles VALUES(2,'Manager');


INSERT INTO webpages_UsersInRoles VALUES(1,1);

INSERT INTO webpages_UsersInRoles VALUES(3,1);

INSERT INTO webpages_UsersInRoles VALUES(4,2);

INSERT INTO webpages_UsersInRoles VALUES(5,2);

INSERT INTO webpages_UsersInRoles VALUES(6,2);


SELECT * 
FROM UserProfile u join webpages_UsersInRoles uir ON u.UserId = uir.UserId 
                   join webpages_Roles r on uir.RoleId = r.RoleId 
WHERE u.UserId = 1


SELECT *
FROM UserProfile


