DROP DATABASE if exists booksys ;

CREATE DATABASE booksys default character set utf8;

USE booksys ;

CREATE TABLE Oid (
  `last_id` int(11) NOT NULL
) ;

CREATE TABLE `Table` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `places` int(11) NOT NULL,
  `limits` int(11) NOT NULL,
  PRIMARY KEY (`oid`)
) ;

CREATE TABLE Customer (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `phoneNumber` char(13) NOT NULL,
  `id` char(13) NOT NULL,
  `blackList` varchar(13) NOT NULL,
  PRIMARY KEY (`oid`)
) ;

CREATE TABLE WalkIn (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `covers` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `verifyCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ;

CREATE TABLE Reservation (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `covers` int(11) DEFAULT NULL,
  `date` varchar(32) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `customer_name` varchar(32) DEFAULT NULL,
  `arrivalTime` time DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ;
CREATE TABLE ReservationRequest	(
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `covers` int(11) DEFAULT NULL,
  `date` varchar(32) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `customer_name` varchar(32) DEFAULT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `verifyCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
);
CREATE TABLE covidlog(
  `date` varchar(32) NOT NULL,
  `time_num` varchar(32) NOT NULL,
  `table_num` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` varchar(32) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `symptom` varchar(32) NOT NULL,
  `temperature` double NOT NULL
);
CREATE TABLE WaitingList(
  `date` varchar(32) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `covers` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `verifyCode` int(11) DEFAULT NULL
);
CREATE TABLE Menu(
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(13) NOT NULL,
  `name` varchar(32) NOT NULL,
  `price` int(11) NOT NULL,
  `notice` varchar(100) NOT NULL,
  `imageURL` varchar(100) DEFAULT NULL,
  `cookingTime` int(11) NOT NULL,
  PRIMARY KEY (`oid`)
);
CREATE TABLE Pickup(
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `date` date DEFAULT NULL,
  `orderedList` varchar(200) NOT NULL,
  `payment` varchar(32) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `verifyCode` int(11) DEFAULT NULL,
  `statement` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`)
);

CREATE TABLE User (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `id` char(13) NOT NULL,
  `password` char(13) NOT NULL,
  `type` varchar(13) NOT NULL,
  `name` varchar(32) NOT NULL,
  `birthDay` date DEFAULT NULL,
  `phoneNumber` char(13) NOT NULL,
  `blackList` varchar(13) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`oid`)
) ;




INSERT INTO User(oid, id, password, type, name, birthDay, phoneNumber, blackList, point) VALUES(10000, 'admin', 'admin', '관리자', '홈페이지관리자', '2021-05-10', '010-0000-0000', 'false', 100000);
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList, point) VALUES(201713919,1234,'관리자','윤주현','1996-03-25','010-4413-5698','false', 100000);
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList, point) VALUES(201912161,1234,'관리자','허수빈','2001-01-05','010-3217-5620','false', 100000);
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList, point) VALUES(201912149,1234,'관리자','최예슬','2000-09-24','010-3160-9231','false', 100000);
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList, point) VALUES(201912039,1234,'관리자','김우중','2000-02-16','010-9874-2338','false', 100000);
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList, point) VALUES(201713866,1234,'손님','송성호','2000-01-01','010-0001-0002','false',100000); 

