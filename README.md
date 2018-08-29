# MAD_Assignment1


**Objective:** 
- To create a simple authentication API for mobile application. 
- To build an iOS mobile application which will demonstrate 'login', 'register', 'show/edit profile'.

**Team Members:** 

Pranalee Jadhav (pjadhav5@uncc.edu)

Gautham Bekal

Narahari Battala

**Web API**
***


Our API is used for sign up , login and data retrieval.It is intended primarily to assist application developers wishing to use an api for sign up , login and data retrieval operations in their applications or websites.

What's available:

This api provides 3 kinds of operations: **SignUp** which is used for account registration, **Login** which is used for login in to the account and **Data Retrieval** for retrieving the account specific details.

**Register a User**

Post /users/sign-up.   
Accept: application/json.  
Content-Type: application/json.   
       
{.  
    "userId":"battala",      
    "name":"narahari",    
    "age":23,    
    "weight":"75",   
    "address":"9407 Kittansett Dr",    
    "password":"123456".   
}.  

RESPONSE: HTTP 201 (Created).  

**User Login**

Post /login.   
Accept: application/json.  
Content-Type: application/json.   
       
{.  
    "userId":"battala",    
    "password":"12345".   
}    

RESPONSE: HTTP 200 (Ok).  
Content : Security token. 

**Retrieve User Details.** 

Get /users?id = username. 

Response: HTTP 200.  
Content: User Details.   

**Update User Details.**   

put /users.   
Accept: application/json.  
Content-Type: application/json.   
       
{.  
    "userId":"battala",      
    "name":"narahari",    
    "age":23,    
    "weight":"75",   
    "address":"9407 Kittansett Dr",    
    "password":"123456".   
}.  

RESPONSE: HTTP 200 (ok).  

# **DB Schema.** 

-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64).  
--    
-- Host: 127.0.0.1    Database: inclass01.   
-- ------------------------------------------------------    
-- Server version	8.0.12.   

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */.  
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */.  
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */. 
 SET NAMES utf8.  
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */. 
/*!40103 SET TIME_ZONE='+00:00' */. 
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */. 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */. 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */. 
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */. 

--   
-- Table structure for table `user`.  
--  

DROP TABLE IF EXISTS `user`. 
/*!40101 SET @saved_cs_client     = @@character_set_client */. 
 SET character_set_client = utf8mb4    
CREATE TABLE `user` (.  
  `username` varchar(50) NOT NULL,   
  `name` varchar(50) DEFAULT NULL,   
  `age` int(11) DEFAULT NULL,  
  `weight` varchar(10) DEFAULT NULL,  
  `address` varchar(100) DEFAULT NULL,
  `passw` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci. 
/*!40101 SET character_set_client = @saved_cs_client */. 

--
-- Dumping data for table user. 
--

LOCK TABLES `user` WRITE   
/*!40000 ALTER TABLE `user` DISABLE KEYS */. 
INSERT INTO `user` VALUES ('battala','narahari',23,'75','9407 Kittansett.  Dr','$2a$10$eaBMBpEXZPFkHzJyDABefetXW0VIWZJM7EnsYyhaDY0eqKiT7L4Ra'),('yuvinara','narahari',23,'75','9407.  Kittansett Dr','$2a$10$La3IbI4sAKKkdnTxms7q0.963hh/ljqbvjDV0EnAGPon310QMwIkG').  
/*!40000 ALTER TABLE `user` ENABLE KEYS */. 
UNLOCK TABLES. 
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */. 

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */. 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */. 
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */. 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */. 
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */. 
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */. 
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */. 

-- Dump completed on 2018-08-28 20:25:04.

**Mobile App:**
***


Technology used: Swift version 4

Features:
- User can login to app by providing username and password.
- User can register by giving details like name, password, weight, age, address.
- User can view or edit his/her profile details.
- UI is compatible with all iphone devices.
- Alamofire library is used to communicate with APIs.

Screenshots:

### Login page

[[images/Simulator Screen Shot - iPhone 8 Plus - 2018-08-29 at 11.01.54.png]]

### Registration page

[[images/Simulator Screen Shot - iPhone 8 Plus - 2018-08-29 at 11.09.08.png]]

### Home Page

[[images/Simulator Screen Shot - iPhone 8 Plus - 2018-08-29 at 11.34.47.png]]

### Profile Page

[[images/Simulator Screen Shot - iPhone 8 Plus - 2018-08-29 at 11.35.03.png]]

