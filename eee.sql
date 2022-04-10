/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.25-log : Database - eee
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`eee` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eee`;

/*Table structure for table `alert` */

DROP TABLE IF EXISTS `alert`;

CREATE TABLE `alert` (
  `complaint reply` int(20) DEFAULT NULL,
  `feedbacks` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alert` */

insert  into `alert`(`complaint reply`,`feedbacks`) values (0,0);

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `fid` varchar(50) DEFAULT NULL,
  `toid` varchar(50) DEFAULT NULL,
  `msg` varchar(100) DEFAULT NULL,
  `datetime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`cid`,`fid`,`toid`,`msg`,`datetime`) values (1,'unique@gmail.com','getsruthis98@gmail.com','hey','10-02-2020'),(2,'getsruthis98@gmail.com','unique@gmail.com','helloo','11-02-2020');

/*Table structure for table `clients` */

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `clid` int(40) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `photoin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`clid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `clients` */

insert  into `clients`(`clid`,`company_name`,`photo`,`url`,`photoin`) values (1,'Palakkad','clientdetails/Palakkad.jpeg','url','../clientdetails/Palakkad.jpeg'),(2,'Chalavara','clientdetails/chalavara.jpeg',NULL,'../clientdetails/chalavara.jpeg');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `replydate` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`cid`,`uid`,`date`,`subject`,`complaint`,`reply`,`replydate`,`status`) values (1,'queenofwands12121@gmail.com','28-02-2021 15:10:23','Work Status','No updates about work status','We will update it soon sir','28-02-2021 15:12:32','replied');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `Dept_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`dept_id`,`Dept_name`) values (1,'Construction'),(2,'Planning'),(3,'Interior Design');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `sub` varchar(50) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`user`,`sub`,`feedback`,`date`,`status`) values (1,'queenofwands12121@gmail.com','Service','We are satisfied with service provided by your company.','28-02-2021 15:07:51','New'),(2,'queenofwands12121@gmail.com','Service','good service','28-02-2021 15:09:16','New');

/*Table structure for table `fileupload` */

DROP TABLE IF EXISTS `fileupload`;

CREATE TABLE `fileupload` (
  `file_id` int(20) NOT NULL AUTO_INCREMENT,
  `work_id` int(20) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `fromid` varchar(100) DEFAULT NULL,
  `toid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `fileupload` */

insert  into `fileupload`(`file_id`,`work_id`,`filename`,`path`,`date`,`fromid`,`toid`) values (1,1,'Plan','/attachments/siyaconstruction2021@gmail.complan.jpg','28-02-2021 14:30:28','siyaconstruction2021@gmail.com','athirasivasankar856@gmail.com'),(2,1,'Plan','/attachments/siyaconstruction2021@gmail.complan.jpg','28-02-2021 14:33:27','siyaconstruction2021@gmail.com','queenofwands12121@gmail.com'),(5,1,'Plan','/attachments/siyaconstruction2021@gmail.complan.jpg','28-02-2021 14:46:28','siyaconstruction2021@gmail.com','akhipraveen7356@gmail.com'),(6,1,'Property document','/attachments/queenofwands12121@gmail.comproperty.jpg','28-02-2021 15:06:29','queenofwands12121@gmail.com','siyaconstruction2021@gmail.com');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` int(20) NOT NULL AUTO_INCREMENT,
  `usernsme` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `verifycode` varchar(50) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`userid`,`usernsme`,`password`,`type`,`status`,`verifycode`,`Photo`) values (1,'siyaconstruction2021@gmail.com','sss','admin','approved','0','../images/photo1.jpg'),(2,'athirasivasankar856@gmail.com','1999','Project Manager','approved','0','../images/athirasivasankar856@gmail.com.jpg'),(3,'akhipraveen7356@gmail.com','7764','Unit Manager','approved','0','../images/akhipraveen7356@gmail.com.jpg'),(4,'queenofwands12121@gmail.com','2323','client','Approved','763120819','../images/queenofwands12121@gmail.com.jpg'),(5,'sreedevimohandas94@gmail.com','1492','Unit Manager','approved','0','../images/sreedevimohandas94@gmail.com.jpg');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `not_id` int(20) NOT NULL AUTO_INCREMENT,
  `did` int(20) DEFAULT NULL,
  `eid` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`not_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

insert  into `notification`(`not_id`,`did`,`eid`,`title`,`details`,`date`,`status`) values (1,1,'2','Work Status','Update work status','28-02-2021 14:55:48','New'),(2,1,'2','Work Status','Update work status','28-02-2021 14:58:28','New'),(3,1,'2','Meeting ','There will be meeting on 20-03- 2021','28-02-2021 15:01:08','New');

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `pid` int(20) NOT NULL AUTO_INCREMENT,
  `did` int(30) DEFAULT NULL,
  `position_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `position` */