-- 이미지 URL 이탈 가능성이 있어, oid를 일부러 강제로 지정함.
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5000,'치킨','후라이드치킨',20000,'바삭한 후라이드 치킨입니다.','5000.png', 15);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5001,'치킨','양념치킨',21000,'매콤한 양념치킨 입니다.','5001.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5002,'치킨','간장치킨',21000,'간장의 풍미가 느껴지는 치킨입니다.','5002.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5003,'치킨','후라이드반 양념반',22000,'후라이드반, 양념반으로 이루어진 반반치킨입니다..','5003.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5004,'치킨','마라맛 치킨',17500,'매콤한 마라 양념 소스가 들어간 치킨입니다.','5004.jpg', 18);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5005,'치킨','스노윙 치즈 치킨',18000,'야채 시즈닝과 치즈 시즈닝이 어우러진 치킨입니다.','5005.jpg', 25);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5006,'치킨','청양마요 치킨',16500,'아삭한 양파와 청양 마요 소스가 일품인 치킨입니다.','5006.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5007,'치킨','오리엔탈 파닭',17000,'오리엔탈 소스와 신선한 파채가 가득한 치킨입니다.','5007.jpg', 26);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5008,'치킨','트리플반반반',26000,'후라이드 반, 양념 반, 간장 반으로 이루어진 치킨입니다.','5008.jpg', 30);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5009,'치킨','순살 후라이드',16000,'순살로 이루어진 후라이드 치킨입니다.','5009.png', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5010,'피자','하와이안 쉬림프 피자',18000,'새콤한 파인애플과 새우가 어우러진 피자입니다.','5010.jpg', 15);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5011,'피자','시카고 스테이크 피자',25000,'시카고스테이크 피자입니다.','5011.jpg', 10);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5012,'피자','불고기 피자',13000,'불고기 피자입니다.','5012.jpg', 15);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5013,'피자','포테이토 피자',15000,'저칼로리 감자가 가득한 피자입니다.','5013.jpg', 17);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5014,'피자','페퍼로니 피자',15000,'고소한 페퍼로니 햄이 치즈 위에 듬뿍 담긴 피자입니다..','5014.jpg', 18);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5015,'피자','치킨 텐더 피자',12000,'치킨+피자! 실패할 수 없는 조합!','5015.jpg', 18);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5016,'피자','모짜렐라 치즈 피자',16000,'모짜렐라 치즈가 가득한 피자입니다.','5016.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5017,'피자','고구마 피자',17000,'국산 고구마 큐브와 무스가 뿌려진 피자입니다.','5017.jpg', 16);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5018,'피자','콰트로 피자',21000,'불고기, 쉬림프, 페퍼로니, 고구마, 4가지 맛을 즐길 수 있는 피자입니다.','5018.jpg', 25);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5019,'피자','갈릭 버터 피자',16000,'마늘과 버터향이 가득한 피자입니다.','5019.png', 18);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5020,'피자','치즈 베이컨 피자',19000,'베이컨 위에 모짜렐라 치즈가 뿌려진 피자입니다.','5020.jpg', 21);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5021,'스테이크', '시그니처 스테이크', 40000, '레스토랑의 시그니처 메뉴입니다.', '5021.jpg', 11);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5022,'스테이크', '갈릭 스테이크', 45000, '마늘의 풍미가 가득한 갈릭 스테이크입니다.', '5022.png', 12);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5023,'스테이크', '목살 스테이크', 43000, '목살의 풍부한 육즙이 느껴지는 스테이크입니다.', '5023.jpg', 17);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5024,'스테이크', '안심 스테이크', 45000, '1등급 한우 안심을 구워낸 스테이크입니다.', '5024.jpg', 16);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5025,'스테이크', '티본 스테이크', 48000, '부드러운 안심과 풍미가 진한 등심을 함께 즐길 수 있는 스테이크입니다.', '5025.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5026,'스테이크', '토마호크 스테이크', 45000, '블랙 앵거스의 1% 부위를 구워낸 스테이크입니다.', '5026.jpg', 21);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5027,'스테이크', '포인트 스테이크', 43000, '채끝 등심과 유기농 샐러드가 어우러진 스테이크입니다.', '5027.jpg', 15);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5028,'스테이크', '마라 스테이크', 43000, '마라 양념으로 구워낸 스테이크입니다.', '5028.jpg', 18);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5029,'스테이크', '치킨&스테이크', 41000, '스테이크와 바삭한 치킨을 사이드로 한번에 즐길 수 있는 스테이크입니다.', '5029.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5030,'스테이크', '트러플 스테이크', 45000, '트러플 소스의 풍미가 느껴지는 스테이크입니다.', '5030.jpg', 15);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5031,'파스타','투움바 파스타',18000,'투움바 파스타입니다.','5031.jpg', 10);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5032,'파스타','까르보나라',16000,'까르보나라 입니다.','5032.png', 12);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5033,'파스타','토마토 스파게티',14000,'유기농 토마토로 만든 소스가 곁들여진, 누구나 즐길 수 있는 토마토 스파게티입니다.','5033.jpg', 13);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5034,'파스타','알리오 올리오',18000,'마늘과 올리브유로 만든 소스가 들어간 파스타입니다.','5034.jpg', 18);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5035,'파스타','봉골레 파스타 ',15000,'싱싱한 모시 조개에 올리브유와 화이트와인이 들어간 파스타입니다.','5035.jpg', 25);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5036,'파스타','아라비아타',14500,'홍고추, 토마토를 주재료로 하여 만든 파스타로, 상당히 맵습니다. ','5036.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5037,'파스타','라자냐',18000,'진한 라구 소스와 베샤멜 소스, 치즈가 뿌려진 오븐 파스타입니다.','5037.jpg', 25);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5038,'파스타','탈리아 텔레',15500,'훈제 연어와 생크림으로 만든 소스가 들어간 파스타입니다.','5038.jpg', 22);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5039,'파스타','라비올리',18000,'시금치와 리코타 치즈를 섞어 속을 채우고 납작하게 빚어낸 파스타입니다.','5039.jpg', 25);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5040,'파스타','명란 크림 로제 파스타',16000,'부드러운 크림과 명란이 어우러진 파스타입니다.','5040.jpg', 20);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5041,'음료수','사이다',2000,'사이다 입니다.','5041.jpg', 1);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5042,'음료수','콜라',2000,'콜라입니다.','5042.jpg', 1);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5043,'음료수','환타',2000,'사이다 입니다.','5043.jpg', 1);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5044,'음료수','레몬 에이드',3500,'레몬 에이드 입니다.','5044.jpg', 5);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5045,'음료수','한라봉 에이드',3500,'한라봉 에이드 입니다.','5045.jpg', 5);
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL, cookingTime) VALUES(5046,'음료수','청포도 에이드',3500,'청포도 에이드 입니다.','5046.jpg', 5);

