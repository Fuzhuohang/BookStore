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

 Date: 16/04/2021 16:17:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (10, 1, '罗峰', '12345678901', '扬州城');
INSERT INTO `address` VALUES (11, 1, '罗峰', '12345678901', '天津城');
INSERT INTO `address` VALUES (12, 1, '罗峰', '12345678901', '洪宁市');
INSERT INTO `address` VALUES (13, 1, '罗峰', '12345678901', '江南市扬州城');
INSERT INTO `address` VALUES (18, 1, '罗峰', '12345678901', '京都市京都城');
INSERT INTO `address` VALUES (19, 2, '孟川', '12345678902', '东宁县');
INSERT INTO `address` VALUES (20, 2, '孟川', '12345678902', '元初山');
INSERT INTO `address` VALUES (23, 3, '秦羽', '12345678903', '炎京城');
INSERT INTO `address` VALUES (24, 4, '秦云', '12345678904', '广陵郡');
INSERT INTO `address` VALUES (25, 5, '东伯雪鹰', '12345678905', '清河郡');

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `Aid` int NOT NULL AUTO_INCREMENT,
  `Ausername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Apassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminuser
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES (1, 1, '极限之家', '江南市扬州城');
INSERT INTO `business` VALUES (2, 3, '星辰阁', '迷雾城');

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
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '马克思主义  列宁主义  毛泽东思想  邓小平理论');
INSERT INTO `category` VALUES (2, '哲学  宗教');
INSERT INTO `category` VALUES (3, '社会科学总论');
INSERT INTO `category` VALUES (4, '政治  法律  军事  经济');
INSERT INTO `category` VALUES (5, '文化  科学  教育  体育');
INSERT INTO `category` VALUES (6, '语言  文字  文学  艺术');
INSERT INTO `category` VALUES (7, '历史  地理');
INSERT INTO `category` VALUES (8, '自然科学总论');
INSERT INTO `category` VALUES (9, '数理科学和化学');
INSERT INTO `category` VALUES (10, '天文学  地球科学');
INSERT INTO `category` VALUES (11, '生物科学  医药  卫生');
INSERT INTO `category` VALUES (12, '农业科学');
INSERT INTO `category` VALUES (13, '工业技术');
INSERT INTO `category` VALUES (14, '交通运输  航空  航天');
INSERT INTO `category` VALUES (15, '环境科学  安全科学');
INSERT INTO `category` VALUES (16, '综合性图书');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond`  (
  `Csid` int NOT NULL AUTO_INCREMENT,
  `Csname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Cateid` int NOT NULL,
  PRIMARY KEY (`Csid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES (1, '马克思、恩格斯著作', 1);
INSERT INTO `categorysecond` VALUES (2, '列宁著作', 1);
INSERT INTO `categorysecond` VALUES (3, '斯大林著作', 1);
INSERT INTO `categorysecond` VALUES (4, '毛泽东著作', 1);
INSERT INTO `categorysecond` VALUES (5, '邓小平著作', 1);
INSERT INTO `categorysecond` VALUES (6, '马克思、恩格斯、列宁、斯大林、毛泽东、邓小平著作汇编', 1);
INSERT INTO `categorysecond` VALUES (7, '马克思、恩格斯、列宁、斯大林、毛泽东、邓小平生平和传记', 1);
INSERT INTO `categorysecond` VALUES (8, '马克思主义、列宁主义、毛泽东思想、邓小平理论的学习和研究', 1);
INSERT INTO `categorysecond` VALUES (9, '哲学教育与普及', 2);
INSERT INTO `categorysecond` VALUES (10, '哲学理论', 2);
INSERT INTO `categorysecond` VALUES (11, '世界哲学', 2);
INSERT INTO `categorysecond` VALUES (12, '中国哲学', 2);
INSERT INTO `categorysecond` VALUES (13, '亚洲哲学', 2);
INSERT INTO `categorysecond` VALUES (14, '非洲哲学', 2);
INSERT INTO `categorysecond` VALUES (15, '欧洲哲学', 2);
INSERT INTO `categorysecond` VALUES (16, '大洋洲哲学', 2);
INSERT INTO `categorysecond` VALUES (17, '美洲哲学', 2);
INSERT INTO `categorysecond` VALUES (18, '思维科学', 2);
INSERT INTO `categorysecond` VALUES (19, '逻辑学（论理学）', 2);
INSERT INTO `categorysecond` VALUES (20, '伦理学（道德哲学）', 2);
INSERT INTO `categorysecond` VALUES (21, '美学', 2);
INSERT INTO `categorysecond` VALUES (22, '心理学', 2);
INSERT INTO `categorysecond` VALUES (23, '宗教', 2);
INSERT INTO `categorysecond` VALUES (24, '社会科学理论与方法论', 3);
INSERT INTO `categorysecond` VALUES (25, '社会科学现状及发展', 3);
INSERT INTO `categorysecond` VALUES (26, '社会科学机构、团体、会议', 3);
INSERT INTO `categorysecond` VALUES (27, '社会科学研究方法', 3);
INSERT INTO `categorysecond` VALUES (28, '社会科学教育与普及', 3);
INSERT INTO `categorysecond` VALUES (29, '社会科学丛书、文集、连续性出版物', 3);
INSERT INTO `categorysecond` VALUES (30, '社会科学参考工具书', 3);
INSERT INTO `categorysecond` VALUES (31, '社会科学文献检索工具书', 3);
INSERT INTO `categorysecond` VALUES (32, '统计学', 3);
INSERT INTO `categorysecond` VALUES (33, '社会学', 3);
INSERT INTO `categorysecond` VALUES (34, '人口学', 3);
INSERT INTO `categorysecond` VALUES (35, '管理学', 3);
INSERT INTO `categorysecond` VALUES (36, '系统科学', 3);
INSERT INTO `categorysecond` VALUES (37, '民族学', 3);
INSERT INTO `categorysecond` VALUES (38, '人才学', 3);
INSERT INTO `categorysecond` VALUES (39, '劳动科学', 3);
INSERT INTO `categorysecond` VALUES (40, '政治理论', 4);
INSERT INTO `categorysecond` VALUES (41, '国际共产主义运动', 4);
INSERT INTO `categorysecond` VALUES (42, '中国共产党', 4);
INSERT INTO `categorysecond` VALUES (43, '各国共产党', 4);
INSERT INTO `categorysecond` VALUES (44, '工人、农民、青年、妇女运动与组织', 4);
INSERT INTO `categorysecond` VALUES (45, '世界政治', 4);
INSERT INTO `categorysecond` VALUES (46, '中国政治', 4);
INSERT INTO `categorysecond` VALUES (47, '各国政治', 4);
INSERT INTO `categorysecond` VALUES (48, '外交、国际关系', 4);
INSERT INTO `categorysecond` VALUES (49, '法律', 4);
INSERT INTO `categorysecond` VALUES (50, '军事理论', 4);
INSERT INTO `categorysecond` VALUES (51, '世界军事', 4);
INSERT INTO `categorysecond` VALUES (52, '中国军事', 4);
INSERT INTO `categorysecond` VALUES (53, '各国军事', 4);
INSERT INTO `categorysecond` VALUES (54, '战略学、战役学、战术学', 4);
INSERT INTO `categorysecond` VALUES (55, '军事技术', 4);
INSERT INTO `categorysecond` VALUES (56, '军事地形学、军事地理学', 4);
INSERT INTO `categorysecond` VALUES (57, '经济学', 4);
INSERT INTO `categorysecond` VALUES (58, '世界各国经济概况、经济史、经济地理', 4);
INSERT INTO `categorysecond` VALUES (59, '经济计划与管理', 4);
INSERT INTO `categorysecond` VALUES (60, '农业经济', 4);
INSERT INTO `categorysecond` VALUES (61, '工业经济', 4);
INSERT INTO `categorysecond` VALUES (62, '信息产业经济（总论）', 4);
INSERT INTO `categorysecond` VALUES (63, '交通运输经济', 4);
INSERT INTO `categorysecond` VALUES (64, '旅游经济', 4);
INSERT INTO `categorysecond` VALUES (65, '邮电经济', 4);
INSERT INTO `categorysecond` VALUES (66, '贸易经济', 4);
INSERT INTO `categorysecond` VALUES (67, '财政、金融', 4);
INSERT INTO `categorysecond` VALUES (68, '文化理论', 5);
INSERT INTO `categorysecond` VALUES (69, '世界各国文化与文化事业', 5);
INSERT INTO `categorysecond` VALUES (70, '信息与知识传播', 5);
INSERT INTO `categorysecond` VALUES (71, '科学、科学研究', 5);
INSERT INTO `categorysecond` VALUES (72, '教育', 5);
INSERT INTO `categorysecond` VALUES (73, '体育', 5);
INSERT INTO `categorysecond` VALUES (74, '语言学', 6);
INSERT INTO `categorysecond` VALUES (75, '汉语', 6);
INSERT INTO `categorysecond` VALUES (76, '中国少数民族语言', 6);
INSERT INTO `categorysecond` VALUES (77, '常用外国语', 6);
INSERT INTO `categorysecond` VALUES (78, '汉藏语系', 6);
INSERT INTO `categorysecond` VALUES (79, '阿尔泰语系（突厥-蒙古-通古斯语系）', 6);
INSERT INTO `categorysecond` VALUES (80, '南亚语系（澳斯特罗-亚细亚语系）', 6);
INSERT INTO `categorysecond` VALUES (81, '南印语系（达罗毗荼语系、德拉维达语系）', 6);
INSERT INTO `categorysecond` VALUES (82, '南岛语系（马来亚-玻里尼西亚语系）', 6);
INSERT INTO `categorysecond` VALUES (83, '东北亚诸语言', 6);
INSERT INTO `categorysecond` VALUES (84, '高加索语系（伊比利亚-高加索语系）', 6);
INSERT INTO `categorysecond` VALUES (85, '乌拉尔语系（芬兰-乌戈尔语系）', 6);
INSERT INTO `categorysecond` VALUES (86, '闪-含语系（阿非罗-亚细亚语系）', 6);
INSERT INTO `categorysecond` VALUES (87, '印欧语系', 6);
INSERT INTO `categorysecond` VALUES (88, '非洲诸语言', 6);
INSERT INTO `categorysecond` VALUES (89, '美洲诸语言', 6);
INSERT INTO `categorysecond` VALUES (90, '大洋洲诸语言', 6);
INSERT INTO `categorysecond` VALUES (91, '国际辅助语', 6);
INSERT INTO `categorysecond` VALUES (92, '文学理论', 6);
INSERT INTO `categorysecond` VALUES (93, '世界文学', 6);
INSERT INTO `categorysecond` VALUES (94, '中国文学', 6);
INSERT INTO `categorysecond` VALUES (95, '各国文学', 6);
INSERT INTO `categorysecond` VALUES (96, '艺术理论', 6);
INSERT INTO `categorysecond` VALUES (97, '世界各国艺术概况', 6);
INSERT INTO `categorysecond` VALUES (98, '绘画', 6);
INSERT INTO `categorysecond` VALUES (99, '书法、篆刻', 6);
INSERT INTO `categorysecond` VALUES (100, '雕塑', 6);
INSERT INTO `categorysecond` VALUES (101, '摄影艺术', 6);
INSERT INTO `categorysecond` VALUES (102, '工艺美术', 6);
INSERT INTO `categorysecond` VALUES (103, '建筑艺术', 6);
INSERT INTO `categorysecond` VALUES (104, '音乐', 6);
INSERT INTO `categorysecond` VALUES (105, '舞蹈', 6);
INSERT INTO `categorysecond` VALUES (106, '戏剧艺术', 6);
INSERT INTO `categorysecond` VALUES (107, '电影、电视艺术', 6);
INSERT INTO `categorysecond` VALUES (108, '史学理论', 7);
INSERT INTO `categorysecond` VALUES (109, '世界史', 7);
INSERT INTO `categorysecond` VALUES (110, '中国史', 7);
INSERT INTO `categorysecond` VALUES (111, '亚洲史', 7);
INSERT INTO `categorysecond` VALUES (112, '非洲史', 7);
INSERT INTO `categorysecond` VALUES (113, '欧洲史', 7);
INSERT INTO `categorysecond` VALUES (114, '大洋洲史', 7);
INSERT INTO `categorysecond` VALUES (115, '美洲史', 7);
INSERT INTO `categorysecond` VALUES (116, '传记', 7);
INSERT INTO `categorysecond` VALUES (117, '文物考古', 7);
INSERT INTO `categorysecond` VALUES (118, '风俗习惯', 7);
INSERT INTO `categorysecond` VALUES (119, '地理', 7);
INSERT INTO `categorysecond` VALUES (120, '自然科学理论与方法论', 8);
INSERT INTO `categorysecond` VALUES (121, '自然科学现状及发展', 8);
INSERT INTO `categorysecond` VALUES (122, '自然科学机构、团体、会议', 8);
INSERT INTO `categorysecond` VALUES (123, '自然科学研究方法', 8);
INSERT INTO `categorysecond` VALUES (124, '自然科学教育与普及', 8);
INSERT INTO `categorysecond` VALUES (125, '自然科学丛书、文集、连续性出版物', 8);
INSERT INTO `categorysecond` VALUES (126, '自然科学参考工具书', 8);
INSERT INTO `categorysecond` VALUES (127, '自然科学文献检索工具', 8);
INSERT INTO `categorysecond` VALUES (128, '自然科学调查、考察', 8);
INSERT INTO `categorysecond` VALUES (129, '自然研究、自然历史', 8);
INSERT INTO `categorysecond` VALUES (130, '非线性科学', 8);
INSERT INTO `categorysecond` VALUES (131, '系统科学', 8);
INSERT INTO `categorysecond` VALUES (132, '情报学、情报工作', 8);
INSERT INTO `categorysecond` VALUES (133, '数学', 9);
INSERT INTO `categorysecond` VALUES (134, '力学', 9);
INSERT INTO `categorysecond` VALUES (135, '物理学', 9);
INSERT INTO `categorysecond` VALUES (136, '化学', 9);
INSERT INTO `categorysecond` VALUES (137, '晶体学', 9);
INSERT INTO `categorysecond` VALUES (138, '天文学', 10);
INSERT INTO `categorysecond` VALUES (139, '测绘学', 10);
INSERT INTO `categorysecond` VALUES (140, '地球物理学', 10);
INSERT INTO `categorysecond` VALUES (141, '大气科学（气象学）', 10);
INSERT INTO `categorysecond` VALUES (142, '地质学', 10);
INSERT INTO `categorysecond` VALUES (143, '海洋学', 10);
INSERT INTO `categorysecond` VALUES (144, '自然地理学', 10);
INSERT INTO `categorysecond` VALUES (145, '生物科学的理论与方法', 11);
INSERT INTO `categorysecond` VALUES (146, '生物科学现状与发展', 11);
INSERT INTO `categorysecond` VALUES (147, '生物科学的研究方法与技术', 11);
INSERT INTO `categorysecond` VALUES (148, '生物科学教育与普及', 11);
INSERT INTO `categorysecond` VALUES (149, '生物资源调查', 11);
INSERT INTO `categorysecond` VALUES (150, '普通生物学', 11);
INSERT INTO `categorysecond` VALUES (151, '细胞生物学', 11);
INSERT INTO `categorysecond` VALUES (152, '遗传学', 11);
INSERT INTO `categorysecond` VALUES (153, '生理学', 11);
INSERT INTO `categorysecond` VALUES (154, '生物化学', 11);
INSERT INTO `categorysecond` VALUES (155, '生物物理学', 11);
INSERT INTO `categorysecond` VALUES (156, '分子生物学', 11);
INSERT INTO `categorysecond` VALUES (157, '生物工程学（生物技术）', 11);
INSERT INTO `categorysecond` VALUES (158, '环境生物学', 11);
INSERT INTO `categorysecond` VALUES (159, '古生物学', 11);
INSERT INTO `categorysecond` VALUES (160, '微生物学', 11);
INSERT INTO `categorysecond` VALUES (161, '植物学', 11);
INSERT INTO `categorysecond` VALUES (162, '动物学', 11);
INSERT INTO `categorysecond` VALUES (163, '昆虫学', 11);
INSERT INTO `categorysecond` VALUES (164, '人类学', 11);
INSERT INTO `categorysecond` VALUES (165, '一般理论', 11);
INSERT INTO `categorysecond` VALUES (166, '现状与发展', 11);
INSERT INTO `categorysecond` VALUES (167, '医学研究方法', 11);
INSERT INTO `categorysecond` VALUES (168, '预防医学、卫生学', 11);
INSERT INTO `categorysecond` VALUES (169, '中国医学', 11);
INSERT INTO `categorysecond` VALUES (170, '基础医学', 11);
INSERT INTO `categorysecond` VALUES (171, '临床医学', 11);
INSERT INTO `categorysecond` VALUES (172, '内科学', 11);
INSERT INTO `categorysecond` VALUES (173, '外科学', 11);
INSERT INTO `categorysecond` VALUES (174, '妇产科学', 11);
INSERT INTO `categorysecond` VALUES (175, '儿科学', 11);
INSERT INTO `categorysecond` VALUES (176, '肿瘤学', 11);
INSERT INTO `categorysecond` VALUES (177, '神经病学与精神病学', 11);
INSERT INTO `categorysecond` VALUES (178, '皮肤病学与性病学', 11);
INSERT INTO `categorysecond` VALUES (179, '耳鼻咽喉科学', 11);
INSERT INTO `categorysecond` VALUES (180, '眼科学', 11);
INSERT INTO `categorysecond` VALUES (181, '口腔科学', 11);
INSERT INTO `categorysecond` VALUES (182, '外国民族医学', 11);
INSERT INTO `categorysecond` VALUES (183, '特种医学', 11);
INSERT INTO `categorysecond` VALUES (184, '药学', 11);
INSERT INTO `categorysecond` VALUES (185, '一般性理论', 12);
INSERT INTO `categorysecond` VALUES (186, '农业科学技术现状与发展', 12);
INSERT INTO `categorysecond` VALUES (187, '农业科学研究、试验', 12);
INSERT INTO `categorysecond` VALUES (188, '农业经济', 12);
INSERT INTO `categorysecond` VALUES (189, '农业基础科学', 12);
INSERT INTO `categorysecond` VALUES (190, '农业工程', 12);
INSERT INTO `categorysecond` VALUES (191, '农学（农艺学）', 12);
INSERT INTO `categorysecond` VALUES (192, '植物保护', 12);
INSERT INTO `categorysecond` VALUES (193, '农作物', 12);
INSERT INTO `categorysecond` VALUES (194, '园艺', 12);
INSERT INTO `categorysecond` VALUES (195, '林业', 12);
INSERT INTO `categorysecond` VALUES (196, '畜牧、动物医学、狩猎、蚕、蜂', 12);
INSERT INTO `categorysecond` VALUES (197, '水产、渔业', 12);
INSERT INTO `categorysecond` VALUES (198, '工业技术理论', 13);
INSERT INTO `categorysecond` VALUES (199, '工业技术现状与发展', 13);
INSERT INTO `categorysecond` VALUES (200, '机构、团体、会议', 13);
INSERT INTO `categorysecond` VALUES (201, '参考工具书', 13);
INSERT INTO `categorysecond` VALUES (202, '工业经济', 13);
INSERT INTO `categorysecond` VALUES (203, '一般工业技术', 13);
INSERT INTO `categorysecond` VALUES (204, '矿业工程', 13);
INSERT INTO `categorysecond` VALUES (205, '石油、天然气工业', 13);
INSERT INTO `categorysecond` VALUES (206, '冶金工业', 13);
INSERT INTO `categorysecond` VALUES (207, '金属学与金属工艺', 13);
INSERT INTO `categorysecond` VALUES (208, '机械、仪表工业', 13);
INSERT INTO `categorysecond` VALUES (209, '武器工业', 13);
INSERT INTO `categorysecond` VALUES (210, '能源与动力工程', 13);
INSERT INTO `categorysecond` VALUES (211, '原子能技术', 13);
INSERT INTO `categorysecond` VALUES (212, '电工技术', 13);
INSERT INTO `categorysecond` VALUES (213, '无线电电子学、电信技术', 13);
INSERT INTO `categorysecond` VALUES (214, '自动化技术、计算机技术', 13);
INSERT INTO `categorysecond` VALUES (215, '化学工业', 13);
INSERT INTO `categorysecond` VALUES (216, '轻工业、手工业', 13);
INSERT INTO `categorysecond` VALUES (217, '建筑科学', 13);
INSERT INTO `categorysecond` VALUES (218, '水利工程', 13);
INSERT INTO `categorysecond` VALUES (219, '交通运输经济', 14);
INSERT INTO `categorysecond` VALUES (220, '综合运输', 14);
INSERT INTO `categorysecond` VALUES (221, '铁路运输', 14);
INSERT INTO `categorysecond` VALUES (222, '公路运输', 14);
INSERT INTO `categorysecond` VALUES (223, '水路运输', 14);
INSERT INTO `categorysecond` VALUES (224, '航空运输', 14);
INSERT INTO `categorysecond` VALUES (225, '航空、航天技术的研究与探索', 14);
INSERT INTO `categorysecond` VALUES (226, '航空', 14);
INSERT INTO `categorysecond` VALUES (227, '航天（宇宙航行）', 14);
INSERT INTO `categorysecond` VALUES (228, '航空、航天医学', 14);
INSERT INTO `categorysecond` VALUES (229, '环境科学理论', 15);
INSERT INTO `categorysecond` VALUES (230, '环境科学技术现状与发展', 15);
INSERT INTO `categorysecond` VALUES (231, '环境保护宣传教育及普及', 15);
INSERT INTO `categorysecond` VALUES (232, '环境保护参考工具书', 15);
INSERT INTO `categorysecond` VALUES (233, '环境科学基础理论', 15);
INSERT INTO `categorysecond` VALUES (234, '社会与环境', 15);
INSERT INTO `categorysecond` VALUES (235, '环境保护管理', 15);
INSERT INTO `categorysecond` VALUES (236, '灾害及其防治', 15);
INSERT INTO `categorysecond` VALUES (237, '环境污染及其防治', 15);
INSERT INTO `categorysecond` VALUES (238, '废物处理与综合利用', 15);
INSERT INTO `categorysecond` VALUES (239, '环境质量评价与环境监测', 15);
INSERT INTO `categorysecond` VALUES (240, '安全科学', 15);
INSERT INTO `categorysecond` VALUES (241, '丛书', 16);
INSERT INTO `categorysecond` VALUES (242, '百科全书、类书', 16);
INSERT INTO `categorysecond` VALUES (243, '辞典', 16);
INSERT INTO `categorysecond` VALUES (244, '论文集、全集、选集、杂著', 16);
INSERT INTO `categorysecond` VALUES (245, '年鉴、年刊', 16);
INSERT INTO `categorysecond` VALUES (246, '期刊、连续性出版物', 16);
INSERT INTO `categorysecond` VALUES (247, '图书目录、文摘、索引', 16);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `Cid` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `Pid` int NOT NULL,
  `Score` decimal(4, 2) NOT NULL,
  `Comm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2, 1, 4.50, '这是一本很好的Java学习用书');
INSERT INTO `comment` VALUES (2, 3, 2, 4.50, '这是一本很好的C++学习用书');
INSERT INTO `comment` VALUES (3, 4, 3, 4.50, '这是一本很好的Python学习用书');
INSERT INTO `comment` VALUES (4, 2, 4, 2.50, '这并不是一本很好的Java学习用书');
INSERT INTO `comment` VALUES (5, 3, 1, 1.00, '这本书很差劲');
INSERT INTO `comment` VALUES (6, 4, 1, 5.00, '这是一本极好的Java学习用书');
INSERT INTO `comment` VALUES (7, 5, 3, 4.50, '这是一本很好的Python学习用书');
INSERT INTO `comment` VALUES (8, 2, 5, 4.50, '这是一本很好的Java学习用书');
INSERT INTO `comment` VALUES (9, 3, 3, 4.50, '这是一本很好的Python学习用书');
INSERT INTO `comment` VALUES (10, 5, 1, 4.00, '这是一本不错的Java学习用书');
INSERT INTO `comment` VALUES (11, 2, 3, 0.50, '这本书非常差劲，0.5分都给高了');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `Oid` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `Bid` int NOT NULL,
  `Pid` int NOT NULL,
  `Pnum` int NOT NULL DEFAULT 1,
  `Money` decimal(20, 2) NOT NULL,
  `Ostate` tinyint NOT NULL DEFAULT 1,
  `Addrid` int NULL DEFAULT NULL,
  `Time` datetime NULL DEFAULT NULL,
  `Total` decimal(20, 2) NOT NULL,
  PRIMARY KEY (`Oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 2, 1, 1, 1, 69.98, 3, 19, '2021-04-13 18:16:54', 69.98);
INSERT INTO `orders` VALUES (2, 2, 1, 2, 1, 118.80, 2, 20, '2021-04-15 17:39:59', 118.80);
INSERT INTO `orders` VALUES (3, 2, 1, 3, 1, 50.98, 3, 20, '2021-04-14 17:08:44', 50.98);
INSERT INTO `orders` VALUES (4, 2, 1, 4, 1, 110.98, 3, 20, '2021-04-13 18:16:54', 110.98);
INSERT INTO `orders` VALUES (5, 2, 1, 5, 1, 118.80, 3, 19, '2021-04-13 18:16:54', 118.80);
INSERT INTO `orders` VALUES (6, 2, 1, 6, 1, 209.98, 2, 19, '2021-04-14 11:03:37', 209.98);
INSERT INTO `orders` VALUES (7, 3, 1, 1, 1, 69.98, 3, 23, '2021-04-13 18:16:54', 69.98);
INSERT INTO `orders` VALUES (8, 3, 1, 2, 1, 118.80, 3, 23, '2021-04-13 18:16:54', 118.80);
INSERT INTO `orders` VALUES (9, 3, 1, 3, 1, 50.98, 3, 23, '2021-04-13 18:16:54', 50.98);
INSERT INTO `orders` VALUES (10, 3, 1, 4, 1, 50.98, 0, NULL, NULL, 50.98);
INSERT INTO `orders` VALUES (11, 4, 1, 1, 1, 69.98, 3, 24, '2021-04-13 18:16:54', 69.98);
INSERT INTO `orders` VALUES (12, 4, 1, 3, 1, 50.98, 3, 24, '2021-04-13 18:16:54', 50.98);
INSERT INTO `orders` VALUES (13, 5, 1, 1, 1, 69.98, 3, 25, '2021-04-13 18:16:54', 69.98);
INSERT INTO `orders` VALUES (14, 5, 1, 3, 1, 50.98, 3, 25, '2021-04-13 18:16:54', 50.98);
INSERT INTO `orders` VALUES (15, 2, 1, 5, 4, 118.80, 0, 0, NULL, 475.20);
INSERT INTO `orders` VALUES (16, 2, 1, 6, 1, 209.98, 2, 19, '2021-04-15 17:44:11', 209.98);
INSERT INTO `orders` VALUES (18, 2, 1, 5, 1, 118.80, 1, 19, '2021-04-15 17:21:10', 118.80);
INSERT INTO `orders` VALUES (19, 2, 1, 6, 1, 209.98, 1, 19, '2021-04-15 17:38:07', 209.98);
INSERT INTO `orders` VALUES (20, 3, 1, 3, 1, 50.98, 1, 23, '2021-04-15 17:49:04', 50.98);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `Pid` int NOT NULL AUTO_INCREMENT,
  `Bid` int NOT NULL,
  `Pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Price` decimal(20, 2) NOT NULL,
  `Pnum` int NOT NULL,
  `Pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Csid` int NOT NULL,
  PRIMARY KEY (`Pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, 'Java编程基础', 69.98, 2000, 'Java学习必备用书', NULL, 214);
INSERT INTO `product` VALUES (2, 1, 'C++编程基础', 118.80, 2000, 'C++学习必备用书', NULL, 214);
INSERT INTO `product` VALUES (3, 1, 'Python编程基础', 50.98, 1999, 'Python学习必备用书', NULL, 214);
INSERT INTO `product` VALUES (4, 1, 'Java编程实践', 110.98, 2000, 'Java学习必备用书', NULL, 214);
INSERT INTO `product` VALUES (5, 1, 'C++编程实践', 118.80, 1999, 'C++学习必备用书', NULL, 214);
INSERT INTO `product` VALUES (6, 1, 'Python编程实践', 209.98, 1997, 'Python学习必备用书', NULL, 214);
INSERT INTO `product` VALUES (8, 2, '数据库系统', 58.80, 3000, '数据库基础教学用书', NULL, 214);
INSERT INTO `product` VALUES (9, 2, 'Java编程基础', 49.80, 5000, 'Java学习入门级用书', NULL, 214);
INSERT INTO `product` VALUES (10, 2, '斗罗大陆', 29.80, 500, '一本耐读的玄幻小说', NULL, 94);
INSERT INTO `product` VALUES (11, 2, '论持久战', 29.80, 100, '一本著于抗日战争时期的战术经典著作', NULL, 52);
INSERT INTO `product` VALUES (12, 2, '孙子兵法（精编版）', 239.80, 1000, '中国古代经典军事学著作', NULL, 52);

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
  `IsBusiness` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`Uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '12345678901', '12345678', '罗峰', '12345678901', 'lf12345678901@126.com', 1);
INSERT INTO `user` VALUES (2, '12345678902', '12345678', '孟川', '12345678902', 'mc12345678902@163.com', 0);
INSERT INTO `user` VALUES (3, '12345678903', '12345678', '秦羽', '12345678903', 'qy12345678903@126.com', 1);
INSERT INTO `user` VALUES (4, '12345678904', '12345678', '12345678904', '12345678904', NULL, 0);
INSERT INTO `user` VALUES (5, '12345678905', '12345678', '12345678905', '12345678905', NULL, 0);
INSERT INTO `user` VALUES (9, '12345678906', '12345678', '12345678906', '12345678906', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