insert  into `position`(`pid`,`did`,`position_name`) values (1,1,'Project Manager'),(2,1,'Unit Manager'),(3,2,'Project Manager'),(4,2,'Unit Manager'),(5,3,'Project Manager'),(6,3,'Unit Manager');

/*Table structure for table `predict` */

DROP TABLE IF EXISTS `predict`;

CREATE TABLE `predict` (
  `predict_id` int(20) NOT NULL AUTO_INCREMENT,
  `wid` int(30) DEFAULT NULL,
  `coming_status` varchar(30) DEFAULT NULL,
  `submit_date` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`predict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `predict` */

insert  into `predict`(`predict_id`,`wid`,`coming_status`,`submit_date`) values (1,1,'0','28-02-2021 12:08:11');

/*Table structure for table `quotation` */

DROP TABLE IF EXISTS `quotation`;

CREATE TABLE `quotation` (
  `file_id` int(20) NOT NULL AUTO_INCREMENT,
  `work_id` int(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `to_id` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `quotation` */

insert  into `quotation`(`file_id`,`work_id`,`filename`,`path`,`to_id`,`date`,`status`) values (1,1,'Quotation','/attachmentq/queenofwands12121@gmail.comestimate.jpg','queenofwands12121@gmail.com','28-02-2021 12:10:07',NULL);

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `reg_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `agreement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`reg_id`,`name`,`address`,`place`,`email`,`phone`,`status`,`agreement`) values (1,'Shilpa','vattaparambil house mankkara','pathiripala','queenofwands12121@gmail.com',9633513429,'Approved','/agreement/queenofwands12121@gmail.com.docx');

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `Dept_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `services` */

insert  into `services`(`dept_id`,`Dept_name`) values (1,'Construction'),(2,'planning'),(3,'Interior Design');

/*Table structure for table `staffregisters` */

DROP TABLE IF EXISTS `staffregisters`;

CREATE TABLE `staffregisters` (
  `Staff_id` int(20) NOT NULL AUTO_INCREMENT,
  `Pid` int(20) DEFAULT NULL,
  `did` int(20) DEFAULT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qualification` varchar(20) DEFAULT NULL,
  `experience` varchar(50) DEFAULT NULL,
  `dor` varchar(30) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `joining_date` varchar(30) DEFAULT NULL,
  `skills` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `staffregisters` */

insert  into `staffregisters`(`Staff_id`,`Pid`,`did`,`fname`,`gender`,`dob`,`address`,`phone`,`email`,`qualification`,`experience`,`dor`,`salary`,`joining_date`,`skills`) values (1,1,1,'Athira','female','2000-10-28','Elikkotil house vaniyamkulam',9037290723,'athirasivasankar856@gmail.com','MBA','1 year','28-02-2021 11:51:27',50000,NULL,'Management'),(2,2,1,'akhi','female','1999-12-14','praveen auto garage mnissery',8539012824,'akhipraveen7356@gmail.com','MBA','2 years','28-02-2021 11:54:54',35000,NULL,'Management'),(3,2,1,'Sreedevi Mohandas','female','1995-04-05','13/1991 puthanpura house chandranagar',8547471666,'sreedevimohandas94@gmail.com','MBA','3 years','28-02-2021 14:54:50',50000,NULL,'Management');

/*Table structure for table `task_allot` */

DROP TABLE IF EXISTS `task_allot`;

CREATE TABLE `task_allot` (
  `t_id` int(50) NOT NULL AUTO_INCREMENT,
  `unitid` int(50) DEFAULT NULL,
  `manager_id` varchar(100) DEFAULT NULL,
  `emp_id` varchar(100) DEFAULT NULL,
  `aloc_date` varchar(50) DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `wname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `task_allot` */

insert  into `task_allot`(`t_id`,`unitid`,`manager_id`,`emp_id`,`aloc_date`,`completion_date`,`Status`,`wname`) values (1,1,'athirasivasankar856@gmail.com','akhipraveen7356@gmail.com','28-02-2021 12:29:28','2023-05-15','0','House(mannur)'),(2,2,'athirasivasankar856@gmail.com','akhipraveen7356@gmail.com','28-02-2021 12:30:28','2022-05-25','0','House(mannur)');

/*Table structure for table `task_status` */

DROP TABLE IF EXISTS `task_status`;

CREATE TABLE `task_status` (
  `TW_id` int(20) NOT NULL AUTO_INCREMENT,
  `T_id` int(20) DEFAULT NULL,
  `task` varchar(20) NOT NULL,
  `status` int(30) NOT NULL,
  `date` varchar(20) NOT NULL,
  `wstatus` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TW_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `task_status` */

insert  into `task_status`(`TW_id`,`T_id`,`task`,`status`,`date`,`wstatus`) values (1,1,'chimney',1,'28-02-2021 12:57:22','Completed'),(2,1,'cupboard',1,'28-02-2021 12:57:49','Completed'),(3,1,'Flooring',0,'Pending','pending'),(4,2,'3d flooring',0,'Pending','pending'),(5,2,'lighting',0,'Pending','pending'),(6,2,'3d flooring',0,'Pending','pending'),(7,2,'lighting',0,'Pending','pending');

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `unitid` int(20) NOT NULL AUTO_INCREMENT,
  `wid` int(50) NOT NULL,
  `unitname` varchar(50) NOT NULL,
  `unitdesc` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `alloc_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `unit` */

insert  into `unit`(`unitid`,`wid`,`unitname`,`unitdesc`,`status`,`alloc_status`) values (1,1,'kitchen ','flooring chimney  ','66.666666666666657','1'),(2,1,'hall','3D flooring','0','1');

/*Table structure for table `warning` */

DROP TABLE IF EXISTS `warning`;

CREATE TABLE `warning` (
  `warning_id` int(20) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `warning` */

insert  into `warning`(`warning_id`,`staff_id`,`title`,`details`,`date`,`status`) values (1,'sreedevimohandas94@gmail.com','status','Update work status','25-02-2021','viewed'),(2,'athirasivasankar856@gmail.com','Work Status','Update work status','28-02-2021 15:02:16','New');

/*Table structure for table `work_request` */

DROP TABLE IF EXISTS `work_request`;

CREATE TABLE `work_request` (
  `work_id` int(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) DEFAULT NULL,
  `work_name` varchar(200) DEFAULT NULL,
  `requirements` varchar(50) DEFAULT NULL,
  `req_date` varchar(50) DEFAULT NULL,
  `completion_date` varchar(50) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `square_feet` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `work_request` */

insert  into `work_request`(`work_id`,`client_id`,`work_name`,`requirements`,`req_date`,`completion_date`,`Status`,`service`,`square_feet`) values (1,'queenofwands12121@gmail.com','House(mannur)','2 floor with 4 bedroom','28-02-2021 12:08:11','2022-05-15','allocated','Construction','4000');

/*Table structure for table `workallot` */

DROP TABLE IF EXISTS `workallot`;

CREATE TABLE `workallot` (
  `Wa_id` int(20) NOT NULL AUTO_INCREMENT,
  `W_id` int(20) NOT NULL,
  `D_id` int(20) NOT NULL,
  `manager_id` varchar(50) NOT NULL,
  `Alloted_date` varchar(50) NOT NULL,
  `Complete_date` varchar(50) NOT NULL,
  `wstatus` varchar(100) NOT NULL,
  PRIMARY KEY (`Wa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `workallot` */

insert  into `workallot`(`Wa_id`,`W_id`,`D_id`,`manager_id`,`Alloted_date`,`Complete_date`,`wstatus`) values (1,1,1,'athirasivasankar856@gmail.com','28-02-2021 12:18:05','2022-05-15','33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