INSERT INTO `Table`(oid, number, places, limits ) VALUES(6000,1,1,4);
INSERT INTO `Table`(number, places, limits ) VALUES(2,2,4);
INSERT INTO `Table`(number, places, limits ) VALUES(3,3,4);

INSERT INTO ReservationRequest(covers, DATE, TIME, customer_name, customer_id, message, verifycode) VALUES(3,'2021-05-26',13,'asd','asd','asd',12123);

INSERT INTO Reservation(covers, DATE, TIME, customer_name, customer_id, table_id) VALUES(3,'2021-05-26',15,'as12d','asd',2);
INSERT INTO Reservation(covers, DATE, TIME, customer_name, customer_id, table_id) VALUES(3,'2021-05-26',18,'as323d','asd',3);
INSERT INTO Reservation(covers, DATE, TIME, customer_name, customer_id, table_id) VALUES(3,'2021-05-26',15,'as444d','asd',1);

INSERT INTO WaitingList(DATE, name, covers, table_id, verifyCode) VALUES('2021-06-01','김우중', 5, 2,1123);

-- TEST DATA
INSERT INTO Customer(oid, name, phoneNumber,id,blackList ) VALUES(7000, 'TEST', '010-0000-0000','TEST','false');

-- TEST DATA
INSERT INTO Pickup(oid, id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES(8000, 'TEST', 'TEST','2021-05-10', '', '현장결제', 0, '맛있게 해주세요.', 0);
INSERT INTO Pickup(oid, id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES(8001, 'TEST', 'TEST','2021-05-10', '', '온라인결제', 0, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-01', '', '온라인결제', 215000, '맛있게 해주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-02', '', '온라인결제', 110000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-03', '', '온라인결제', 337000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-04', '', '온라인결제', 215000, '맛있게 해주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-05', '', '온라인결제', 122000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-06', '', '온라인결제', 111000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-07', '', '온라인결제', 225000, '맛있게 해주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-08', '', '온라인결제', 131000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-09', '', '온라인결제', 347000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-10', '', '온라인결제', 205000, '맛있게 해주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-11', '', '온라인결제', 397000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-12', '', '온라인결제', 380000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-13', '', '온라인결제', 275000, '맛있게 해주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-14', '', '온라인결제', 362000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-15', '', '온라인결제', 311000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-16', '', '온라인결제', 227000, '맛있게 해주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-17', '', '온라인결제', 127000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-18', '', '온라인결제', 210000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-19', '', '온라인결제', 293000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-20', '', '온라인결제', 432000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-21', '', '온라인결제', 221000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-22', '', '온라인결제', 620000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-23', '', '온라인결제', 320000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-24', '', '온라인결제', 225000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-25', '', '온라인결제', 613000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-26', '', '온라인결제', 213000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-27', '', '온라인결제', 421000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-28', '', '온라인결제', 210000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-29', '', '온라인결제', 390000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-30', '', '온라인결제', 580000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-05-31', '', '온라인결제', 170000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-06-01', '', '온라인결제', 640000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-06-02', '', '온라인결제', 441000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-06-03', '', '온라인결제', 754000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-06-04', '', '온라인결제', 273000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-06-05', '', '온라인결제', 532000, '양 많이 주세요.', 0);
INSERT INTO Pickup(id, name, date, orderedList, payment, totalPrice, message, verifyCode) VALUES('TEST', 'TEST','2021-06-06', '', '온라인결제', 328000, '양 많이 주세요.', 0);
