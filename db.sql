DROP DATABASE if exists booksys ;

CREATE DATABASE booksys ;

USE booksys ;

CREATE TABLE Oid (
    last_id    INT NOT NULL
) ;

CREATE TABLE `Table` (
                         oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         number    INT NOT NULL,
                         places    INT NOT NULL,
                         limits   INT NOT NULL
) ;

CREATE TABLE Customer (
                          oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          name        VARCHAR(32) NOT NULL,
                          phoneNumber  CHAR(13) NOT NULL,
                          id            CHAR(13) NOT NULL,
                          PW            CHAR(13) NOT NULL,
                          blackList      BOOLEAN NOT NULL
) ;

CREATE TABLE WalkIn (
                        oid        int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        covers    int,
                        date        DATE,
                        time        TIME,
                        table_id    int
) ;

CREATE TABLE Reservation (
                             oid           int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                             covers       int,
                             date           DATE,
                             time           TIME,
                             table_id       int,
                             customer_id  int,
                             arrivalTime  TIME
) ;
CREATE TABLE   covidLog(
                              name VARCHAR(32)    NOT NULL,
                              address VARCHAR(32) NOT NULL,
                              phoneNumber CHAR(13) NOT NULL,
                              symptom BOOLEAN NOT NULL,
                              temperature DOUBLE NOT NULL,
                              tableNumber INT NOT NULL
                  
);
CREATE TABLE WaitingList(
                              date   DATE,
                              name VARCHAR(32) NOT NULL,
                              covers INT NOT NULL,
                              table_id int
);
CREATE TABLE Menu(
                              oid   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              type   CHAR(13)   NOT NULL,
                              name VARCHAR(32) NOT NULL,
                              price INT NOT NULL
                              
);
CREATE TABLE pickup(
                              date DATE,
                              oid   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              name VARCHAR(32) NOT NULL,
                              orderedList VARCHAR(32) NOT NULL
);


INSERT INTO `table` VALUES(101,1,1,4);
INSERT INTO `table` VALUES(102,2,2,4);
INSERT INTO `table` VALUES(103,3,3,2);
INSERT INTO `customer` VALUES(1, 'Gab', '010-4413-5698','Gab','1111',false);
INSERT INTO `customer` VALUES(2, 'Arthur', '010-0000-0000','Arthur','2222',true);
INSERT INTO `customer` VALUES(3, 'Dutch', '010-1111-1111','Dutch','3333',false);