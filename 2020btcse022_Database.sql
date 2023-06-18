/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.24-MariaDB : Database - university_placement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`university_placement` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `university_placement`;

/*Table structure for table `achievements` */

DROP TABLE IF EXISTS `achievements`;

CREATE TABLE `achievements` (
  `Student_id` varchar(10) DEFAULT NULL,
  `Achievement` varchar(20) DEFAULT NULL,
  `Date_Awarded` varchar(10) DEFAULT NULL,
  KEY `fk_stachv_ID` (`Student_id`),
  CONSTRAINT `fk_stachv_ID` FOREIGN KEY (`Student_id`) REFERENCES `students` (`Student_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `achievements` */

insert  into `achievements`(`Student_id`,`Achievement`,`Date_Awarded`) values 
('S101','Academic Excellence ','13-10-2016'),
('S103','Artfully Creative Aw','07-07-2018'),
('S106','Super Scientist','02-07-2017'),
('S101','Student of the Year','14-03-2017'),
('S110','Excellent Effort Awa','21-06-2018'),
('S111','Writing Wizard','07-03-2015'),
('S108','Technology Whiz','12-01-2019'),
('S114','Academic Star','15-06-2019');

/*Table structure for table `campus_visit` */

DROP TABLE IF EXISTS `campus_visit`;

CREATE TABLE `campus_visit` (
  `Company_Id` varchar(10) DEFAULT NULL,
  `Year_of_visit` varchar(12) DEFAULT NULL,
  `Mode_visit` varchar(10) DEFAULT NULL,
  KEY `fk_campvis_ID` (`Company_Id`),
  CONSTRAINT `fk_campvis_ID` FOREIGN KEY (`Company_Id`) REFERENCES `company` (`Company_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `campus_visit` */

insert  into `campus_visit`(`Company_Id`,`Year_of_visit`,`Mode_visit`) values 
('C101','2015','Offline'),
('C103','2018','Offline'),
('C119','2020','Online'),
('C220','2015','Offline'),
('C101','2019','Online'),
('C224','2017','Offline'),
('C210','2017','Offline');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `Company_ID` varchar(10) NOT NULL,
  `Company_Name` varchar(20) DEFAULT NULL,
  `Address` varchar(35) DEFAULT NULL,
  `Phone_no` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `company` */

insert  into `company`(`Company_ID`,`Company_Name`,`Address`,`Phone_no`) values 
('C101','Pepsodent','E-43, Connaught Place, Delhi','01123416748'),
('C103','Adidas','89, N. S. Road, West Bengal','03322423470'),
('C119','Curaj','CURaj, Bandarseendri, Kishangarh, R','07922720147'),
('C152','Lenovo','35, B, Shyam Kamal, Agarwal Market,','02655537644'),
('C210','TCS','Market Block H, Palam Vihar,Bangalo','01294073042'),
('C220','Crunchy Rolls','7-8-775/5, Chanchalguda, Hyderabad','04055304258'),
('C224','Majumder pvt. Ltd.','C-212, Bonanza Indl Est, Ashok Naga','02228878234');

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `Faculty_ID` varchar(10) NOT NULL,
  `Role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Faculty_ID`),
  CONSTRAINT `spec_per_fac` FOREIGN KEY (`Faculty_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `faculty` */

insert  into `faculty`(`Faculty_ID`,`Role`) values 
('F101','Professor'),
('F102','Professor'),
('F103','Professor'),
('F104','Professor'),
('F105','Professor'),
('F106','Admin'),
('F107','Assistant'),
('F108','Professor'),
('F109','Professor'),
('F110','Assistant'),
('F111','Professor'),
('F112','Admin'),
('F113','Professor');

/*Table structure for table `hr_detail` */

DROP TABLE IF EXISTS `hr_detail`;

CREATE TABLE `hr_detail` (
  `HR_ID` varchar(10) NOT NULL,
  `HR_Name` varchar(20) DEFAULT NULL,
  `Company_ID` varchar(10) DEFAULT NULL,
  `Phone_no` varchar(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`HR_ID`),
  KEY `Company_ID` (`Company_ID`),
  CONSTRAINT `hr_detail_ibfk_1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`Company_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `hr_detail` */

insert  into `hr_detail`(`HR_ID`,`HR_Name`,`Company_ID`,`Phone_no`,`email`) values 
('H102','Abigail Johnson','C220','892997167','a.harrison@randatmail.com'),
('H104','Darcy Hunt','C103','8791683140','d.hunt@randatmail.com	'),
('H110','Dorothy Pinson','C101','9125546510\r\n','DorothyJPinson@armyspy.com\r\n'),
('H112','Jacob Higgins','C119','834666151\r\n','j.higgins@randatmail.com'),
('H120','Abhijeet Pingle','C119','888444644','pingle@gmail.co'),
('H131','Angela White','C224','952717518','angelastar@fans.co'),
('H138','Paul Mason','C210','690583674','p.mason@randatmail.com'),
('H200','Jhonny Majumder','C224','988486464','jmd@sins.com'),
('H211','Rosie Rogers','C152','501849476','	r.rogers@randatmail.com'),
('H220','Harold Turner','C101','567609730','h.turner@randatmail.com');

/*Table structure for table `internship` */

DROP TABLE IF EXISTS `internship`;

CREATE TABLE `internship` (
  `Student_ID` varchar(10) NOT NULL,
  `Internship_comp_id` varchar(10) DEFAULT NULL,
  `Internship_Year` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `fk_company_ID` (`Internship_comp_id`),
  CONSTRAINT `fk_company_ID` FOREIGN KEY (`Internship_comp_id`) REFERENCES `company` (`Company_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_ID` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `internship` */

insert  into `internship`(`Student_ID`,`Internship_comp_id`,`Internship_Year`) values 
('S101','C152','2017'),
('S103','C220','2019'),
('S104','C101','2016'),
('S106','C101','2016'),
('S107','C210','2019'),
('S108','C103','2019'),
('S109','C152','2018'),
('S110','C224','2018'),
('S111','C220','2016'),
('S113','C119','2019'),
('S115','C119','2015');

/*Table structure for table `participation` */

DROP TABLE IF EXISTS `participation`;

CREATE TABLE `participation` (
  `Workshop_Id` varchar(10) DEFAULT NULL,
  `Student_id` varchar(10) DEFAULT NULL,
  `Participation_Date` varchar(20) DEFAULT NULL,
  `Duration_days` int(11) DEFAULT NULL,
  KEY `fk_ws_ID` (`Workshop_Id`),
  KEY `fk_stpart_ID` (`Student_id`),
  CONSTRAINT `fk_stpart_ID` FOREIGN KEY (`Student_id`) REFERENCES `students` (`Student_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ws_ID` FOREIGN KEY (`Workshop_Id`) REFERENCES `workshops` (`Workshop_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `participation` */

insert  into `participation`(`Workshop_Id`,`Student_id`,`Participation_Date`,`Duration_days`) values 
('W101','S103','15-06-2018',7),
('W101','S115','13-04-2015',9),
('W113','S101','21-01-2017',6),
('W132','S101','30-03-2016',12),
('W128','S108','24-10-2018',8),
('W132','S114','19-07-2016',9),
('W132','S107','13-08-2018',9),
('W301','S101','14-04-2015',3),
('W301','S101','14-04-2015',3);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `User_Type` varchar(15) DEFAULT NULL,
  `Permission` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `permissions` */

insert  into `permissions`(`User_Type`,`Permission`) values 
('Student','View Self data'),
('Professor','View all students data'),
('Professor ','Update student information'),
('Assistant','View all students data'),
('Admin','View All data'),
('Admin','Update student or Professor info.'),
('Admin','Add/Delete a user');

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `Person_ID` varchar(10) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Department` varchar(30) DEFAULT NULL,
  `Phone_no` varchar(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `person` */

insert  into `person`(`Person_ID`,`Name`,`Department`,`Phone_no`,`email`) values 
('F101','Nilam Khandal','Mathematics','7089654120','nilam@gmail.com\r'),
('F102','Kajal Singh','CSE','856239870','kajals@curaj.in\r'),
('F103','Naveen Ramroop','ECE','6699885230','naveen@naa.co\r'),
('F104','Aman Radhakrishnan?','Statistics','8522963301','krishna@yahoo.com\r'),
('F105','Abdul Shukla','CSE','7007852931','shukla@shukla.shukla\r'),
('F106','Akhil Yogi','ICT','6842684267','senivan661@migonom.co\r'),
('F107','Sohail Bhargava','Chemical','6543219877','syncnine@me.com\r'),
('F108','Vidhi Kabra','BME','7418529630','kmself@icloud.com\r'),
('F109','Afreen Bajaj','CS','8956235689','thrymm@att.net\r'),
('F110','Shibaji Ahluwalia','Media and Mass','7894561230','fglock@yahoo.ca\r'),
('F111','Kailash Bhat','CS','7456321420','chinthaka@hotmail.com\r'),
('F112','Deepesh Gala','ICT','8513952103','weazelman@live.com\r'),
('F113','Anant Swamy','Physics','6856963602','portscan@outlook.com\r'),
('S101','Rahul Achhera','CSE','9898989898','rahul22@gmail.com\r'),
('S102','Menka Prabhakar','Linguistics','7854797979','menkap@yahoo.com\r'),
('S103','Raju rastogi','Media and mass','9986454654','rajurs@gmail.com\r'),
('S104','Eren Ackerman','Microbiology','8444646465','erenmikasa@hotmail.com\r'),
('S105','Tarun Somani','Computer Science ','9887998879','taruns@curaj.ac.in\r'),
('S106','Palak Patel ','BME ','6289993650','palakpatel@gmail.com\r'),
('S107','Tomioka Giyuu','ECE','7799778899','slayergiyu@gmail.com\r'),
('S108','Babu Rao','CSE','5487767676','baburao@curaj.ac.in\r'),
('S109','Harsh Chaman','Statistics','6598454646','harsh@gmail.com\r'),
('S110','Harbhajan Hora','MBA','9707884091','yratta@hayre.com\r'),
('S111','Javed Sur','English','9962416175','nazir99@hari.net\r'),
('S112','Gojo Sensei','Karate','9999888877','jujutsu@gmail.com\r'),
('S113','Yogesh Arya','Hindi','4263584199','manpreet85@mangat.co\r'),
('S114','Abhishek Kapadia','CSE','2328661911','nakul.kaul@yahoo.co.in\r'),
('S115','Savita Nayak','Linguistics','6376353181','emran77@yahoo.com\r');

/*Table structure for table `placement` */

DROP TABLE IF EXISTS `placement`;

CREATE TABLE `placement` (
  `Student_ID` varchar(10) NOT NULL,
  `Company_ID` varchar(10) DEFAULT NULL,
  `Placement_Year` int(11) DEFAULT NULL,
  `PACKAGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `fk_com_ID` (`Company_ID`),
  CONSTRAINT `fk_com_ID` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`Company_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_st_ID` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `placement` */

insert  into `placement`(`Student_ID`,`Company_ID`,`Placement_Year`,`PACKAGE`) values 
('S101','C152',2017,800000),
('S103','C103',2019,1200000),
('S106','C101',2018,600000),
('S107','C224',2019,450000),
('S110','C101',2019,500000),
('S111','C119',2017,600000),
('S114','C152',2020,300000);

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `Student_ID` varchar(10) NOT NULL,
  `Admission_Year` int(11) DEFAULT NULL,
  `Passout` int(11) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  CONSTRAINT `spec_per_stu` FOREIGN KEY (`Student_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `students` */

insert  into `students`(`Student_ID`,`Admission_Year`,`Passout`) values 
('S101',2013,2017),
('S102',2011,2015),
('S103',2015,2019),
('S104',2013,2017),
('S105',2013,2017),
('S106',2014,2018),
('S107',2015,2019),
('S108',2016,2020),
('S109',2014,2018),
('S110',2015,2019),
('S111',2013,2017),
('S112',2011,2015),
('S113',2015,2019),
('S114',2016,2020),
('S115',2012,2016);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `UserID` varchar(20) NOT NULL,
  `User_Type` varchar(12) DEFAULT NULL,
  `User_Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_user_ID` FOREIGN KEY (`UserID`) REFERENCES `person` (`Person_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`UserID`,`User_Type`,`User_Password`) values 
('F101','Professor','9c42nh1f'),
('F103','Professor','z9246nkwm'),
('F106','Admin','obt6j3143'),
('F107','Assistant','23843lhr9'),
('F112','Admin','vq3gj164h'),
('F113','Professor','xu76oii66'),
('S101','Student','6m527xv1l'),
('S106','Student','1hmg8u67'),
('S110','Student','s60iq88p8'),
('S112','Student','47ya4z609');

/*Table structure for table `workshops` */

DROP TABLE IF EXISTS `workshops`;

CREATE TABLE `workshops` (
  `Workshop_Id` varchar(10) NOT NULL,
  `Topic` varchar(40) DEFAULT NULL,
  `Department` varchar(30) DEFAULT NULL,
  `Incharge_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Workshop_Id`),
  KEY `fk_wsincharge_ID` (`Incharge_ID`),
  CONSTRAINT `fk_wsincharge_ID` FOREIGN KEY (`Incharge_ID`) REFERENCES `person` (`Person_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `workshops` */

insert  into `workshops`(`Workshop_Id`,`Topic`,`Department`,`Incharge_ID`) values 
('W101','Theatre Workshop','Media and Mass','F110'),
('W105','Communication Skills','Linguistics','F107'),
('W112','Workshop on POCSO','Media and Mass','F104'),
('W113','Exposure to Coding Curriculum','CSE','F105'),
('W128','Machine Learning','CSE','F105'),
('W132','Robotics','CS','F109'),
('W140','Teachers\' Training Workshop','Linguistics','F106'),
('W200','Yoga Workshop','Yoga','F108'),
('W210','Math around me','Mathematics','F101'),
('W301','Innovative Idea Presentation','CSE','F102');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
