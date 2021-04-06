/*
 Navicat Premium Data Transfer

 Source Server         : user_db
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 06/04/2021 09:25:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `Addrid` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Addrid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `Aid` int NOT NULL AUTO_INCREMENT,
  `Ausername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Apassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `Bid` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `Bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BAddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Bid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `Cateid` int NOT NULL,
  `Cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Cateid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond`  (
  `Csid` int NOT NULL AUTO_INCREMENT,
  `Csname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Cateid` int NOT NULL,
  PRIMARY KEY (`Csid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `Cid` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `Pid` int NOT NULL,
  `Score` decimal(4, 2) NOT NULL,
  `Comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `Oid` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `Bid` int NOT NULL,
  `Pid` int NOT NULL,
  `Money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Ostate` tinyint NOT NULL DEFAULT 1,
  `Addrid` int NOT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY (`Oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `Pid` int NOT NULL AUTO_INCREMENT,
  `Bid` int NOT NULL,
  `Pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Price` decimal(10, 2) NOT NULL,
  `Pnum` int NOT NULL,
  `Pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Csid` int NOT NULL,
  PRIMARY KEY (`Pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Uid` int NOT NULL AUTO_INCREMENT,
  `Account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `State` tinyint NOT NULL DEFAULT 0,
  `IsBusiness` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
