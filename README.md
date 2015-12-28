## 实验报告
运行后，点集 侧栏 “文档”-“实验报告”，即可打开目前的报告；

## 数据库格式

+ User表

```sql
CREATE TABLE `IFTTT`.`User` (
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Rank` INT NOT NULL,
  `Consumption` INT NULL,
  `Balance` INT NULL,
  `isAdmin` BIT(1) NULL,
  PRIMARY KEY (`Email`));
  
  alter table `IFTTT`.`User` add `Point` INT(11);
  alter table `IFTTT`.`User` add `Discount` DOUBLE;
```

+ PostMessage表

```sql
CREATE TABLE `IFTTT`.`PostMessage` (
  `ID` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
<<<<<<< HEAD
  `Subject` VARCHAR(10897) NOT NULL,
  `Content` VARCHAR(10897) NULL,
=======
  `Subject` VARCHAR(10000) NOT NULL,
  `Content` VARCHAR(10000) NULL,
>>>>>>> upstream/master
  `Time` DATETIME NULL,
  `Read` BIT(1) NULL,
  `Important` BIT(1) NULL,
  PRIMARY KEY (`ID`));
```

+ Task表

```sql
CREATE TABLE `IFTTT`.`Task` (
	`taskName` varchar(45) not null,
    `userEmail` varchar(45) not null,
	`timeOrMail` int not null,
    `receiveMail` VARCHAR(45),
    `receiveMailPassword` varchar(45),
    `sendEmail` varchar(45),
    `sendEmailPassword` varchar(45),
    `sendToEmail` varchar(45),
    `date` varchar(45),
    `mailOrWeibo` int not null,
    `weiboAccount` varchar(45),
    `weiboPassword` varchar(45),
    `message` varchar(100),
    `isRunning` bit,
    PRIMARY KEY (`userEmail`,`taskName`));
    
alter table `IFTTT`.`Task` add `ListenWeiBoID` varchar(45);
alter table `IFTTT`.`Task` add `ListenWeiBoPassword` varchar(45);
alter table `IFTTT`.`Task` add `ListenWeiBoMessage` varchar(45);
```

<<<<<<< HEAD
+ 消费记录

```sql
CREATE TABLE `IFTTT`.`Consume` (
  `ID` INT NOT NULL,
  `ThisDesp` varchar(100) NOT NULL,
  `ThatDesp` varchar(100) NOT NULL,
  `ConsumeValue` int NULL,
  `userEmail` varchar(45) NULL,
  PRIMARY KEY (`ID`));
=======
+ Bill表

```sql
CREATE TABLE `IFTTT`.`Bill` (
  `ID` INT NOT NULL,
  `Emial` VARCHAR(45) NOT NULL,
  `Consume` INT NOT NULL,
  `Time` DATETIME NULL,
  `Point` INT NULL,
  `Balance` INT NULL,
  PRIMARY KEY (`ID`));
```

+ Thing表

```sql
CREATE TABLE `IFTTT`.`Thing` (
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Stat` BIT(1) NOT NULL,
  PRIMARY KEY (`Name`));
>>>>>>> upstream/master
```