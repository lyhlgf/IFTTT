- This 任务目前仅邮件有效,缺少时间、监听微博
- that 任务发送邮件和发送微博均有效
- 任务管理页面目前可以查看、开始、暂停任务，缺少修改、删除任务。


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
  `Subject` VARCHAR(10000) NOT NULL,
  `Content` VARCHAR(10000) NULL,
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
```