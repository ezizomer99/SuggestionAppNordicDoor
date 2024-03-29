/*create database if not exists webAppDatabase;
use webAppDatabase;
create table if not EXISTS users
(
    EmployeeNumber varchar(20) PRIMARY KEY,
    Name        varchar(255) not null,
    Email     varchar(255) UNIQUE not null,
    Password        varchar(255) not null,
    IsAdmin        boolean not null DEFAULT false
);
insert into users(EmployeeNumber, Name, Email, Password,IsAdmin) values ('1234','Hans Gruber', 'hans@gruber.net','87e68accd414071dc0715d1cfb3ffd2fee1331a5907299fe6f80f6f62611279f',true);
insert into users(EmployeeNumber, Name, Email, Password) values ('1235','John McClane', 'jmcclan@nypd.com','a7144664e26d9985b801fb24ad19128973c143609cff060866c6a27fd55976ed');
insert into users(EmployeeNumber, Name, Email, Password) values ('1236','Colin Powell', 'cpowell@lapd.com','11e9420772d2c61294766d5a4549880480786d1af1a8712adbeaa6a81159fa83');
insert into users(EmployeeNumber, Name, Email, Password) values ('1237','Mr Takagi', 'thebigone@thetower.com','b45bd77a8dac979c466f6ca4e32b7dd1e5c0dfb22fc2e6f70fda585da76d8e59');
insert into users(EmployeeNumber, Name, Email, Password,IsAdmin) values ('0000','Cookie Monster', 'cookies@jar.nom','aa71f196522c6da5ca2155b328d3cb4db51458134ee62bb37fd872a529f655be',true);
insert into users(EmployeeNumber, Name, Email, Password) values ('1239','Bob Lacost', 'bobby@lacost.co','f12958816a49adfa2c6c8de8dd2144c163e92c5e375de964d533187c7d236c36');
insert into users(EmployeeNumber, Name, Email, Password) values ('1240','Lance Wololo', 'wololo@aoe.net','6bbb2195dc0134519a3790a70f2f2025672abb7211e07182c7a980be37271c3f');
insert into users(EmployeeNumber, Name, Email, Password) values ('1241','Mr Alucard', 'alucard@walachia.com','122f9f69bb8b6b7a67cc1215cbaeb7e4e9c64f6de76b6b00d709fc42595d22b3');
insert into users(EmployeeNumber, Name, Email, Password) values ('1242','Karl Johan', 'karl@bernadotte.fr','1ba95f2b333b7ba565ae07043d02693b69095ae467eaecda550506c917dd5bc6');
insert into users(EmployeeNumber, Name, Email, Password) values ('1243','Donald Duck', 'donald@duck.ab','1c430d61219ff413379c8516b0cece1c415577e1a31add27c3fef5ac8456771f');
insert into users(EmployeeNumber, Name, Email, Password) values ('9999','Deleted', 'THIS USER IS DELETED','8a9c7e12979ad09dcec2894d76250b3712978fa97a1ffe11777a009b63d3a806');

create table if not EXISTS teams
(
    TeamID int auto_increment NOT NULL,
    TeamName varchar(100) NOT NULL,
    PRIMARY KEY (TeamID)
);

insert into teams(TeamID, TeamName) values ('1','Salg');
insert into teams(TeamID, TeamName) values ('2','Administrasjon');
insert into teams(TeamID, TeamName) values ('3','Produksjon D�r');
insert into teams(TeamID, TeamName) values ('4','Logistikk');
insert into teams(TeamID, TeamName) values ('5','Rengj�ring');
insert into teams(TeamID, TeamName) values ('6','IT');
insert into teams(TeamID, TeamName) values ('7','Produksjon Rammer');
insert into teams(TeamID, TeamName) values ('8','Produksjon Skillevegg');
insert into teams(TeamID, TeamName) values ('9','Lager i sverige');
insert into teams(TeamID, TeamName) values ('10','Lager Lyngdal');

create table if not EXISTS category
(
    CategoryID int auto_increment NOT NULL,
    CategoryName varchar(100) NOT NULL,
    PRIMARY KEY (CategoryID)
);

insert into category(CategoryID, CategoryName) values ('1','Small Problem');
insert into category(CategoryID, CategoryName) values ('2','Big Problem');
insert into category(CategoryID, CategoryName) values ('3','Expensive');
insert into category(CategoryID, CategoryName) values ('4','In a Hurry');
insert into category(CategoryID, CategoryName) values ('5','Not that important');
insert into category(CategoryID, CategoryName) values ('6','Something');
insert into category(CategoryID, CategoryName) values ('7','Running out of ideas');
insert into category(CategoryID, CategoryName) values ('8','Please help');
insert into category(CategoryID, CategoryName) values ('9','Gib mony');
insert into category(CategoryID, CategoryName) values ('10','Individual');

create table if not EXISTS suggestions
(
    SuggestionID int auto_increment NOT NULL PRIMARY KEY,
    SuggestionMakerID varchar(20),
    CategoryID int NOT NULL,
    TeamID int,
    Title varchar(100) NOT NULL,
    Description varchar(255) NOT NULL,
    Phase varchar(20) NOT NULL,
    Status varchar(50) NOT NULL,
    TimeStamp timestamp NOT NULL,
    Deadline varchar(50) NOT NULL,
    FOREIGN KEY (SuggestionMakerID) REFERENCES users(EmployeeNumber) on delete set null,
    FOREIGN KEY (TeamID) REFERENCES teams(TeamID) on delete set null,
    FOREIGN KEY (CategoryID) REFERENCES category(CategoryID)
);

insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('101','0000','Need More Cookies','2','1','The lack of cookies is concerning','Do','In Progress','YESTERDAY');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('102','1241','Moving the wood storage','1','9','Moving the wood storage to aile 4 will reduce the walking time','Study','In Progress','18.11.2022');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('103','1236','Swaping door knob','4','3','Swaping door knob from knob a to b will improve door','Plan','Done','01.01.2023');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('104','1234','Some admin stuff','3','4','More admin stuff here','Study','Completed','11.11.2022');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('105','1234','Improve prod privacy wall','3','7','By doing this thing we can improve the efficency of production ','Plan','In Progress','01.12.2022');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('106','1237','Change Transport company','9','4','Changing from A to B we can save a lot of money','Do','In Progress','21.11.2022');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('107','1243','Opening sales in Andeby','3','1','Opening a office in Andeby to sell doors would be benefical to me','Plan','In Progress','09.02.2023');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('108','1242','Upgrading Hardwere','1','6','Upgrading software will make systems runn faster','Do','Completed','02.11.2022');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('109','1240','Moving production of Door A to Line 3','4','3','Door A is the most popular door so moving it to biggest line would improve production','Plan','In Progress','30.03.2023');
insert into suggestions(SuggestionID, SuggestionMakerID, Title, CategoryID, TeamID, Description, Phase, Status, Deadline) 
    values ('110','1235','Alarm clocks','10','3','Because everyone cant come on time we have decided to give you all alarm clocks','Act','In Progress','18.12.2022');


create table if not EXISTS comments
(
    CommentID int PRIMARY KEY auto_increment not null,
    SuggestionID int not null,
    EmployeeNumber varchar(20),
    CommentText varchar(100) not null,
    FOREIGN KEY (EmployeeNumber) REFERENCES users(EmployeeNumber) on delete set null,
    FOREIGN KEY (SuggestionID) REFERENCES suggestions(SuggestionID) on delete cascade
);

insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText)
    values ('1','101','1242','Hvorfor trenger vi flere cookies?');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('2','102','1240','Where do we move the current items in aisle 4?');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('3','102','1239','Maybe in the west corner');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('4','104','1236','Admin is important stuff');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('5','106','1237','A comment');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('6','106','1236','Comment 2');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('7','103','1242','Comment 3');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('8','104','1243','fkwjakogkjkwfkawd');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('9','108','1241','dlwakfawkfawkfoawkfaw');
insert into comments(commentID,SuggestionID,EmployeeNumber,CommentText) 
    values ('10','106','1242','23irfksajw0213124');
