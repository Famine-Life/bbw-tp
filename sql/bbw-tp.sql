/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : c2c

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 19/03/2020 16:42:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admininformation
-- ----------------------------
DROP TABLE IF EXISTS `admininformation`;
CREATE TABLE `admininformation`  (
  `id` int(11) NOT NULL,
  `ano` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adminoperation
-- ----------------------------
DROP TABLE IF EXISTS `adminoperation`;
CREATE TABLE `adminoperation`  (
  `id` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for allkinds
-- ----------------------------
DROP TABLE IF EXISTS `allkinds`;
CREATE TABLE `allkinds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of allkinds
-- ----------------------------
INSERT INTO `allkinds` VALUES (1, '数码科技', '2020-02-14 13:28:20');
INSERT INTO `allkinds` VALUES (2, '影音家电', '2020-02-14 13:28:20');
INSERT INTO `allkinds` VALUES (3, '鞋服配饰', '2020-02-14 13:28:20');
INSERT INTO `allkinds` VALUES (4, '运动代步', '2020-02-14 13:28:20');
INSERT INTO `allkinds` VALUES (5, '书籍文具', '2020-02-14 13:28:20');
INSERT INTO `allkinds` VALUES (6, '其他', '2020-02-14 13:28:20');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` int(11) NOT NULL COMMENT '公告id',
  `announcement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '公告',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (1, '你好啊，这里是北部湾大学二手交易平台！');

-- ----------------------------
-- Table structure for boughtshop
-- ----------------------------
DROP TABLE IF EXISTS `boughtshop`;
CREATE TABLE `boughtshop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES (1, '手机', NULL, 1);
INSERT INTO `classification` VALUES (2, '相机', NULL, 1);
INSERT INTO `classification` VALUES (3, '电脑', NULL, 1);
INSERT INTO `classification` VALUES (4, '家电', NULL, 2);
INSERT INTO `classification` VALUES (5, '影音', NULL, 2);
INSERT INTO `classification` VALUES (6, '女装', NULL, 3);
INSERT INTO `classification` VALUES (7, '男装', NULL, 3);
INSERT INTO `classification` VALUES (8, '女鞋', NULL, 3);
INSERT INTO `classification` VALUES (9, '男鞋', NULL, 3);
INSERT INTO `classification` VALUES (10, '箱包', NULL, 3);
INSERT INTO `classification` VALUES (11, '手表', NULL, 3);
INSERT INTO `classification` VALUES (12, '器材', NULL, 4);
INSERT INTO `classification` VALUES (13, '代步', NULL, 4);
INSERT INTO `classification` VALUES (14, '修养', NULL, 5);
INSERT INTO `classification` VALUES (15, '专业', NULL, 5);
INSERT INTO `classification` VALUES (16, '文具', NULL, 5);
INSERT INTO `classification` VALUES (17, '其他', NULL, 6);

-- ----------------------------
-- Table structure for goodscar
-- ----------------------------
DROP TABLE IF EXISTS `goodscar`;
CREATE TABLE `goodscar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodscar
-- ----------------------------
INSERT INTO `goodscar` VALUES (5, '2020-02-11 15:06:25', 100, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (6, '2020-02-15 13:25:32', 91, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (7, '2020-02-15 13:28:04', 92, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (8, '2020-02-15 22:33:22', 89, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (9, '2020-02-15 22:33:24', 84, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (10, '2020-02-16 15:53:12', 92, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (11, '2020-02-17 14:10:15', 89, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (12, '2020-02-17 14:10:18', 90, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (13, '2020-02-17 14:25:08', 80, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (14, '2020-02-17 14:25:10', 79, 1604412308, 1, 1);
INSERT INTO `goodscar` VALUES (15, '2020-02-17 14:25:12', 81, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (16, '2020-02-17 16:27:54', 87, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (17, '2020-02-17 16:27:56', 81, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (18, '2020-02-17 16:28:03', 41, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (19, '2020-02-20 16:27:19', 26, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (20, '2020-02-20 16:27:38', 73, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (21, '2020-02-20 16:27:53', 87, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (22, '2020-02-20 16:28:47', 84, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (23, '2020-02-20 16:29:25', 68, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (24, '2020-02-20 16:29:43', 31, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (25, '2020-02-20 16:30:04', 24, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (26, '2020-02-20 16:30:52', 72, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (27, '2020-02-21 14:53:49', 83, 1604412308, 1, 1);
INSERT INTO `goodscar` VALUES (28, '2020-02-21 14:55:09', 100, 1604412308, 1, 1);
INSERT INTO `goodscar` VALUES (29, '2020-02-21 14:57:40', 100, 1604412308, 1, 0);
INSERT INTO `goodscar` VALUES (30, '2020-02-21 15:05:27', 102, 1604412308, 1, 1);
INSERT INTO `goodscar` VALUES (31, '2020-03-19 13:38:56', 102, 1111111111, 1, 1);
INSERT INTO `goodscar` VALUES (32, '2020-03-19 13:38:58', 101, 1111111111, 1, 1);
INSERT INTO `goodscar` VALUES (33, '2020-03-19 13:39:42', 100, 1111111111, 1, 1);

-- ----------------------------
-- Table structure for goodsoforderform
-- ----------------------------
DROP TABLE IF EXISTS `goodsoforderform`;
CREATE TABLE `goodsoforderform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ofid` int(11) NOT NULL COMMENT 'orderForm id',
  `sid` int(11) NOT NULL COMMENT '商品id',
  `modified` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `display` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodsoforderform
-- ----------------------------
INSERT INTO `goodsoforderform` VALUES (35, 30, 92, '2020-02-16 17:39:56', 2, 1);
INSERT INTO `goodsoforderform` VALUES (36, 31, 92, '2020-02-16 17:44:00', 3, 1);
INSERT INTO `goodsoforderform` VALUES (37, 32, 92, '2020-02-16 17:45:03', 1, 1);
INSERT INTO `goodsoforderform` VALUES (38, 33, 90, '2020-02-17 14:10:31', 1, 1);
INSERT INTO `goodsoforderform` VALUES (39, 33, 89, '2020-02-17 14:10:31', 1, 1);
INSERT INTO `goodsoforderform` VALUES (40, 34, 81, '2020-02-17 14:25:21', 1, 1);
INSERT INTO `goodsoforderform` VALUES (41, 34, 79, '2020-02-17 14:25:21', 2, 1);
INSERT INTO `goodsoforderform` VALUES (42, 34, 80, '2020-02-17 14:25:21', 1, 1);
INSERT INTO `goodsoforderform` VALUES (43, 35, 41, '2020-02-17 16:28:19', 1, 1);
INSERT INTO `goodsoforderform` VALUES (44, 35, 81, '2020-02-17 16:28:19', 1, 1);
INSERT INTO `goodsoforderform` VALUES (45, 35, 87, '2020-02-17 16:28:19', 1, 1);
INSERT INTO `goodsoforderform` VALUES (46, 36, 87, '2020-02-20 16:28:23', 2, 1);
INSERT INTO `goodsoforderform` VALUES (47, 36, 73, '2020-02-20 16:28:23', 1, 1);
INSERT INTO `goodsoforderform` VALUES (48, 37, 84, '2020-02-20 16:28:55', 2, 1);
INSERT INTO `goodsoforderform` VALUES (49, 38, 68, '2020-02-20 16:29:36', 1, 1);
INSERT INTO `goodsoforderform` VALUES (50, 39, 31, '2020-02-20 16:29:53', 1, 1);
INSERT INTO `goodsoforderform` VALUES (52, 40, 31, '2020-02-20 16:30:10', 1, 1);
INSERT INTO `goodsoforderform` VALUES (53, 41, 72, '2020-02-20 16:31:04', 1, 1);
INSERT INTO `goodsoforderform` VALUES (54, 42, 101, '2020-03-19 13:39:04', 1, 1);
INSERT INTO `goodsoforderform` VALUES (55, 42, 102, '2020-03-19 13:39:04', 1, 1);
INSERT INTO `goodsoforderform` VALUES (56, 43, 100, '2020-03-19 13:39:54', 1, 1);
INSERT INTO `goodsoforderform` VALUES (57, 43, 101, '2020-03-19 13:39:54', 1, 1);
INSERT INTO `goodsoforderform` VALUES (58, 43, 102, '2020-03-19 13:39:54', 1, 1);

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `modified` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `display` int(11) NOT NULL DEFAULT 1,
  `uid` int(11) NOT NULL COMMENT 'user ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES (30, '2020-02-16 17:39:56', 1, 1604412308, 'dddd', NULL);
INSERT INTO `orderform` VALUES (31, '2020-02-16 17:44:00', 1, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (32, '2020-02-16 17:45:03', 1, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (33, '2020-02-17 14:10:31', 1, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (34, '2020-02-17 14:25:21', 1, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (35, '2020-02-17 16:28:19', 1, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (36, '2020-02-20 16:28:23', 1, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (37, '2020-02-20 16:28:55', 0, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (38, '2020-02-20 16:29:36', 0, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (39, '2020-02-20 16:29:53', 0, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (40, '2020-02-20 16:30:10', 0, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (41, '2020-02-20 16:31:04', 0, 1604412308, '默认地址', NULL);
INSERT INTO `orderform` VALUES (42, '2020-03-19 13:39:04', 1, 1111111111, '默认地址', NULL);
INSERT INTO `orderform` VALUES (43, '2020-03-19 13:39:54', 1, 1111111111, '默认地址', NULL);

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shopcontext
-- ----------------------------
DROP TABLE IF EXISTS `shopcontext`;
CREATE TABLE `shopcontext`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  `uid` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcontext
-- ----------------------------
INSERT INTO `shopcontext` VALUES (1, '2020-02-11 16:09:35', 92, '今天是个哈日子', 1, 1);
INSERT INTO `shopcontext` VALUES (2, '2020-02-11 16:38:44', 92, 'test', 1, 1);
INSERT INTO `shopcontext` VALUES (3, '2020-02-11 19:29:25', 92, '好的东西就要积累', 1, 7);
INSERT INTO `shopcontext` VALUES (4, '2020-02-11 19:30:12', 92, '好的东西就要积累', 1, 7);
INSERT INTO `shopcontext` VALUES (5, '2020-02-11 19:33:48', 92, '好的东西', 1, 7);
INSERT INTO `shopcontext` VALUES (6, '2020-02-11 19:47:02', 5, '111111', 1, 7);
INSERT INTO `shopcontext` VALUES (7, '2020-02-11 19:47:50', 5, '1111', 1, 7);
INSERT INTO `shopcontext` VALUES (8, '2020-02-11 19:48:49', 5, '就看见看看', 1, 7);
INSERT INTO `shopcontext` VALUES (9, '2020-02-11 19:50:41', 92, '嘻嘻', 1, 7);
INSERT INTO `shopcontext` VALUES (10, '2020-02-11 22:07:14', 88, '1111', 1, 7);
INSERT INTO `shopcontext` VALUES (11, '2020-02-11 22:19:19', 69, '11111', 1, 7);
INSERT INTO `shopcontext` VALUES (12, '2020-02-11 13:54:13', 1096, '11111', 1, 7);
INSERT INTO `shopcontext` VALUES (13, '2020-02-11 15:52:52', 1095, 'test', 1, 9);
INSERT INTO `shopcontext` VALUES (14, '2020-02-11 15:54:07', 1095, 'test44', 1, 9);
INSERT INTO `shopcontext` VALUES (15, '2020-02-11 17:14:44', 100, 'fff', 1, 1604412308);
INSERT INTO `shopcontext` VALUES (16, '2020-02-11 17:25:15', 28, 'fdfdf', 1, 1604412308);
INSERT INTO `shopcontext` VALUES (17, '2020-02-11 21:49:47', 115, '啊啊', 1, 1604412308);
INSERT INTO `shopcontext` VALUES (18, '2020-02-21 16:11:53', 102, '你好，肖战能打个折不？', 1, 1604412308);

-- ----------------------------
-- Table structure for shopinformation
-- ----------------------------
DROP TABLE IF EXISTS `shopinformation`;
CREATE TABLE `shopinformation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `sort` int(11) NOT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  `quantity` int(11) NOT NULL,
  `transaction` int(11) NOT NULL DEFAULT 1,
  `sales` int(11) NULL DEFAULT 0,
  `uid` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumbnails` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopinformation
-- ----------------------------
INSERT INTO `shopinformation` VALUES (1, '2020-02-11 22:03:36', 'c', 4, '2020,武汉加油', 12.00, 33, 1, 3, 0, 1, 1604412308, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (2, '2020-02-11 22:03:36', '算法导论', 9, '2020,武汉加油', 70.00, 86, 1, 1, 1, 2, 1, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (3, '2020-02-11 22:03:36', '爱我的人', 3, '2020,武汉加油', 12.00, 3, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (4, '2020-02-11 22:03:36', '729乒乓球拍', 5, '2020,武汉加油', 77.56, 67, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (5, '2020-02-11 22:03:36', '苹果6S', 5, '2020,武汉加油', 5000.00, 1, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (6, '2020-02-11 22:03:36', '三星5A', 5, '2020,武汉加油', 4000.12, 2, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (7, '2020-02-11 22:03:36', '小米6', 7, '2020,武汉加油', 3000.56, 3, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (8, '2020-02-11 22:03:36', '华为8', 7, '2020,武汉加油', 3000.57, 4, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (9, '2020-02-11 22:03:36', '中兴8', 7, '2020,武汉加油', 3000.57, 5, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (10, '2020-02-11 22:03:36', '联系9', 7, '2020,武汉加油', 4654.00, 6, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (11, '2020-02-11 22:03:36', '魅族7S', 7, '2020,武汉加油', 4434.00, 7, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (12, '2020-02-11 22:03:36', '索爱8', 7, '2020,武汉加油', 4434.33, 8, 1, 3, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (13, '2020-02-11 22:03:36', '苹果耳机', 7, '2020,武汉加油', 100.00, 9, 1, 34, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (14, '2020-02-11 22:03:36', '普通相机10', 7, '2020,武汉加油', 5100.00, 10, 1, 34, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (15, '2020-02-11 22:03:36', '贾尼单反', 5, '2020,武汉加油', 5100.00, 11, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (16, '2020-02-11 22:03:36', '其他东东', 5, '2020,武汉加油', 5100.00, 12, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (17, '2020-02-11 22:03:36', '笔记本宏碁13', 8, '2020,武汉加油', 5100.00, 13, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (18, '2020-02-11 22:03:36', '苹果平板5', 8, '2020,武汉加油', 5100.00, 14, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (19, '2020-02-11 22:03:36', 'HP台式电脑', 8, '2020,武汉加油', 4100.00, 15, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (20, '2020-02-11 22:03:36', '戴尔显示器', 8, '2020,武汉加油', 1100.00, 16, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (21, '2020-02-11 22:03:36', '雷蛇鼠标', 8, '2020,武汉加油', 1100.00, 17, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (22, '2020-02-11 22:03:36', '雷神键盘', 8, '2020,武汉加油', 1100.00, 18, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (23, '2020-02-11 22:03:36', 'U盘金士顿64G', 8, '2020,武汉加油', 200.00, 19, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (24, '2020-02-11 22:03:36', '爱国者移动硬盘1T', 8, '2020,武汉加油', 500.90, 20, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (25, '2020-02-11 22:03:36', '爱？', 8, '2020,武汉加油', 500.90, 21, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (26, '2020-02-11 22:03:36', '小天鹅洗衣机', 8, '2020,武汉加油', 700.00, 22, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (27, '2020-02-11 22:03:36', '饮水机', 8, '2020,武汉加油', 700.00, 23, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (28, '2020-02-11 22:03:36', '吹风机', 8, '2020,武汉加油', 40.00, 24, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (29, '2020-02-11 22:03:36', '剃须刀', 8, '2020,武汉加油', 40.00, 25, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (30, '2020-02-11 22:03:36', '小型风扇', 8, '2020,武汉加油', 40.00, 26, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (31, '2020-02-11 22:03:36', '煮蛋器', 8, '2020,武汉加油', 40.00, 27, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (32, '2020-02-11 22:03:36', '电磁炉 美的', 8, '2020,武汉加油', 100.00, 28, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (33, '2020-02-11 22:03:36', '电饭煲格力', 8, '2020,武汉加油', 100.00, 29, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (34, '2020-02-11 22:03:36', '超级耳机', 8, '2020,武汉加油', 100.00, 30, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (35, '2020-02-11 22:03:36', '很好的音响', 8, '2020,武汉加油', 120.58, 31, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (36, '2020-02-11 22:03:36', '功放？', 8, '2020,武汉加油', 120.58, 32, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (37, '2020-02-11 22:03:36', '低音炮', 8, '2020,武汉加油', 120.58, 33, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (38, '2020-02-11 22:03:36', '麦克风', 8, '2020,武汉加油', 120.58, 34, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (39, '2020-02-11 22:03:36', '超好看的上衣', 8, '2020,武汉加油', 120.58, 35, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (40, '2020-02-11 22:03:36', '炫酷短裤', 8, '2020,武汉加油', 120.58, 36, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (41, '2020-02-11 22:03:36', '百褶裙', 8, '2020,武汉加油', 55.00, 37, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (42, '2020-02-11 22:03:36', '短上衣', 8, '2020,武汉加油', 55.00, 38, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (43, '2020-02-11 22:03:36', '长裤', 8, '2020,武汉加油', 55.00, 39, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (44, '2020-02-11 22:03:36', '运动鞋耐克', 8, '2020,武汉加油', 1200.00, 40, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (45, '2020-02-11 22:03:36', '皮鞋安踏', 8, '2020,武汉加油', 200.00, 41, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (46, '2020-02-11 22:03:36', '帆布鞋', 8, '2020,武汉加油', 200.00, 45, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (47, '2020-02-11 22:03:36', '球鞋', 8, '2020,武汉加油', 200.00, 46, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (48, '2020-02-11 22:03:36', '板鞋', 8, '2020,武汉加油', 200.00, 47, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (49, '2020-02-11 22:03:36', '男生运动鞋', 8, '2020,武汉加油', 200.00, 49, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (50, '2020-02-11 22:03:36', '男生皮鞋', 8, '2020,武汉加油', 500.00, 50, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (51, '2020-02-11 22:03:36', '男生帆布鞋', 8, '2020,武汉加油', 10.00, 51, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (52, '2020-02-11 22:03:36', '男生球鞋', 8, '2020,武汉加油', 1000.00, 52, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (53, '2020-02-11 22:03:36', '背包VL', 8, '2020,武汉加油', 1000.00, 55, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (54, '2020-02-11 22:03:36', '超级旅行包', 8, '2020,武汉加油', 200.00, 56, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (55, '2020-02-11 22:03:36', '呆板机械表', 8, '2020,武汉加油', 400.00, 58, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (56, '2020-02-11 22:03:36', '好看的石英表', 8, '2020,武汉加油', 400.00, 59, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (57, '2020-02-11 22:03:36', '一般电子版', 8, '2020,武汉加油', 100.00, 60, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (58, '2020-02-11 22:03:36', '足球', 8, '2020,武汉加油', 100.00, 62, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (59, '2020-02-11 22:03:36', '羽毛球拍', 8, '2020,武汉加油', 100.00, 63, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (60, '2020-02-11 22:03:36', '网球拍', 8, '2020,武汉加油', 100.00, 64, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (61, '2020-02-11 22:03:36', '篮球', 8, '2020,武汉加油', 100.00, 65, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (62, '2020-02-11 22:03:36', '滑轮', 8, '2020,武汉加油', 100.00, 66, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (63, '2020-02-11 22:03:36', '乒乓球拍', 8, '2020,武汉加油', 100.00, 67, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (64, '2020-02-11 22:03:36', '滑板', 8, '2020,武汉加油', 100.00, 68, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (65, '2020-02-11 22:03:36', '自行车', 8, '2020,武汉加油', 300.00, 70, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (66, '2020-02-11 22:03:36', '电动车', 8, '2020,武汉加油', 800.85, 71, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (67, '2020-02-11 22:03:36', '傲慢与偏见', 8, '2020,武汉加油', 20.00, 73, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (68, '2020-02-11 22:03:36', '海贼王漫画', 8, '2020,武汉加油', 20.00, 74, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (69, '2020-02-11 22:03:36', '爱尔兰的野马', 8, '2020,武汉加油', 20.00, 75, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (70, '2020-02-11 22:03:36', '生命的起源', 8, '2020,武汉加油', 25.00, 77, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (71, '2020-02-11 22:03:36', '神奇的化学变化', 8, '2020,武汉加油', 25.00, 78, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (72, '2020-02-11 22:03:36', '黑洞与白洞', 8, '2020,武汉加油', 51.00, 79, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (73, '2020-02-11 22:03:36', '诗经全集', 8, '2020,武汉加油', 51.00, 80, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (74, '2020-02-11 22:03:36', '小语种-莫拉语', 8, '2020,武汉加油', 51.00, 81, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (75, '2020-02-11 22:03:36', '真：五元十次方程详细解法', 8, '2020,武汉加油', 51.00, 82, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (76, '2020-02-11 22:03:36', '国家的安定', 8, '2020,武汉加油', 51.00, 83, 1, 4, 1, 0, 4, 'image/eW5NE6CM121494763475193.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (77, '2020-02-11 22:03:36', '曼陀罗消亡史', 8, '2020,武汉加油', 51.00, 84, 1, 4, 1, 0, 4, 'image/978P2M7w0ExYqmzci0aX20170105.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (78, '2020-02-11 22:03:36', '神奇的广东', 8, '2020,武汉加油', 51.00, 85, 1, 4, 1, 0, 4, 'image/978P2M7w0ExYqmzci0aX20170105.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (79, '2020-02-11 22:03:36', 'Spring实战', 8, '2020,武汉加油', 51.00, 86, 1, 4, 1, 0, 4, 'image/1.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (80, '2020-02-11 22:03:36', 'ACD画图', 8, '2020,武汉加油', 51.00, 87, 1, 4, 1, 0, 4, 'image/aug1NiTT40tXd3Zy1ZWL20161215.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (81, '2020-02-11 22:03:36', '怎么建房子容易倒塌', 8, '2020,武汉加油', 51.00, 88, 1, 4, 1, 0, 4, 'image/bvmE7d8698C3VdjSMjHm20161225.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (83, '2020-02-11 22:03:36', '狼毫笔', 8, '2020,武汉加油', 51.00, 91, 1, 4, 1, 0, 4, 'image/langhaobi.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (84, '2020-02-11 22:03:36', '景德镇陶瓷', 8, '2020,武汉加油', 522225.50, 92, 1, 4, 1, 0, 4, 'image/jingdezheng.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (87, '2020-02-11 22:03:36', '华为P10', 8, '2020,武汉加油', 525.50, 1, 1, 4, 1, 0, 4, 'image/huawei.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (88, '2020-02-11 22:03:36', '苹果6SPLUS', 8, '2020,武汉加油', 525.50, 1, 1, 4, 1, 0, 4, 'image/apple6s.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (89, '2020-02-11 22:03:36', '小米5', 8, '2020,武汉加油', 525.50, 1, 1, 4, 1, 0, 4, 'image/xiaomi5.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (90, '2020-02-11 22:03:36', '苹果6S', 8, '2020,武汉加油', 5525.50, 1, 1, 4, 1, 0, 4, 'image/apple6s.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (91, '2020-02-11 22:03:36', '月球下的人', 7, '2020,武汉加油', 34.00, 73, 1, 1, 1, 0, 7, 'image/yourname.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (92, '2020-02-11 22:03:36', '傲慢与偏见', 9, '2020,武汉加油', 24.00, 73, 1, 1, 1, 0, 7, 'image/PorRmD0JDZ1495278394532.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (100, '2020-02-11 22:03:36', '百年孤独', 6, '看上的请联系我，QQ：test，微信：test', 364.47, 6, 1, 7, 1, 0, 44, '/image/QyBHYiMfYQ4XZFCqxEv0.jpg', '/images/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES (101, '2020-02-21 14:40:49', 'hh', 10, '我的qq:2222', 1.00, 94, 1, 1, 1, 0, 1604412308, 'image\\ur2S3StMIQ1582267248579.jpg', '');
INSERT INTO `shopinformation` VALUES (102, '2020-02-21 14:49:34', '肖战', 10, '联系我啦啦啦，qq：2333', 2333.00, 94, 1, 1, 1, 0, 1604412308, 'image\\5mhN7UalX61582267773729.jpg', '');

-- ----------------------------
-- Table structure for shoppicture
-- ----------------------------
DROP TABLE IF EXISTS `shoppicture`;
CREATE TABLE `shoppicture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppicture
-- ----------------------------
INSERT INTO `shoppicture` VALUES (1, NULL, 1, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (2, NULL, 2, '/image/01.jpg', 1);
INSERT INTO `shoppicture` VALUES (3, NULL, 3, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (4, NULL, 4, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (5, NULL, 5, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (6, NULL, 6, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (7, NULL, 7, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (8, NULL, 8, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (9, NULL, 9, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (10, NULL, 10, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (11, NULL, 11, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (12, NULL, 12, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (13, NULL, 13, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (14, NULL, 14, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (15, NULL, 15, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (16, NULL, 16, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (17, NULL, 17, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (18, NULL, 18, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (19, NULL, 19, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (20, NULL, 20, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (21, NULL, 21, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (22, NULL, 22, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (23, NULL, 23, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (24, NULL, 24, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (25, NULL, 25, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (26, NULL, 26, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (27, NULL, 27, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (28, NULL, 28, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (29, NULL, 29, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (30, NULL, 30, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (31, NULL, 31, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (32, NULL, 32, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (33, NULL, 33, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (34, NULL, 34, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (35, NULL, 35, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (36, NULL, 36, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (37, NULL, 37, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (38, NULL, 38, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (39, NULL, 39, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (40, NULL, 40, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (41, NULL, 41, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (42, NULL, 42, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (43, NULL, 43, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (44, NULL, 44, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (45, NULL, 45, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (46, NULL, 46, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (47, NULL, 47, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (48, NULL, 48, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (49, NULL, 49, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (50, NULL, 50, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (51, NULL, 51, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (52, NULL, 52, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (53, NULL, 53, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (54, NULL, 54, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (55, NULL, 55, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (56, NULL, 56, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (57, NULL, 57, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (58, NULL, 58, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (59, NULL, 59, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (60, NULL, 60, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (61, NULL, 61, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (62, NULL, 62, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (63, NULL, 63, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (64, NULL, 64, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (65, NULL, 65, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (66, NULL, 66, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (67, NULL, 67, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (68, NULL, 68, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (69, NULL, 69, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (70, NULL, 70, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (71, NULL, 71, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (72, NULL, 72, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (73, NULL, 73, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (74, NULL, 74, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (75, NULL, 75, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (76, NULL, 76, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (77, NULL, 77, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (78, NULL, 78, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (79, NULL, 79, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (80, NULL, 80, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (81, NULL, 81, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (82, NULL, 82, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (83, NULL, 83, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (84, NULL, 84, '/image/1.jpg', 1);
INSERT INTO `shoppicture` VALUES (85, '2017-05-14 20:04:48', 87, 'image/eW5NE6CM121494763475193.jpg', 1);
INSERT INTO `shoppicture` VALUES (86, '2017-05-14 20:07:50', 88, 'image/02.jpg', 1);
INSERT INTO `shoppicture` VALUES (87, '2017-05-14 20:14:14', 89, 'imagehtEZLneu1d1494764039225.jpg', 1);
INSERT INTO `shoppicture` VALUES (88, '2017-05-14 20:15:30', 90, 'imageOAkysrUmZs1494764129394.jpg', 1);

-- ----------------------------
-- Table structure for specifickinds
-- ----------------------------
DROP TABLE IF EXISTS `specifickinds`;
CREATE TABLE `specifickinds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specifickinds
-- ----------------------------
INSERT INTO `specifickinds` VALUES (1, '苹果', NULL, 1);
INSERT INTO `specifickinds` VALUES (2, '三星', NULL, 1);
INSERT INTO `specifickinds` VALUES (3, '小米', NULL, 1);
INSERT INTO `specifickinds` VALUES (4, '华为', NULL, 1);
INSERT INTO `specifickinds` VALUES (5, '中兴', NULL, 1);
INSERT INTO `specifickinds` VALUES (6, '联想', NULL, 1);
INSERT INTO `specifickinds` VALUES (7, '魅族', NULL, 1);
INSERT INTO `specifickinds` VALUES (8, '其他', NULL, 1);
INSERT INTO `specifickinds` VALUES (9, '耳机', NULL, 1);
INSERT INTO `specifickinds` VALUES (10, '普通相机', NULL, 2);
INSERT INTO `specifickinds` VALUES (11, '单反', NULL, 2);
INSERT INTO `specifickinds` VALUES (12, '其他', NULL, 2);
INSERT INTO `specifickinds` VALUES (13, '笔记本', NULL, 3);
INSERT INTO `specifickinds` VALUES (14, '平板电脑', NULL, 3);
INSERT INTO `specifickinds` VALUES (15, '台式机', NULL, 3);
INSERT INTO `specifickinds` VALUES (16, '显示器', NULL, 3);
INSERT INTO `specifickinds` VALUES (17, '鼠标', NULL, 3);
INSERT INTO `specifickinds` VALUES (18, '硬盘', NULL, 3);
INSERT INTO `specifickinds` VALUES (19, 'U盘', NULL, 3);
INSERT INTO `specifickinds` VALUES (20, '移动硬盘', NULL, 3);
INSERT INTO `specifickinds` VALUES (21, '其他', NULL, 3);
INSERT INTO `specifickinds` VALUES (22, '洗衣机', NULL, 4);
INSERT INTO `specifickinds` VALUES (23, '饮水机', NULL, 4);
INSERT INTO `specifickinds` VALUES (24, '吹风机', NULL, 4);
INSERT INTO `specifickinds` VALUES (25, '剃须刀', NULL, 4);
INSERT INTO `specifickinds` VALUES (26, '风扇', NULL, 4);
INSERT INTO `specifickinds` VALUES (27, '煮蛋器', NULL, 4);
INSERT INTO `specifickinds` VALUES (28, '电磁炉', NULL, 4);
INSERT INTO `specifickinds` VALUES (29, '电饭煲', NULL, 4);
INSERT INTO `specifickinds` VALUES (30, '其他', NULL, 4);
INSERT INTO `specifickinds` VALUES (31, '耳机', NULL, 5);
INSERT INTO `specifickinds` VALUES (32, '音响', NULL, 5);
INSERT INTO `specifickinds` VALUES (33, '功放', NULL, 5);
INSERT INTO `specifickinds` VALUES (34, '低音炮', NULL, 5);
INSERT INTO `specifickinds` VALUES (35, '麦克风', NULL, 5);
INSERT INTO `specifickinds` VALUES (36, '上衣', NULL, 6);
INSERT INTO `specifickinds` VALUES (37, '裤子', NULL, 6);
INSERT INTO `specifickinds` VALUES (38, '裙子', NULL, 6);
INSERT INTO `specifickinds` VALUES (39, '其他', NULL, 6);
INSERT INTO `specifickinds` VALUES (40, '上衣', NULL, 7);
INSERT INTO `specifickinds` VALUES (41, '裤子', NULL, 7);
INSERT INTO `specifickinds` VALUES (42, '其他', NULL, 7);
INSERT INTO `specifickinds` VALUES (43, '运动鞋', NULL, 8);
INSERT INTO `specifickinds` VALUES (44, '皮鞋', NULL, 8);
INSERT INTO `specifickinds` VALUES (45, '帆布鞋', NULL, 8);
INSERT INTO `specifickinds` VALUES (46, '球鞋', NULL, 8);
INSERT INTO `specifickinds` VALUES (47, '板鞋', NULL, 8);
INSERT INTO `specifickinds` VALUES (48, '其他', NULL, 8);
INSERT INTO `specifickinds` VALUES (49, '运动鞋', NULL, 9);
INSERT INTO `specifickinds` VALUES (50, '皮鞋', '2017-05-10 21:53:20', 9);
INSERT INTO `specifickinds` VALUES (51, '帆布鞋', '2017-05-10 21:53:23', 9);
INSERT INTO `specifickinds` VALUES (52, '球鞋', '2017-05-10 21:53:26', 9);
INSERT INTO `specifickinds` VALUES (53, '板鞋', '2017-05-10 21:53:28', 9);
INSERT INTO `specifickinds` VALUES (54, '其他', '2017-05-10 21:53:30', 9);
INSERT INTO `specifickinds` VALUES (55, '背包', NULL, 10);
INSERT INTO `specifickinds` VALUES (56, '旅行箱', NULL, 10);
INSERT INTO `specifickinds` VALUES (57, '其他', NULL, 10);
INSERT INTO `specifickinds` VALUES (58, '机械表', NULL, 11);
INSERT INTO `specifickinds` VALUES (59, '石英表', NULL, 11);
INSERT INTO `specifickinds` VALUES (60, '电子表', NULL, 11);
INSERT INTO `specifickinds` VALUES (61, '其他', NULL, 11);
INSERT INTO `specifickinds` VALUES (62, '足球', NULL, 12);
INSERT INTO `specifickinds` VALUES (63, '羽毛球拍', NULL, 12);
INSERT INTO `specifickinds` VALUES (64, '网球拍', NULL, 12);
INSERT INTO `specifickinds` VALUES (65, '篮球', NULL, 12);
INSERT INTO `specifickinds` VALUES (66, '滑轮', NULL, 12);
INSERT INTO `specifickinds` VALUES (67, '乒乓球拍', NULL, 12);
INSERT INTO `specifickinds` VALUES (68, '滑板', NULL, 12);
INSERT INTO `specifickinds` VALUES (69, '其他', NULL, 12);
INSERT INTO `specifickinds` VALUES (70, '自行车', NULL, 13);
INSERT INTO `specifickinds` VALUES (71, '电动车', NULL, 13);
INSERT INTO `specifickinds` VALUES (72, '其他', NULL, 13);
INSERT INTO `specifickinds` VALUES (73, '文学', NULL, 14);
INSERT INTO `specifickinds` VALUES (74, '漫画', NULL, 14);
INSERT INTO `specifickinds` VALUES (75, '小说', NULL, 14);
INSERT INTO `specifickinds` VALUES (76, '其他', NULL, 14);
INSERT INTO `specifickinds` VALUES (77, '生物', NULL, 15);
INSERT INTO `specifickinds` VALUES (78, '化学', NULL, 15);
INSERT INTO `specifickinds` VALUES (79, '物理', NULL, 15);
INSERT INTO `specifickinds` VALUES (80, '语文', NULL, 15);
INSERT INTO `specifickinds` VALUES (81, '外语', NULL, 15);
INSERT INTO `specifickinds` VALUES (82, '数学', NULL, 15);
INSERT INTO `specifickinds` VALUES (83, '政治', NULL, 15);
INSERT INTO `specifickinds` VALUES (84, '历史', NULL, 15);
INSERT INTO `specifickinds` VALUES (85, '地理', NULL, 15);
INSERT INTO `specifickinds` VALUES (86, '计算机', NULL, 15);
INSERT INTO `specifickinds` VALUES (87, '机械', NULL, 15);
INSERT INTO `specifickinds` VALUES (88, '土木', NULL, 15);
INSERT INTO `specifickinds` VALUES (89, '艺术', NULL, 15);
INSERT INTO `specifickinds` VALUES (90, '其他', NULL, 15);
INSERT INTO `specifickinds` VALUES (91, '笔', NULL, 16);
INSERT INTO `specifickinds` VALUES (92, '其他', NULL, 16);
INSERT INTO `specifickinds` VALUES (93, '其他', NULL, 5);
INSERT INTO `specifickinds` VALUES (94, '其他', NULL, 17);

-- ----------------------------
-- Table structure for usercollection
-- ----------------------------
DROP TABLE IF EXISTS `usercollection`;
CREATE TABLE `usercollection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userrelease
-- ----------------------------
DROP TABLE IF EXISTS `userrelease`;
CREATE TABLE `userrelease`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(0) NULL DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1008 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrelease
-- ----------------------------
INSERT INTO `userrelease` VALUES (1, '2020-02-11 15:42:55', 1, 7, 91);
INSERT INTO `userrelease` VALUES (2, '2020-02-11 15:42:55', 1, 7, 92);
INSERT INTO `userrelease` VALUES (3, '2020-02-11 15:42:55', 1, 61, 95);
INSERT INTO `userrelease` VALUES (4, '2020-02-11 15:42:55', 1, 50, 96);
INSERT INTO `userrelease` VALUES (5, '2020-02-11 15:42:55', 1, 18, 97);
INSERT INTO `userrelease` VALUES (6, '2020-02-11 15:42:55', 1, 29, 98);
INSERT INTO `userrelease` VALUES (7, '2020-02-11 15:42:55', 1, 38, 99);
INSERT INTO `userrelease` VALUES (8, '2020-02-11 15:42:55', 1, 44, 100);
INSERT INTO `userrelease` VALUES (9, '2020-02-11 15:42:55', 1, 14, 101);
INSERT INTO `userrelease` VALUES (10, '2020-02-11 15:42:55', 1, 52, 102);
INSERT INTO `userrelease` VALUES (11, '2020-02-11 15:42:55', 1, 37, 103);
INSERT INTO `userrelease` VALUES (12, '2020-02-11 15:42:55', 1, 43, 104);
INSERT INTO `userrelease` VALUES (13, '2020-02-11 15:42:55', 1, 52, 105);
INSERT INTO `userrelease` VALUES (14, '2020-02-11 15:42:55', 1, 61, 106);
INSERT INTO `userrelease` VALUES (15, '2020-02-11 15:42:55', 1, 31, 107);
INSERT INTO `userrelease` VALUES (16, '2020-02-11 15:42:55', 1, 51, 108);
INSERT INTO `userrelease` VALUES (17, '2020-02-11 15:42:55', 1, 63, 109);
INSERT INTO `userrelease` VALUES (18, '2020-02-11 15:42:55', 1, 29, 110);
INSERT INTO `userrelease` VALUES (19, '2020-02-11 15:42:55', 1, 37, 111);
INSERT INTO `userrelease` VALUES (20, '2020-02-11 15:42:55', 1, 16, 112);
INSERT INTO `userrelease` VALUES (21, '2020-02-11 15:42:55', 1, 38, 113);
INSERT INTO `userrelease` VALUES (22, '2020-02-11 15:42:55', 1, 65, 114);
INSERT INTO `userrelease` VALUES (23, '2020-02-11 15:42:55', 1, 15, 115);
INSERT INTO `userrelease` VALUES (24, '2020-02-11 15:42:55', 1, 61, 116);
INSERT INTO `userrelease` VALUES (25, '2020-02-11 15:42:55', 1, 54, 117);
INSERT INTO `userrelease` VALUES (26, '2020-02-11 15:42:55', 1, 73, 118);
INSERT INTO `userrelease` VALUES (27, '2020-02-11 15:42:55', 1, 74, 119);
INSERT INTO `userrelease` VALUES (28, '2020-02-11 15:42:55', 1, 46, 120);
INSERT INTO `userrelease` VALUES (29, '2020-02-11 15:42:55', 1, 98, 121);
INSERT INTO `userrelease` VALUES (30, '2020-02-11 15:42:55', 1, 50, 122);
INSERT INTO `userrelease` VALUES (31, '2020-02-11 15:42:55', 1, 92, 123);
INSERT INTO `userrelease` VALUES (32, '2020-02-11 15:42:55', 1, 60, 124);
INSERT INTO `userrelease` VALUES (33, '2020-02-11 15:42:55', 1, 21, 125);
INSERT INTO `userrelease` VALUES (34, '2020-02-11 15:42:55', 1, 79, 126);
INSERT INTO `userrelease` VALUES (35, '2020-02-11 15:42:55', 1, 71, 127);
INSERT INTO `userrelease` VALUES (36, '2020-02-11 15:42:55', 1, 90, 128);
INSERT INTO `userrelease` VALUES (37, '2020-02-11 15:42:55', 1, 64, 129);
INSERT INTO `userrelease` VALUES (38, '2020-02-11 15:42:55', 1, 89, 130);
INSERT INTO `userrelease` VALUES (39, '2020-02-11 15:42:55', 1, 55, 131);
INSERT INTO `userrelease` VALUES (40, '2020-02-11 15:42:55', 1, 29, 132);
INSERT INTO `userrelease` VALUES (41, '2020-02-11 15:42:55', 1, 34, 133);
INSERT INTO `userrelease` VALUES (42, '2020-02-11 15:42:55', 1, 92, 134);
INSERT INTO `userrelease` VALUES (43, '2020-02-11 15:42:55', 1, 32, 135);
INSERT INTO `userrelease` VALUES (44, '2020-02-11 15:42:55', 1, 89, 136);
INSERT INTO `userrelease` VALUES (45, '2020-02-11 15:42:55', 1, 65, 137);
INSERT INTO `userrelease` VALUES (46, '2020-02-11 15:42:55', 1, 91, 138);
INSERT INTO `userrelease` VALUES (47, '2020-02-11 15:42:55', 1, 40, 139);
INSERT INTO `userrelease` VALUES (48, '2020-02-11 15:42:55', 1, 55, 140);
INSERT INTO `userrelease` VALUES (49, '2020-02-11 15:42:55', 1, 6, 141);
INSERT INTO `userrelease` VALUES (50, '2020-02-11 15:42:55', 1, 88, 142);
INSERT INTO `userrelease` VALUES (51, '2020-02-11 15:42:55', 1, 45, 143);
INSERT INTO `userrelease` VALUES (52, '2020-02-11 15:42:55', 1, 11, 144);
INSERT INTO `userrelease` VALUES (53, '2020-02-11 15:42:55', 1, 32, 145);
INSERT INTO `userrelease` VALUES (54, '2020-02-11 15:42:55', 1, 61, 146);
INSERT INTO `userrelease` VALUES (55, '2020-02-11 15:42:55', 1, 44, 147);
INSERT INTO `userrelease` VALUES (56, '2020-02-11 15:42:55', 1, 86, 148);
INSERT INTO `userrelease` VALUES (57, '2020-02-11 15:42:55', 1, 30, 149);
INSERT INTO `userrelease` VALUES (58, '2020-02-11 15:42:55', 1, 84, 150);
INSERT INTO `userrelease` VALUES (59, '2020-02-11 15:42:55', 1, 90, 151);
INSERT INTO `userrelease` VALUES (60, '2020-02-11 15:42:55', 1, 73, 152);
INSERT INTO `userrelease` VALUES (61, '2020-02-11 15:42:55', 1, 16, 153);
INSERT INTO `userrelease` VALUES (62, '2020-02-11 15:42:55', 1, 61, 154);
INSERT INTO `userrelease` VALUES (63, '2020-02-11 15:42:55', 1, 21, 155);
INSERT INTO `userrelease` VALUES (64, '2020-02-11 15:42:55', 1, 92, 156);
INSERT INTO `userrelease` VALUES (65, '2020-02-11 15:42:55', 1, 44, 157);
INSERT INTO `userrelease` VALUES (66, '2020-02-11 15:42:55', 1, 11, 158);
INSERT INTO `userrelease` VALUES (67, '2020-02-11 15:42:55', 1, 76, 159);
INSERT INTO `userrelease` VALUES (68, '2020-02-11 15:42:55', 1, 31, 160);
INSERT INTO `userrelease` VALUES (69, '2020-02-11 15:42:55', 1, 18, 161);
INSERT INTO `userrelease` VALUES (70, '2020-02-11 15:42:55', 1, 9, 162);
INSERT INTO `userrelease` VALUES (71, '2020-02-11 15:42:55', 1, 42, 163);
INSERT INTO `userrelease` VALUES (72, '2020-02-11 15:42:55', 1, 92, 164);
INSERT INTO `userrelease` VALUES (73, '2020-02-11 15:42:55', 1, 5, 165);
INSERT INTO `userrelease` VALUES (74, '2020-02-11 15:42:55', 1, 57, 166);
INSERT INTO `userrelease` VALUES (75, '2020-02-11 15:42:55', 1, 81, 167);
INSERT INTO `userrelease` VALUES (76, '2020-02-11 15:42:55', 1, 39, 168);
INSERT INTO `userrelease` VALUES (77, '2020-02-11 15:42:55', 1, 57, 169);
INSERT INTO `userrelease` VALUES (78, '2020-02-11 15:42:55', 1, 16, 170);
INSERT INTO `userrelease` VALUES (79, '2020-02-11 15:42:55', 1, 95, 171);
INSERT INTO `userrelease` VALUES (80, '2020-02-11 15:42:55', 1, 95, 172);
INSERT INTO `userrelease` VALUES (81, '2020-02-11 15:42:55', 1, 68, 173);
INSERT INTO `userrelease` VALUES (82, '2020-02-11 15:42:55', 1, 56, 174);
INSERT INTO `userrelease` VALUES (83, '2020-02-11 15:42:55', 1, 82, 175);
INSERT INTO `userrelease` VALUES (84, '2020-02-11 15:42:55', 1, 44, 176);
INSERT INTO `userrelease` VALUES (85, '2020-02-11 15:42:55', 1, 81, 177);
INSERT INTO `userrelease` VALUES (86, '2020-02-11 15:42:55', 1, 32, 178);
INSERT INTO `userrelease` VALUES (87, '2020-02-11 15:42:55', 1, 90, 179);
INSERT INTO `userrelease` VALUES (88, '2020-02-11 15:42:55', 1, 22, 180);
INSERT INTO `userrelease` VALUES (89, '2020-02-11 15:42:55', 1, 84, 181);
INSERT INTO `userrelease` VALUES (90, '2020-02-11 15:42:55', 1, 71, 182);
INSERT INTO `userrelease` VALUES (91, '2020-02-11 15:42:55', 1, 36, 183);
INSERT INTO `userrelease` VALUES (92, '2020-02-11 15:42:55', 1, 80, 184);
INSERT INTO `userrelease` VALUES (93, '2020-02-11 15:42:55', 1, 86, 185);
INSERT INTO `userrelease` VALUES (94, '2020-02-11 15:42:55', 1, 35, 186);
INSERT INTO `userrelease` VALUES (95, '2020-02-11 15:42:55', 1, 13, 187);
INSERT INTO `userrelease` VALUES (96, '2020-02-11 15:42:55', 1, 4, 188);
INSERT INTO `userrelease` VALUES (97, '2020-02-11 15:42:55', 1, 68, 189);
INSERT INTO `userrelease` VALUES (98, '2020-02-11 15:42:55', 1, 30, 190);
INSERT INTO `userrelease` VALUES (99, '2020-02-11 15:42:55', 1, 80, 191);
INSERT INTO `userrelease` VALUES (100, '2020-02-11 15:42:55', 1, 16, 192);
INSERT INTO `userrelease` VALUES (101, '2020-02-11 15:42:55', 1, 52, 193);
INSERT INTO `userrelease` VALUES (102, '2020-02-11 15:42:55', 1, 53, 194);
INSERT INTO `userrelease` VALUES (103, '2020-02-11 15:42:55', 1, 61, 195);
INSERT INTO `userrelease` VALUES (104, '2020-02-11 15:42:55', 1, 85, 196);
INSERT INTO `userrelease` VALUES (105, '2020-02-11 15:42:55', 1, 89, 197);
INSERT INTO `userrelease` VALUES (106, '2020-02-11 15:42:55', 1, 21, 198);
INSERT INTO `userrelease` VALUES (107, '2020-02-11 15:42:55', 1, 57, 199);
INSERT INTO `userrelease` VALUES (108, '2020-02-11 15:42:55', 1, 4, 200);
INSERT INTO `userrelease` VALUES (109, '2020-02-11 15:42:55', 1, 37, 201);
INSERT INTO `userrelease` VALUES (110, '2020-02-11 15:42:55', 1, 36, 202);
INSERT INTO `userrelease` VALUES (111, '2020-02-11 15:42:55', 1, 47, 203);
INSERT INTO `userrelease` VALUES (112, '2020-02-11 15:42:55', 1, 89, 204);
INSERT INTO `userrelease` VALUES (113, '2020-02-11 15:42:55', 1, 96, 205);
INSERT INTO `userrelease` VALUES (114, '2020-02-11 15:42:55', 1, 17, 206);
INSERT INTO `userrelease` VALUES (115, '2020-02-11 15:42:55', 1, 57, 207);
INSERT INTO `userrelease` VALUES (116, '2020-02-11 15:42:55', 1, 4, 208);
INSERT INTO `userrelease` VALUES (117, '2020-02-11 15:42:55', 1, 100, 209);
INSERT INTO `userrelease` VALUES (118, '2020-02-11 15:42:55', 1, 97, 210);
INSERT INTO `userrelease` VALUES (119, '2020-02-11 15:42:55', 1, 56, 211);
INSERT INTO `userrelease` VALUES (120, '2020-02-11 15:42:55', 1, 55, 212);
INSERT INTO `userrelease` VALUES (121, '2020-02-11 15:42:55', 1, 51, 213);
INSERT INTO `userrelease` VALUES (122, '2020-02-11 15:42:55', 1, 29, 214);
INSERT INTO `userrelease` VALUES (123, '2020-02-11 15:42:55', 1, 61, 215);
INSERT INTO `userrelease` VALUES (124, '2020-02-11 15:42:55', 1, 78, 216);
INSERT INTO `userrelease` VALUES (125, '2020-02-11 15:42:55', 1, 26, 217);
INSERT INTO `userrelease` VALUES (126, '2020-02-11 15:42:55', 1, 77, 218);
INSERT INTO `userrelease` VALUES (127, '2020-02-11 15:42:55', 1, 89, 219);
INSERT INTO `userrelease` VALUES (128, '2020-02-11 15:42:55', 1, 91, 220);
INSERT INTO `userrelease` VALUES (129, '2020-02-11 15:42:55', 1, 80, 221);
INSERT INTO `userrelease` VALUES (130, '2020-02-11 15:42:55', 1, 31, 222);
INSERT INTO `userrelease` VALUES (131, '2020-02-11 15:42:55', 1, 8, 223);
INSERT INTO `userrelease` VALUES (132, '2020-02-11 15:42:55', 1, 41, 224);
INSERT INTO `userrelease` VALUES (133, '2020-02-11 15:42:55', 1, 51, 225);
INSERT INTO `userrelease` VALUES (134, '2020-02-11 15:42:55', 1, 74, 226);
INSERT INTO `userrelease` VALUES (135, '2020-02-11 15:42:55', 1, 39, 227);
INSERT INTO `userrelease` VALUES (136, '2020-02-11 15:42:55', 1, 80, 228);
INSERT INTO `userrelease` VALUES (137, '2020-02-11 15:42:55', 1, 59, 229);
INSERT INTO `userrelease` VALUES (138, '2020-02-11 15:42:55', 1, 90, 230);
INSERT INTO `userrelease` VALUES (139, '2020-02-11 15:42:55', 1, 47, 231);
INSERT INTO `userrelease` VALUES (140, '2020-02-11 15:42:55', 1, 64, 232);
INSERT INTO `userrelease` VALUES (141, '2020-02-11 15:42:55', 1, 24, 233);
INSERT INTO `userrelease` VALUES (142, '2020-02-11 15:42:55', 1, 19, 234);
INSERT INTO `userrelease` VALUES (143, '2020-02-11 15:42:55', 1, 42, 235);
INSERT INTO `userrelease` VALUES (144, '2020-02-11 15:42:55', 1, 87, 236);
INSERT INTO `userrelease` VALUES (145, '2020-02-11 15:42:55', 1, 51, 237);
INSERT INTO `userrelease` VALUES (146, '2020-02-11 15:42:55', 1, 74, 238);
INSERT INTO `userrelease` VALUES (147, '2020-02-11 15:42:55', 1, 53, 239);
INSERT INTO `userrelease` VALUES (148, '2020-02-11 15:42:55', 1, 90, 240);
INSERT INTO `userrelease` VALUES (149, '2020-02-11 15:42:55', 1, 93, 241);
INSERT INTO `userrelease` VALUES (150, '2020-02-11 15:42:55', 1, 68, 242);
INSERT INTO `userrelease` VALUES (151, '2020-02-11 15:42:55', 1, 68, 243);
INSERT INTO `userrelease` VALUES (152, '2020-02-11 15:42:55', 1, 32, 244);
INSERT INTO `userrelease` VALUES (153, '2020-02-11 15:42:55', 1, 60, 245);
INSERT INTO `userrelease` VALUES (154, '2020-02-11 15:42:55', 1, 91, 246);
INSERT INTO `userrelease` VALUES (155, '2020-02-11 15:42:55', 1, 11, 247);
INSERT INTO `userrelease` VALUES (156, '2020-02-11 15:42:55', 1, 61, 248);
INSERT INTO `userrelease` VALUES (157, '2020-02-11 15:42:55', 1, 35, 249);
INSERT INTO `userrelease` VALUES (158, '2020-02-11 15:42:55', 1, 41, 250);
INSERT INTO `userrelease` VALUES (159, '2020-02-11 15:42:55', 1, 17, 251);
INSERT INTO `userrelease` VALUES (160, '2020-02-11 15:42:55', 1, 8, 252);
INSERT INTO `userrelease` VALUES (161, '2020-02-11 15:42:55', 1, 97, 253);
INSERT INTO `userrelease` VALUES (162, '2020-02-11 15:42:55', 1, 39, 254);
INSERT INTO `userrelease` VALUES (163, '2020-02-11 15:42:55', 1, 47, 255);
INSERT INTO `userrelease` VALUES (164, '2020-02-11 15:42:55', 1, 79, 256);
INSERT INTO `userrelease` VALUES (165, '2020-02-11 15:42:55', 1, 93, 257);
INSERT INTO `userrelease` VALUES (166, '2020-02-11 15:42:55', 1, 15, 258);
INSERT INTO `userrelease` VALUES (167, '2020-02-11 15:42:55', 1, 3, 259);
INSERT INTO `userrelease` VALUES (168, '2020-02-11 15:42:55', 1, 94, 260);
INSERT INTO `userrelease` VALUES (169, '2020-02-11 15:42:55', 1, 62, 261);
INSERT INTO `userrelease` VALUES (170, '2020-02-11 15:42:55', 1, 96, 262);
INSERT INTO `userrelease` VALUES (171, '2020-02-11 15:42:55', 1, 16, 263);
INSERT INTO `userrelease` VALUES (172, '2020-02-11 15:42:55', 1, 20, 264);
INSERT INTO `userrelease` VALUES (173, '2020-02-11 15:42:55', 1, 78, 265);
INSERT INTO `userrelease` VALUES (174, '2020-02-11 15:42:55', 1, 22, 266);
INSERT INTO `userrelease` VALUES (175, '2020-02-11 15:42:55', 1, 59, 267);
INSERT INTO `userrelease` VALUES (176, '2020-02-11 15:42:55', 1, 87, 268);
INSERT INTO `userrelease` VALUES (177, '2020-02-11 15:42:55', 1, 49, 269);
INSERT INTO `userrelease` VALUES (178, '2020-02-11 15:42:55', 1, 12, 270);
INSERT INTO `userrelease` VALUES (179, '2020-02-11 15:42:55', 1, 18, 271);
INSERT INTO `userrelease` VALUES (180, '2020-02-11 15:42:55', 1, 55, 272);
INSERT INTO `userrelease` VALUES (181, '2020-02-11 15:42:55', 1, 24, 273);
INSERT INTO `userrelease` VALUES (182, '2020-02-11 15:42:55', 1, 42, 274);
INSERT INTO `userrelease` VALUES (183, '2020-02-11 15:42:55', 1, 76, 275);
INSERT INTO `userrelease` VALUES (184, '2020-02-11 15:42:55', 1, 48, 276);
INSERT INTO `userrelease` VALUES (185, '2020-02-11 15:42:55', 1, 23, 277);
INSERT INTO `userrelease` VALUES (186, '2020-02-11 15:42:55', 1, 42, 278);
INSERT INTO `userrelease` VALUES (187, '2020-02-11 15:42:55', 1, 1, 279);
INSERT INTO `userrelease` VALUES (188, '2020-02-11 15:42:55', 1, 29, 280);
INSERT INTO `userrelease` VALUES (189, '2020-02-11 15:42:55', 1, 60, 281);
INSERT INTO `userrelease` VALUES (190, '2020-02-11 15:42:55', 1, 2, 282);
INSERT INTO `userrelease` VALUES (191, '2020-02-11 15:42:55', 1, 53, 283);
INSERT INTO `userrelease` VALUES (192, '2020-02-11 15:42:55', 1, 85, 284);
INSERT INTO `userrelease` VALUES (193, '2020-02-11 15:42:55', 1, 83, 285);
INSERT INTO `userrelease` VALUES (194, '2020-02-11 15:42:55', 1, 10, 286);
INSERT INTO `userrelease` VALUES (195, '2020-02-11 15:42:55', 1, 86, 287);
INSERT INTO `userrelease` VALUES (196, '2020-02-11 15:42:55', 1, 98, 288);
INSERT INTO `userrelease` VALUES (197, '2020-02-11 15:42:55', 1, 36, 289);
INSERT INTO `userrelease` VALUES (198, '2020-02-11 15:42:55', 1, 32, 290);
INSERT INTO `userrelease` VALUES (199, '2020-02-11 15:42:55', 1, 54, 291);
INSERT INTO `userrelease` VALUES (200, '2020-02-11 15:42:55', 1, 9, 292);
INSERT INTO `userrelease` VALUES (201, '2020-02-11 15:42:55', 1, 64, 293);
INSERT INTO `userrelease` VALUES (202, '2020-02-11 15:42:55', 1, 49, 294);
INSERT INTO `userrelease` VALUES (203, '2020-02-11 15:42:55', 1, 6, 295);
INSERT INTO `userrelease` VALUES (204, '2020-02-11 15:42:55', 1, 76, 296);
INSERT INTO `userrelease` VALUES (205, '2020-02-11 15:42:55', 1, 7, 297);
INSERT INTO `userrelease` VALUES (206, '2020-02-11 15:42:55', 1, 8, 298);
INSERT INTO `userrelease` VALUES (207, '2020-02-11 15:42:55', 1, 1, 299);
INSERT INTO `userrelease` VALUES (208, '2020-02-11 15:42:55', 1, 32, 300);
INSERT INTO `userrelease` VALUES (209, '2020-02-11 15:42:55', 1, 45, 301);
INSERT INTO `userrelease` VALUES (210, '2020-02-11 15:42:55', 1, 79, 302);
INSERT INTO `userrelease` VALUES (211, '2020-02-11 15:42:55', 1, 33, 303);
INSERT INTO `userrelease` VALUES (212, '2020-02-11 15:42:55', 1, 18, 304);
INSERT INTO `userrelease` VALUES (213, '2020-02-11 15:42:55', 1, 21, 305);
INSERT INTO `userrelease` VALUES (214, '2020-02-11 15:42:55', 1, 14, 306);
INSERT INTO `userrelease` VALUES (215, '2020-02-11 15:42:55', 1, 37, 307);
INSERT INTO `userrelease` VALUES (216, '2020-02-11 15:42:55', 1, 37, 308);
INSERT INTO `userrelease` VALUES (217, '2020-02-11 15:42:55', 1, 95, 309);
INSERT INTO `userrelease` VALUES (218, '2020-02-11 15:42:55', 1, 40, 310);
INSERT INTO `userrelease` VALUES (219, '2020-02-11 15:42:55', 1, 8, 311);
INSERT INTO `userrelease` VALUES (220, '2020-02-11 15:42:55', 1, 39, 312);
INSERT INTO `userrelease` VALUES (221, '2020-02-11 15:42:55', 1, 16, 313);
INSERT INTO `userrelease` VALUES (222, '2020-02-11 15:42:55', 1, 28, 314);
INSERT INTO `userrelease` VALUES (223, '2020-02-11 15:42:55', 1, 53, 315);
INSERT INTO `userrelease` VALUES (224, '2020-02-11 15:42:55', 1, 17, 316);
INSERT INTO `userrelease` VALUES (225, '2020-02-11 15:42:55', 1, 89, 317);
INSERT INTO `userrelease` VALUES (226, '2020-02-11 15:42:55', 1, 92, 318);
INSERT INTO `userrelease` VALUES (227, '2020-02-11 15:42:55', 1, 92, 319);
INSERT INTO `userrelease` VALUES (228, '2020-02-11 15:42:55', 1, 81, 320);
INSERT INTO `userrelease` VALUES (229, '2020-02-11 15:42:55', 1, 26, 321);
INSERT INTO `userrelease` VALUES (230, '2020-02-11 15:42:55', 1, 57, 322);
INSERT INTO `userrelease` VALUES (231, '2020-02-11 15:42:55', 1, 85, 323);
INSERT INTO `userrelease` VALUES (232, '2020-02-11 15:42:55', 1, 6, 324);
INSERT INTO `userrelease` VALUES (233, '2020-02-11 15:42:55', 1, 34, 325);
INSERT INTO `userrelease` VALUES (234, '2020-02-11 15:42:55', 1, 63, 326);
INSERT INTO `userrelease` VALUES (235, '2020-02-11 15:42:55', 1, 76, 327);
INSERT INTO `userrelease` VALUES (236, '2020-02-11 15:42:55', 1, 31, 328);
INSERT INTO `userrelease` VALUES (237, '2020-02-11 15:42:55', 1, 43, 329);
INSERT INTO `userrelease` VALUES (238, '2020-02-11 15:42:55', 1, 30, 330);
INSERT INTO `userrelease` VALUES (239, '2020-02-11 15:42:55', 1, 65, 331);
INSERT INTO `userrelease` VALUES (240, '2020-02-11 15:42:55', 1, 13, 332);
INSERT INTO `userrelease` VALUES (241, '2020-02-11 15:42:55', 1, 92, 333);
INSERT INTO `userrelease` VALUES (242, '2020-02-11 15:42:55', 1, 19, 334);
INSERT INTO `userrelease` VALUES (243, '2020-02-11 15:42:55', 1, 66, 335);
INSERT INTO `userrelease` VALUES (244, '2020-02-11 15:42:55', 1, 8, 336);
INSERT INTO `userrelease` VALUES (245, '2020-02-11 15:42:55', 1, 68, 337);
INSERT INTO `userrelease` VALUES (246, '2020-02-11 15:42:55', 1, 64, 338);
INSERT INTO `userrelease` VALUES (247, '2020-02-11 15:42:55', 1, 76, 339);
INSERT INTO `userrelease` VALUES (248, '2020-02-11 15:42:55', 1, 98, 340);
INSERT INTO `userrelease` VALUES (249, '2020-02-11 15:42:55', 1, 10, 341);
INSERT INTO `userrelease` VALUES (250, '2020-02-11 15:42:55', 1, 89, 342);
INSERT INTO `userrelease` VALUES (251, '2020-02-11 15:42:55', 1, 3, 343);
INSERT INTO `userrelease` VALUES (252, '2020-02-11 15:42:55', 1, 62, 344);
INSERT INTO `userrelease` VALUES (253, '2020-02-11 15:42:55', 1, 40, 345);
INSERT INTO `userrelease` VALUES (254, '2020-02-11 15:42:55', 1, 43, 346);
INSERT INTO `userrelease` VALUES (255, '2020-02-11 15:42:55', 1, 61, 347);
INSERT INTO `userrelease` VALUES (256, '2020-02-11 15:42:55', 1, 51, 348);
INSERT INTO `userrelease` VALUES (257, '2020-02-11 15:42:55', 1, 12, 349);
INSERT INTO `userrelease` VALUES (258, '2020-02-11 15:42:55', 1, 20, 350);
INSERT INTO `userrelease` VALUES (259, '2020-02-11 15:42:55', 1, 46, 351);
INSERT INTO `userrelease` VALUES (260, '2020-02-11 15:42:55', 1, 29, 352);
INSERT INTO `userrelease` VALUES (261, '2020-02-11 15:42:55', 1, 93, 353);
INSERT INTO `userrelease` VALUES (262, '2020-02-11 15:42:55', 1, 83, 354);
INSERT INTO `userrelease` VALUES (263, '2020-02-11 15:42:55', 1, 86, 355);
INSERT INTO `userrelease` VALUES (264, '2020-02-11 15:42:55', 1, 90, 356);
INSERT INTO `userrelease` VALUES (265, '2020-02-11 15:42:55', 1, 51, 357);
INSERT INTO `userrelease` VALUES (266, '2020-02-11 15:42:55', 1, 27, 358);
INSERT INTO `userrelease` VALUES (267, '2020-02-11 15:42:55', 1, 60, 359);
INSERT INTO `userrelease` VALUES (268, '2020-02-11 15:42:55', 1, 42, 360);
INSERT INTO `userrelease` VALUES (269, '2020-02-11 15:42:55', 1, 62, 361);
INSERT INTO `userrelease` VALUES (270, '2020-02-11 15:42:55', 1, 2, 362);
INSERT INTO `userrelease` VALUES (271, '2020-02-11 15:42:55', 1, 44, 363);
INSERT INTO `userrelease` VALUES (272, '2020-02-11 15:42:55', 1, 20, 364);
INSERT INTO `userrelease` VALUES (273, '2020-02-11 15:42:55', 1, 26, 365);
INSERT INTO `userrelease` VALUES (274, '2020-02-11 15:42:55', 1, 83, 366);
INSERT INTO `userrelease` VALUES (275, '2020-02-11 15:42:55', 1, 91, 367);
INSERT INTO `userrelease` VALUES (276, '2020-02-11 15:42:55', 1, 1, 368);
INSERT INTO `userrelease` VALUES (277, '2020-02-11 15:42:55', 1, 38, 369);
INSERT INTO `userrelease` VALUES (278, '2020-02-11 15:42:55', 1, 100, 370);
INSERT INTO `userrelease` VALUES (279, '2020-02-11 15:42:55', 1, 15, 371);
INSERT INTO `userrelease` VALUES (280, '2020-02-11 15:42:55', 1, 67, 372);
INSERT INTO `userrelease` VALUES (281, '2020-02-11 15:42:55', 1, 25, 373);
INSERT INTO `userrelease` VALUES (282, '2020-02-11 15:42:55', 1, 31, 374);
INSERT INTO `userrelease` VALUES (283, '2020-02-11 15:42:55', 1, 54, 375);
INSERT INTO `userrelease` VALUES (284, '2020-02-11 15:42:55', 1, 47, 376);
INSERT INTO `userrelease` VALUES (285, '2020-02-11 15:42:55', 1, 49, 377);
INSERT INTO `userrelease` VALUES (286, '2020-02-11 15:42:55', 1, 24, 378);
INSERT INTO `userrelease` VALUES (287, '2020-02-11 15:42:55', 1, 13, 379);
INSERT INTO `userrelease` VALUES (288, '2020-02-11 15:42:55', 1, 65, 380);
INSERT INTO `userrelease` VALUES (289, '2020-02-11 15:42:55', 1, 15, 381);
INSERT INTO `userrelease` VALUES (290, '2020-02-11 15:42:55', 1, 84, 382);
INSERT INTO `userrelease` VALUES (291, '2020-02-11 15:42:55', 1, 3, 383);
INSERT INTO `userrelease` VALUES (292, '2020-02-11 15:42:55', 1, 33, 384);
INSERT INTO `userrelease` VALUES (293, '2020-02-11 15:42:55', 1, 100, 385);
INSERT INTO `userrelease` VALUES (294, '2020-02-11 15:42:55', 1, 85, 386);
INSERT INTO `userrelease` VALUES (295, '2020-02-11 15:42:55', 1, 2, 387);
INSERT INTO `userrelease` VALUES (296, '2020-02-11 15:42:55', 1, 39, 388);
INSERT INTO `userrelease` VALUES (297, '2020-02-11 15:42:55', 1, 60, 389);
INSERT INTO `userrelease` VALUES (298, '2020-02-11 15:42:55', 1, 81, 390);
INSERT INTO `userrelease` VALUES (299, '2020-02-11 15:42:55', 1, 50, 391);
INSERT INTO `userrelease` VALUES (300, '2020-02-11 15:42:55', 1, 80, 392);
INSERT INTO `userrelease` VALUES (301, '2020-02-11 15:42:55', 1, 77, 393);
INSERT INTO `userrelease` VALUES (302, '2020-02-11 15:42:55', 1, 18, 394);
INSERT INTO `userrelease` VALUES (303, '2020-02-11 15:42:55', 1, 28, 395);
INSERT INTO `userrelease` VALUES (304, '2020-02-11 15:42:55', 1, 40, 396);
INSERT INTO `userrelease` VALUES (305, '2020-02-11 15:42:55', 1, 66, 397);
INSERT INTO `userrelease` VALUES (306, '2020-02-11 15:42:55', 1, 20, 398);
INSERT INTO `userrelease` VALUES (307, '2020-02-11 15:42:55', 1, 79, 399);
INSERT INTO `userrelease` VALUES (308, '2020-02-11 15:42:55', 1, 76, 400);
INSERT INTO `userrelease` VALUES (309, '2020-02-11 15:42:55', 1, 37, 401);
INSERT INTO `userrelease` VALUES (310, '2020-02-11 15:42:55', 1, 47, 402);
INSERT INTO `userrelease` VALUES (311, '2020-02-11 15:42:55', 1, 3, 403);
INSERT INTO `userrelease` VALUES (312, '2020-02-11 15:42:55', 1, 20, 404);
INSERT INTO `userrelease` VALUES (313, '2020-02-11 15:42:55', 1, 99, 405);
INSERT INTO `userrelease` VALUES (314, '2020-02-11 15:42:55', 1, 8, 406);
INSERT INTO `userrelease` VALUES (315, '2020-02-11 15:42:55', 1, 10, 407);
INSERT INTO `userrelease` VALUES (316, '2020-02-11 15:42:55', 1, 82, 408);
INSERT INTO `userrelease` VALUES (317, '2020-02-11 15:42:55', 1, 32, 409);
INSERT INTO `userrelease` VALUES (318, '2020-02-11 15:42:55', 1, 82, 410);
INSERT INTO `userrelease` VALUES (319, '2020-02-11 15:42:55', 1, 16, 411);
INSERT INTO `userrelease` VALUES (320, '2020-02-11 15:42:55', 1, 18, 412);
INSERT INTO `userrelease` VALUES (321, '2020-02-11 15:42:55', 1, 3, 413);
INSERT INTO `userrelease` VALUES (322, '2020-02-11 15:42:55', 1, 98, 414);
INSERT INTO `userrelease` VALUES (323, '2020-02-11 15:42:55', 1, 19, 415);
INSERT INTO `userrelease` VALUES (324, '2020-02-11 15:42:55', 1, 14, 416);
INSERT INTO `userrelease` VALUES (325, '2020-02-11 15:42:55', 1, 4, 417);
INSERT INTO `userrelease` VALUES (326, '2020-02-11 15:42:55', 1, 71, 418);
INSERT INTO `userrelease` VALUES (327, '2020-02-11 15:42:55', 1, 61, 419);
INSERT INTO `userrelease` VALUES (328, '2020-02-11 15:42:55', 1, 38, 420);
INSERT INTO `userrelease` VALUES (329, '2020-02-11 15:42:55', 1, 1, 421);
INSERT INTO `userrelease` VALUES (330, '2020-02-11 15:42:55', 1, 53, 422);
INSERT INTO `userrelease` VALUES (331, '2020-02-11 15:42:55', 1, 82, 423);
INSERT INTO `userrelease` VALUES (332, '2020-02-11 15:42:55', 1, 86, 424);
INSERT INTO `userrelease` VALUES (333, '2020-02-11 15:42:55', 1, 14, 425);
INSERT INTO `userrelease` VALUES (334, '2020-02-11 15:42:55', 1, 90, 426);
INSERT INTO `userrelease` VALUES (335, '2020-02-11 15:42:55', 1, 10, 427);
INSERT INTO `userrelease` VALUES (336, '2020-02-11 15:42:55', 1, 97, 428);
INSERT INTO `userrelease` VALUES (337, '2020-02-11 15:42:55', 1, 69, 429);
INSERT INTO `userrelease` VALUES (338, '2020-02-11 15:42:55', 1, 18, 430);
INSERT INTO `userrelease` VALUES (339, '2020-02-11 15:42:55', 1, 63, 431);
INSERT INTO `userrelease` VALUES (340, '2020-02-11 15:42:55', 1, 25, 432);
INSERT INTO `userrelease` VALUES (341, '2020-02-11 15:42:55', 1, 99, 433);
INSERT INTO `userrelease` VALUES (342, '2020-02-11 15:42:55', 1, 60, 434);
INSERT INTO `userrelease` VALUES (343, '2020-02-11 15:42:55', 1, 56, 435);
INSERT INTO `userrelease` VALUES (344, '2020-02-11 15:42:55', 1, 49, 436);
INSERT INTO `userrelease` VALUES (345, '2020-02-11 15:42:55', 1, 90, 437);
INSERT INTO `userrelease` VALUES (346, '2020-02-11 15:42:55', 1, 13, 438);
INSERT INTO `userrelease` VALUES (347, '2020-02-11 15:42:55', 1, 42, 439);
INSERT INTO `userrelease` VALUES (348, '2020-02-11 15:42:55', 1, 58, 440);
INSERT INTO `userrelease` VALUES (349, '2020-02-11 15:42:55', 1, 35, 441);
INSERT INTO `userrelease` VALUES (350, '2020-02-11 15:42:55', 1, 34, 442);
INSERT INTO `userrelease` VALUES (351, '2020-02-11 15:42:55', 1, 52, 443);
INSERT INTO `userrelease` VALUES (352, '2020-02-11 15:42:55', 1, 90, 444);
INSERT INTO `userrelease` VALUES (353, '2020-02-11 15:42:55', 1, 84, 445);
INSERT INTO `userrelease` VALUES (354, '2020-02-11 15:42:55', 1, 27, 446);
INSERT INTO `userrelease` VALUES (355, '2020-02-11 15:42:55', 1, 3, 447);
INSERT INTO `userrelease` VALUES (356, '2020-02-11 15:42:55', 1, 79, 448);
INSERT INTO `userrelease` VALUES (357, '2020-02-11 15:42:55', 1, 71, 449);
INSERT INTO `userrelease` VALUES (358, '2020-02-11 15:42:55', 1, 26, 450);
INSERT INTO `userrelease` VALUES (359, '2020-02-11 15:42:55', 1, 71, 451);
INSERT INTO `userrelease` VALUES (360, '2020-02-11 15:42:55', 1, 88, 452);
INSERT INTO `userrelease` VALUES (361, '2020-02-11 15:42:55', 1, 13, 453);
INSERT INTO `userrelease` VALUES (362, '2020-02-11 15:42:55', 1, 26, 454);
INSERT INTO `userrelease` VALUES (363, '2020-02-11 15:42:55', 1, 85, 455);
INSERT INTO `userrelease` VALUES (364, '2020-02-11 15:42:55', 1, 47, 456);
INSERT INTO `userrelease` VALUES (365, '2020-02-11 15:42:55', 1, 27, 457);
INSERT INTO `userrelease` VALUES (366, '2020-02-11 15:42:55', 1, 4, 458);
INSERT INTO `userrelease` VALUES (367, '2020-02-11 15:42:55', 1, 22, 459);
INSERT INTO `userrelease` VALUES (368, '2020-02-11 15:42:55', 1, 62, 460);
INSERT INTO `userrelease` VALUES (369, '2020-02-11 15:42:55', 1, 87, 461);
INSERT INTO `userrelease` VALUES (370, '2020-02-11 15:42:55', 1, 5, 462);
INSERT INTO `userrelease` VALUES (371, '2020-02-11 15:42:55', 1, 1, 463);
INSERT INTO `userrelease` VALUES (372, '2020-02-11 15:42:55', 1, 73, 464);
INSERT INTO `userrelease` VALUES (373, '2020-02-11 15:42:55', 1, 11, 465);
INSERT INTO `userrelease` VALUES (374, '2020-02-11 15:42:55', 1, 63, 466);
INSERT INTO `userrelease` VALUES (375, '2020-02-11 15:42:55', 1, 81, 467);
INSERT INTO `userrelease` VALUES (376, '2020-02-11 15:42:55', 1, 38, 468);
INSERT INTO `userrelease` VALUES (377, '2020-02-11 15:42:55', 1, 18, 469);
INSERT INTO `userrelease` VALUES (378, '2020-02-11 15:42:55', 1, 66, 470);
INSERT INTO `userrelease` VALUES (379, '2020-02-11 15:42:55', 1, 39, 471);
INSERT INTO `userrelease` VALUES (380, '2020-02-11 15:42:55', 1, 87, 472);
INSERT INTO `userrelease` VALUES (381, '2020-02-11 15:42:55', 1, 4, 473);
INSERT INTO `userrelease` VALUES (382, '2020-02-11 15:42:55', 1, 62, 474);
INSERT INTO `userrelease` VALUES (383, '2020-02-11 15:42:55', 1, 11, 475);
INSERT INTO `userrelease` VALUES (384, '2020-02-11 15:42:55', 1, 20, 476);
INSERT INTO `userrelease` VALUES (385, '2020-02-11 15:42:55', 1, 30, 477);
INSERT INTO `userrelease` VALUES (386, '2020-02-11 15:42:55', 1, 98, 478);
INSERT INTO `userrelease` VALUES (387, '2020-02-11 15:42:55', 1, 70, 479);
INSERT INTO `userrelease` VALUES (388, '2020-02-11 15:42:55', 1, 9, 480);
INSERT INTO `userrelease` VALUES (389, '2020-02-11 15:42:55', 1, 82, 481);
INSERT INTO `userrelease` VALUES (390, '2020-02-11 15:42:55', 1, 61, 482);
INSERT INTO `userrelease` VALUES (391, '2020-02-11 15:42:55', 1, 87, 483);
INSERT INTO `userrelease` VALUES (392, '2020-02-11 15:42:55', 1, 43, 484);
INSERT INTO `userrelease` VALUES (393, '2020-02-11 15:42:55', 1, 57, 485);
INSERT INTO `userrelease` VALUES (394, '2020-02-11 15:42:55', 1, 58, 486);
INSERT INTO `userrelease` VALUES (395, '2020-02-11 15:42:55', 1, 55, 487);
INSERT INTO `userrelease` VALUES (396, '2020-02-11 15:42:55', 1, 84, 488);
INSERT INTO `userrelease` VALUES (397, '2020-02-11 15:42:55', 1, 67, 489);
INSERT INTO `userrelease` VALUES (398, '2020-02-11 15:42:55', 1, 22, 490);
INSERT INTO `userrelease` VALUES (399, '2020-02-11 15:42:55', 1, 64, 491);
INSERT INTO `userrelease` VALUES (400, '2020-02-11 15:42:55', 1, 85, 492);
INSERT INTO `userrelease` VALUES (401, '2020-02-11 15:42:55', 1, 11, 493);
INSERT INTO `userrelease` VALUES (402, '2020-02-11 15:42:55', 1, 57, 494);
INSERT INTO `userrelease` VALUES (403, '2020-02-11 15:42:55', 1, 60, 495);
INSERT INTO `userrelease` VALUES (404, '2020-02-11 15:42:55', 1, 100, 496);
INSERT INTO `userrelease` VALUES (405, '2020-02-11 15:42:55', 1, 65, 497);
INSERT INTO `userrelease` VALUES (406, '2020-02-11 15:42:55', 1, 48, 498);
INSERT INTO `userrelease` VALUES (407, '2020-02-11 15:42:55', 1, 88, 499);
INSERT INTO `userrelease` VALUES (408, '2020-02-11 15:42:55', 1, 67, 500);
INSERT INTO `userrelease` VALUES (409, '2020-02-11 15:42:55', 1, 57, 501);
INSERT INTO `userrelease` VALUES (410, '2020-02-11 15:42:55', 1, 67, 502);
INSERT INTO `userrelease` VALUES (411, '2020-02-11 15:42:55', 1, 100, 503);
INSERT INTO `userrelease` VALUES (412, '2020-02-11 15:42:55', 1, 18, 504);
INSERT INTO `userrelease` VALUES (413, '2020-02-11 15:42:55', 1, 94, 505);
INSERT INTO `userrelease` VALUES (414, '2020-02-11 15:42:55', 1, 16, 506);
INSERT INTO `userrelease` VALUES (415, '2020-02-11 15:42:55', 1, 79, 507);
INSERT INTO `userrelease` VALUES (416, '2020-02-11 15:42:55', 1, 18, 508);
INSERT INTO `userrelease` VALUES (417, '2020-02-11 15:42:55', 1, 52, 509);
INSERT INTO `userrelease` VALUES (418, '2020-02-11 15:42:55', 1, 69, 510);
INSERT INTO `userrelease` VALUES (419, '2020-02-11 15:42:55', 1, 56, 511);
INSERT INTO `userrelease` VALUES (420, '2020-02-11 15:42:55', 1, 51, 512);
INSERT INTO `userrelease` VALUES (421, '2020-02-11 15:42:55', 1, 54, 513);
INSERT INTO `userrelease` VALUES (422, '2020-02-11 15:42:55', 1, 20, 514);
INSERT INTO `userrelease` VALUES (423, '2020-02-11 15:42:55', 1, 79, 515);
INSERT INTO `userrelease` VALUES (424, '2020-02-11 15:42:55', 1, 89, 516);
INSERT INTO `userrelease` VALUES (425, '2020-02-11 15:42:55', 1, 25, 517);
INSERT INTO `userrelease` VALUES (426, '2020-02-11 15:42:55', 1, 67, 518);
INSERT INTO `userrelease` VALUES (427, '2020-02-11 15:42:55', 1, 70, 519);
INSERT INTO `userrelease` VALUES (428, '2020-02-11 15:42:55', 1, 56, 520);
INSERT INTO `userrelease` VALUES (429, '2020-02-11 15:42:55', 1, 22, 521);
INSERT INTO `userrelease` VALUES (430, '2020-02-11 15:42:55', 1, 75, 522);
INSERT INTO `userrelease` VALUES (431, '2020-02-11 15:42:55', 1, 88, 523);
INSERT INTO `userrelease` VALUES (432, '2020-02-11 15:42:55', 1, 93, 524);
INSERT INTO `userrelease` VALUES (433, '2020-02-11 15:42:55', 1, 54, 525);
INSERT INTO `userrelease` VALUES (434, '2020-02-11 15:42:55', 1, 29, 526);
INSERT INTO `userrelease` VALUES (435, '2020-02-11 15:42:55', 1, 81, 527);
INSERT INTO `userrelease` VALUES (436, '2020-02-11 15:42:55', 1, 25, 528);
INSERT INTO `userrelease` VALUES (437, '2020-02-11 15:42:55', 1, 85, 529);
INSERT INTO `userrelease` VALUES (438, '2020-02-11 15:42:55', 1, 48, 530);
INSERT INTO `userrelease` VALUES (439, '2020-02-11 15:42:55', 1, 64, 531);
INSERT INTO `userrelease` VALUES (440, '2020-02-11 15:42:55', 1, 36, 532);
INSERT INTO `userrelease` VALUES (441, '2020-02-11 15:42:55', 1, 89, 533);
INSERT INTO `userrelease` VALUES (442, '2020-02-11 15:42:55', 1, 83, 534);
INSERT INTO `userrelease` VALUES (443, '2020-02-11 15:42:55', 1, 85, 535);
INSERT INTO `userrelease` VALUES (444, '2020-02-11 15:42:55', 1, 7, 536);
INSERT INTO `userrelease` VALUES (445, '2020-02-11 15:42:55', 1, 49, 537);
INSERT INTO `userrelease` VALUES (446, '2020-02-11 15:42:55', 1, 44, 538);
INSERT INTO `userrelease` VALUES (447, '2020-02-11 15:42:55', 1, 62, 539);
INSERT INTO `userrelease` VALUES (448, '2020-02-11 15:42:55', 1, 11, 540);
INSERT INTO `userrelease` VALUES (449, '2020-02-11 15:42:55', 1, 98, 541);
INSERT INTO `userrelease` VALUES (450, '2020-02-11 15:42:55', 1, 82, 542);
INSERT INTO `userrelease` VALUES (451, '2020-02-11 15:42:55', 1, 46, 543);
INSERT INTO `userrelease` VALUES (452, '2020-02-11 15:42:55', 1, 6, 544);
INSERT INTO `userrelease` VALUES (453, '2020-02-11 15:42:55', 1, 74, 545);
INSERT INTO `userrelease` VALUES (454, '2020-02-11 15:42:55', 1, 59, 546);
INSERT INTO `userrelease` VALUES (455, '2020-02-11 15:42:55', 1, 90, 547);
INSERT INTO `userrelease` VALUES (456, '2020-02-11 15:42:55', 1, 36, 548);
INSERT INTO `userrelease` VALUES (457, '2020-02-11 15:42:55', 1, 68, 549);
INSERT INTO `userrelease` VALUES (458, '2020-02-11 15:42:55', 1, 53, 550);
INSERT INTO `userrelease` VALUES (459, '2020-02-11 15:42:55', 1, 49, 551);
INSERT INTO `userrelease` VALUES (460, '2020-02-11 15:42:55', 1, 76, 552);
INSERT INTO `userrelease` VALUES (461, '2020-02-11 15:42:55', 1, 100, 553);
INSERT INTO `userrelease` VALUES (462, '2020-02-11 15:42:55', 1, 71, 554);
INSERT INTO `userrelease` VALUES (463, '2020-02-11 15:42:55', 1, 77, 555);
INSERT INTO `userrelease` VALUES (464, '2020-02-11 15:42:55', 1, 26, 556);
INSERT INTO `userrelease` VALUES (465, '2020-02-11 15:42:55', 1, 32, 557);
INSERT INTO `userrelease` VALUES (466, '2020-02-11 15:42:55', 1, 30, 558);
INSERT INTO `userrelease` VALUES (467, '2020-02-11 15:42:55', 1, 39, 559);
INSERT INTO `userrelease` VALUES (468, '2020-02-11 15:42:55', 1, 48, 560);
INSERT INTO `userrelease` VALUES (469, '2020-02-11 15:42:55', 1, 72, 561);
INSERT INTO `userrelease` VALUES (470, '2020-02-11 15:42:55', 1, 78, 562);
INSERT INTO `userrelease` VALUES (471, '2020-02-11 15:42:55', 1, 92, 563);
INSERT INTO `userrelease` VALUES (472, '2020-02-11 15:42:55', 1, 49, 564);
INSERT INTO `userrelease` VALUES (473, '2020-02-11 15:42:55', 1, 38, 565);
INSERT INTO `userrelease` VALUES (474, '2020-02-11 15:42:55', 1, 99, 566);
INSERT INTO `userrelease` VALUES (475, '2020-02-11 15:42:55', 1, 55, 567);
INSERT INTO `userrelease` VALUES (476, '2020-02-11 15:42:55', 1, 33, 568);
INSERT INTO `userrelease` VALUES (477, '2020-02-11 15:42:55', 1, 58, 569);
INSERT INTO `userrelease` VALUES (478, '2020-02-11 15:42:55', 1, 12, 570);
INSERT INTO `userrelease` VALUES (479, '2020-02-11 15:42:55', 1, 41, 571);
INSERT INTO `userrelease` VALUES (480, '2020-02-11 15:42:55', 1, 39, 572);
INSERT INTO `userrelease` VALUES (481, '2020-02-11 15:42:55', 1, 22, 573);
INSERT INTO `userrelease` VALUES (482, '2020-02-11 15:42:55', 1, 26, 574);
INSERT INTO `userrelease` VALUES (483, '2020-02-11 15:42:55', 1, 20, 575);
INSERT INTO `userrelease` VALUES (484, '2020-02-11 15:42:55', 1, 5, 576);
INSERT INTO `userrelease` VALUES (485, '2020-02-11 15:42:55', 1, 50, 577);
INSERT INTO `userrelease` VALUES (486, '2020-02-11 15:42:55', 1, 51, 578);
INSERT INTO `userrelease` VALUES (487, '2020-02-11 15:42:55', 1, 83, 579);
INSERT INTO `userrelease` VALUES (488, '2020-02-11 15:42:55', 1, 58, 580);
INSERT INTO `userrelease` VALUES (489, '2020-02-11 15:42:55', 1, 47, 581);
INSERT INTO `userrelease` VALUES (490, '2020-02-11 15:42:55', 1, 98, 582);
INSERT INTO `userrelease` VALUES (491, '2020-02-11 15:42:55', 1, 41, 583);
INSERT INTO `userrelease` VALUES (492, '2020-02-11 15:42:55', 1, 99, 584);
INSERT INTO `userrelease` VALUES (493, '2020-02-11 15:42:55', 1, 70, 585);
INSERT INTO `userrelease` VALUES (494, '2020-02-11 15:42:55', 1, 47, 586);
INSERT INTO `userrelease` VALUES (495, '2020-02-11 15:42:55', 1, 85, 587);
INSERT INTO `userrelease` VALUES (496, '2020-02-11 15:42:55', 1, 88, 588);
INSERT INTO `userrelease` VALUES (497, '2020-02-11 15:42:55', 1, 4, 589);
INSERT INTO `userrelease` VALUES (498, '2020-02-11 15:42:55', 1, 64, 590);
INSERT INTO `userrelease` VALUES (499, '2020-02-11 15:42:55', 1, 15, 591);
INSERT INTO `userrelease` VALUES (500, '2020-02-11 15:42:55', 1, 59, 592);
INSERT INTO `userrelease` VALUES (501, '2020-02-11 15:42:55', 1, 88, 593);
INSERT INTO `userrelease` VALUES (502, '2020-02-11 15:42:55', 1, 43, 594);
INSERT INTO `userrelease` VALUES (503, '2020-02-11 15:42:55', 1, 50, 595);
INSERT INTO `userrelease` VALUES (504, '2020-02-11 15:42:55', 1, 70, 596);
INSERT INTO `userrelease` VALUES (505, '2020-02-11 15:42:55', 1, 70, 597);
INSERT INTO `userrelease` VALUES (506, '2020-02-11 15:42:55', 1, 19, 598);
INSERT INTO `userrelease` VALUES (507, '2020-02-11 15:42:55', 1, 70, 599);
INSERT INTO `userrelease` VALUES (508, '2020-02-11 15:42:55', 1, 89, 600);
INSERT INTO `userrelease` VALUES (509, '2020-02-11 15:42:55', 1, 59, 601);
INSERT INTO `userrelease` VALUES (510, '2020-02-11 15:42:55', 1, 26, 602);
INSERT INTO `userrelease` VALUES (511, '2020-02-11 15:42:55', 1, 76, 603);
INSERT INTO `userrelease` VALUES (512, '2020-02-11 15:42:55', 1, 26, 604);
INSERT INTO `userrelease` VALUES (513, '2020-02-11 15:42:55', 1, 90, 605);
INSERT INTO `userrelease` VALUES (514, '2020-02-11 15:42:55', 1, 93, 606);
INSERT INTO `userrelease` VALUES (515, '2020-02-11 15:42:55', 1, 36, 607);
INSERT INTO `userrelease` VALUES (516, '2020-02-11 15:42:55', 1, 33, 608);
INSERT INTO `userrelease` VALUES (517, '2020-02-11 15:42:55', 1, 6, 609);
INSERT INTO `userrelease` VALUES (518, '2020-02-11 15:42:55', 1, 75, 610);
INSERT INTO `userrelease` VALUES (519, '2020-02-11 15:42:55', 1, 88, 611);
INSERT INTO `userrelease` VALUES (520, '2020-02-11 15:42:55', 1, 86, 612);
INSERT INTO `userrelease` VALUES (521, '2020-02-11 15:42:55', 1, 66, 613);
INSERT INTO `userrelease` VALUES (522, '2020-02-11 15:42:55', 1, 72, 614);
INSERT INTO `userrelease` VALUES (523, '2020-02-11 15:42:55', 1, 64, 615);
INSERT INTO `userrelease` VALUES (524, '2020-02-11 15:42:55', 1, 2, 616);
INSERT INTO `userrelease` VALUES (525, '2020-02-11 15:42:55', 1, 6, 617);
INSERT INTO `userrelease` VALUES (526, '2020-02-11 15:42:55', 1, 58, 618);
INSERT INTO `userrelease` VALUES (527, '2020-02-11 15:42:55', 1, 82, 619);
INSERT INTO `userrelease` VALUES (528, '2020-02-11 15:42:55', 1, 75, 620);
INSERT INTO `userrelease` VALUES (529, '2020-02-11 15:42:55', 1, 79, 621);
INSERT INTO `userrelease` VALUES (530, '2020-02-11 15:42:55', 1, 31, 622);
INSERT INTO `userrelease` VALUES (531, '2020-02-11 15:42:55', 1, 76, 623);
INSERT INTO `userrelease` VALUES (532, '2020-02-11 15:42:55', 1, 75, 624);
INSERT INTO `userrelease` VALUES (533, '2020-02-11 15:42:55', 1, 87, 625);
INSERT INTO `userrelease` VALUES (534, '2020-02-11 15:42:55', 1, 21, 626);
INSERT INTO `userrelease` VALUES (535, '2020-02-11 15:42:55', 1, 64, 627);
INSERT INTO `userrelease` VALUES (536, '2020-02-11 15:42:55', 1, 91, 628);
INSERT INTO `userrelease` VALUES (537, '2020-02-11 15:42:55', 1, 71, 629);
INSERT INTO `userrelease` VALUES (538, '2020-02-11 15:42:55', 1, 75, 630);
INSERT INTO `userrelease` VALUES (539, '2020-02-11 15:42:55', 1, 88, 631);
INSERT INTO `userrelease` VALUES (540, '2020-02-11 15:42:55', 1, 30, 632);
INSERT INTO `userrelease` VALUES (541, '2020-02-11 15:42:55', 1, 90, 633);
INSERT INTO `userrelease` VALUES (542, '2020-02-11 15:42:55', 1, 65, 634);
INSERT INTO `userrelease` VALUES (543, '2020-02-11 15:42:55', 1, 51, 635);
INSERT INTO `userrelease` VALUES (544, '2020-02-11 15:42:55', 1, 88, 636);
INSERT INTO `userrelease` VALUES (545, '2020-02-11 15:42:55', 1, 91, 637);
INSERT INTO `userrelease` VALUES (546, '2020-02-11 15:42:55', 1, 75, 638);
INSERT INTO `userrelease` VALUES (547, '2020-02-11 15:42:55', 1, 17, 639);
INSERT INTO `userrelease` VALUES (548, '2020-02-11 15:42:55', 1, 62, 640);
INSERT INTO `userrelease` VALUES (549, '2020-02-11 15:42:55', 1, 22, 641);
INSERT INTO `userrelease` VALUES (550, '2020-02-11 15:42:55', 1, 95, 642);
INSERT INTO `userrelease` VALUES (551, '2020-02-11 15:42:55', 1, 79, 643);
INSERT INTO `userrelease` VALUES (552, '2020-02-11 15:42:55', 1, 71, 644);
INSERT INTO `userrelease` VALUES (553, '2020-02-11 15:42:55', 1, 88, 645);
INSERT INTO `userrelease` VALUES (554, '2020-02-11 15:42:55', 1, 77, 646);
INSERT INTO `userrelease` VALUES (555, '2020-02-11 15:42:55', 1, 69, 647);
INSERT INTO `userrelease` VALUES (556, '2020-02-11 15:42:55', 1, 65, 648);
INSERT INTO `userrelease` VALUES (557, '2020-02-11 15:42:55', 1, 50, 649);
INSERT INTO `userrelease` VALUES (558, '2020-02-11 15:42:55', 1, 96, 650);
INSERT INTO `userrelease` VALUES (559, '2020-02-11 15:42:55', 1, 78, 651);
INSERT INTO `userrelease` VALUES (560, '2020-02-11 15:42:55', 1, 19, 652);
INSERT INTO `userrelease` VALUES (561, '2020-02-11 15:42:55', 1, 33, 653);
INSERT INTO `userrelease` VALUES (562, '2020-02-11 15:42:55', 1, 34, 654);
INSERT INTO `userrelease` VALUES (563, '2020-02-11 15:42:55', 1, 10, 655);
INSERT INTO `userrelease` VALUES (564, '2020-02-11 15:42:55', 1, 87, 656);
INSERT INTO `userrelease` VALUES (565, '2020-02-11 15:42:55', 1, 8, 657);
INSERT INTO `userrelease` VALUES (566, '2020-02-11 15:42:55', 1, 50, 658);
INSERT INTO `userrelease` VALUES (567, '2020-02-11 15:42:55', 1, 27, 659);
INSERT INTO `userrelease` VALUES (568, '2020-02-11 15:42:55', 1, 32, 660);
INSERT INTO `userrelease` VALUES (569, '2020-02-11 15:42:55', 1, 77, 661);
INSERT INTO `userrelease` VALUES (570, '2020-02-11 15:42:55', 1, 27, 662);
INSERT INTO `userrelease` VALUES (571, '2020-02-11 15:42:55', 1, 15, 663);
INSERT INTO `userrelease` VALUES (572, '2020-02-11 15:42:55', 1, 25, 664);
INSERT INTO `userrelease` VALUES (573, '2020-02-11 15:42:55', 1, 74, 665);
INSERT INTO `userrelease` VALUES (574, '2020-02-11 15:42:55', 1, 29, 666);
INSERT INTO `userrelease` VALUES (575, '2020-02-11 15:42:55', 1, 94, 667);
INSERT INTO `userrelease` VALUES (576, '2020-02-11 15:42:55', 1, 81, 668);
INSERT INTO `userrelease` VALUES (577, '2020-02-11 15:42:55', 1, 24, 669);
INSERT INTO `userrelease` VALUES (578, '2020-02-11 15:42:55', 1, 67, 670);
INSERT INTO `userrelease` VALUES (579, '2020-02-11 15:42:55', 1, 8, 671);
INSERT INTO `userrelease` VALUES (580, '2020-02-11 15:42:55', 1, 47, 672);
INSERT INTO `userrelease` VALUES (581, '2020-02-11 15:42:55', 1, 95, 673);
INSERT INTO `userrelease` VALUES (582, '2020-02-11 15:42:55', 1, 60, 674);
INSERT INTO `userrelease` VALUES (583, '2020-02-11 15:42:55', 1, 49, 675);
INSERT INTO `userrelease` VALUES (584, '2020-02-11 15:42:55', 1, 87, 676);
INSERT INTO `userrelease` VALUES (585, '2020-02-11 15:42:55', 1, 86, 677);
INSERT INTO `userrelease` VALUES (586, '2020-02-11 15:42:55', 1, 70, 678);
INSERT INTO `userrelease` VALUES (587, '2020-02-11 15:42:55', 1, 97, 679);
INSERT INTO `userrelease` VALUES (588, '2020-02-11 15:42:55', 1, 27, 680);
INSERT INTO `userrelease` VALUES (589, '2020-02-11 15:42:55', 1, 61, 681);
INSERT INTO `userrelease` VALUES (590, '2020-02-11 15:42:55', 1, 26, 682);
INSERT INTO `userrelease` VALUES (591, '2020-02-11 15:42:55', 1, 71, 683);
INSERT INTO `userrelease` VALUES (592, '2020-02-11 15:42:55', 1, 72, 684);
INSERT INTO `userrelease` VALUES (593, '2020-02-11 15:42:55', 1, 85, 685);
INSERT INTO `userrelease` VALUES (594, '2020-02-11 15:42:55', 1, 2, 686);
INSERT INTO `userrelease` VALUES (595, '2020-02-11 15:42:55', 1, 14, 687);
INSERT INTO `userrelease` VALUES (596, '2020-02-11 15:42:55', 1, 96, 688);
INSERT INTO `userrelease` VALUES (597, '2020-02-11 15:42:55', 1, 3, 689);
INSERT INTO `userrelease` VALUES (598, '2020-02-11 15:42:55', 1, 13, 690);
INSERT INTO `userrelease` VALUES (599, '2020-02-11 15:42:55', 1, 20, 691);
INSERT INTO `userrelease` VALUES (600, '2020-02-11 15:42:55', 1, 33, 692);
INSERT INTO `userrelease` VALUES (601, '2020-02-11 15:42:55', 1, 14, 693);
INSERT INTO `userrelease` VALUES (602, '2020-02-11 15:42:55', 1, 30, 694);
INSERT INTO `userrelease` VALUES (603, '2020-02-11 15:42:55', 1, 7, 695);
INSERT INTO `userrelease` VALUES (604, '2020-02-11 15:42:55', 1, 13, 696);
INSERT INTO `userrelease` VALUES (605, '2020-02-11 15:42:55', 1, 11, 697);
INSERT INTO `userrelease` VALUES (606, '2020-02-11 15:42:55', 1, 3, 698);
INSERT INTO `userrelease` VALUES (607, '2020-02-11 15:42:55', 1, 49, 699);
INSERT INTO `userrelease` VALUES (608, '2020-02-11 15:42:55', 1, 33, 700);
INSERT INTO `userrelease` VALUES (609, '2020-02-11 15:42:55', 1, 82, 701);
INSERT INTO `userrelease` VALUES (610, '2020-02-11 15:42:55', 1, 58, 702);
INSERT INTO `userrelease` VALUES (611, '2020-02-11 15:42:55', 1, 63, 703);
INSERT INTO `userrelease` VALUES (612, '2020-02-11 15:42:55', 1, 60, 704);
INSERT INTO `userrelease` VALUES (613, '2020-02-11 15:42:55', 1, 52, 705);
INSERT INTO `userrelease` VALUES (614, '2020-02-11 15:42:55', 1, 89, 706);
INSERT INTO `userrelease` VALUES (615, '2020-02-11 15:42:55', 1, 82, 707);
INSERT INTO `userrelease` VALUES (616, '2020-02-11 15:42:55', 1, 36, 708);
INSERT INTO `userrelease` VALUES (617, '2020-02-11 15:42:55', 1, 36, 709);
INSERT INTO `userrelease` VALUES (618, '2020-02-11 15:42:55', 1, 94, 710);
INSERT INTO `userrelease` VALUES (619, '2020-02-11 15:42:55', 1, 92, 711);
INSERT INTO `userrelease` VALUES (620, '2020-02-11 15:42:55', 1, 84, 712);
INSERT INTO `userrelease` VALUES (621, '2020-02-11 15:42:55', 1, 87, 713);
INSERT INTO `userrelease` VALUES (622, '2020-02-11 15:42:55', 1, 99, 714);
INSERT INTO `userrelease` VALUES (623, '2020-02-11 15:42:55', 1, 14, 715);
INSERT INTO `userrelease` VALUES (624, '2020-02-11 15:42:55', 1, 38, 716);
INSERT INTO `userrelease` VALUES (625, '2020-02-11 15:42:55', 1, 72, 717);
INSERT INTO `userrelease` VALUES (626, '2020-02-11 15:42:55', 1, 23, 718);
INSERT INTO `userrelease` VALUES (627, '2020-02-11 15:42:55', 1, 55, 719);
INSERT INTO `userrelease` VALUES (628, '2020-02-11 15:42:55', 1, 85, 720);
INSERT INTO `userrelease` VALUES (629, '2020-02-11 15:42:55', 1, 72, 721);
INSERT INTO `userrelease` VALUES (630, '2020-02-11 15:42:55', 1, 51, 722);
INSERT INTO `userrelease` VALUES (631, '2020-02-11 15:42:55', 1, 69, 723);
INSERT INTO `userrelease` VALUES (632, '2020-02-11 15:42:55', 1, 90, 724);
INSERT INTO `userrelease` VALUES (633, '2020-02-11 15:42:55', 1, 55, 725);
INSERT INTO `userrelease` VALUES (634, '2020-02-11 15:42:55', 1, 1, 726);
INSERT INTO `userrelease` VALUES (635, '2020-02-11 15:42:55', 1, 15, 727);
INSERT INTO `userrelease` VALUES (636, '2020-02-11 15:42:55', 1, 7, 728);
INSERT INTO `userrelease` VALUES (637, '2020-02-11 15:42:55', 1, 41, 729);
INSERT INTO `userrelease` VALUES (638, '2020-02-11 15:42:55', 1, 78, 730);
INSERT INTO `userrelease` VALUES (639, '2020-02-11 15:42:55', 1, 51, 731);
INSERT INTO `userrelease` VALUES (640, '2020-02-11 15:42:55', 1, 12, 732);
INSERT INTO `userrelease` VALUES (641, '2020-02-11 15:42:55', 1, 29, 733);
INSERT INTO `userrelease` VALUES (642, '2020-02-11 15:42:55', 1, 84, 734);
INSERT INTO `userrelease` VALUES (643, '2020-02-11 15:42:55', 1, 41, 735);
INSERT INTO `userrelease` VALUES (644, '2020-02-11 15:42:55', 1, 86, 736);
INSERT INTO `userrelease` VALUES (645, '2020-02-11 15:42:55', 1, 80, 737);
INSERT INTO `userrelease` VALUES (646, '2020-02-11 15:42:55', 1, 90, 738);
INSERT INTO `userrelease` VALUES (647, '2020-02-11 15:42:55', 1, 50, 739);
INSERT INTO `userrelease` VALUES (648, '2020-02-11 15:42:55', 1, 80, 740);
INSERT INTO `userrelease` VALUES (649, '2020-02-11 15:42:55', 1, 25, 741);
INSERT INTO `userrelease` VALUES (650, '2020-02-11 15:42:55', 1, 36, 742);
INSERT INTO `userrelease` VALUES (651, '2020-02-11 15:42:55', 1, 12, 743);
INSERT INTO `userrelease` VALUES (652, '2020-02-11 15:42:55', 1, 45, 744);
INSERT INTO `userrelease` VALUES (653, '2020-02-11 15:42:55', 1, 80, 745);
INSERT INTO `userrelease` VALUES (654, '2020-02-11 15:42:55', 1, 43, 746);
INSERT INTO `userrelease` VALUES (655, '2020-02-11 15:42:55', 1, 19, 747);
INSERT INTO `userrelease` VALUES (656, '2020-02-11 15:42:55', 1, 65, 748);
INSERT INTO `userrelease` VALUES (657, '2020-02-11 15:42:55', 1, 21, 749);
INSERT INTO `userrelease` VALUES (658, '2020-02-11 15:42:55', 1, 69, 750);
INSERT INTO `userrelease` VALUES (659, '2020-02-11 15:42:55', 1, 66, 751);
INSERT INTO `userrelease` VALUES (660, '2020-02-11 15:42:55', 1, 71, 752);
INSERT INTO `userrelease` VALUES (661, '2020-02-11 15:42:55', 1, 56, 753);
INSERT INTO `userrelease` VALUES (662, '2020-02-11 15:42:55', 1, 35, 754);
INSERT INTO `userrelease` VALUES (663, '2020-02-11 15:42:55', 1, 35, 755);
INSERT INTO `userrelease` VALUES (664, '2020-02-11 15:42:55', 1, 44, 756);
INSERT INTO `userrelease` VALUES (665, '2020-02-11 15:42:55', 1, 11, 757);
INSERT INTO `userrelease` VALUES (666, '2020-02-11 15:42:55', 1, 84, 758);
INSERT INTO `userrelease` VALUES (667, '2020-02-11 15:42:55', 1, 43, 759);
INSERT INTO `userrelease` VALUES (668, '2020-02-11 15:42:55', 1, 2, 760);
INSERT INTO `userrelease` VALUES (669, '2020-02-11 15:42:55', 1, 80, 761);
INSERT INTO `userrelease` VALUES (670, '2020-02-11 15:42:55', 1, 42, 762);
INSERT INTO `userrelease` VALUES (671, '2020-02-11 15:42:55', 1, 90, 763);
INSERT INTO `userrelease` VALUES (672, '2020-02-11 15:42:55', 1, 30, 764);
INSERT INTO `userrelease` VALUES (673, '2020-02-11 15:42:55', 1, 4, 765);
INSERT INTO `userrelease` VALUES (674, '2020-02-11 15:42:55', 1, 57, 766);
INSERT INTO `userrelease` VALUES (675, '2020-02-11 15:42:55', 1, 27, 767);
INSERT INTO `userrelease` VALUES (676, '2020-02-11 15:42:55', 1, 81, 768);
INSERT INTO `userrelease` VALUES (677, '2020-02-11 15:42:55', 1, 81, 769);
INSERT INTO `userrelease` VALUES (678, '2020-02-11 15:42:55', 1, 7, 770);
INSERT INTO `userrelease` VALUES (679, '2020-02-11 15:42:55', 1, 73, 771);
INSERT INTO `userrelease` VALUES (680, '2020-02-11 15:42:55', 1, 50, 772);
INSERT INTO `userrelease` VALUES (681, '2020-02-11 15:42:55', 1, 66, 773);
INSERT INTO `userrelease` VALUES (682, '2020-02-11 15:42:55', 1, 35, 774);
INSERT INTO `userrelease` VALUES (683, '2020-02-11 15:42:55', 1, 27, 775);
INSERT INTO `userrelease` VALUES (684, '2020-02-11 15:42:55', 1, 86, 776);
INSERT INTO `userrelease` VALUES (685, '2020-02-11 15:42:55', 1, 28, 777);
INSERT INTO `userrelease` VALUES (686, '2020-02-11 15:42:55', 1, 30, 778);
INSERT INTO `userrelease` VALUES (687, '2020-02-11 15:42:55', 1, 90, 779);
INSERT INTO `userrelease` VALUES (688, '2020-02-11 15:42:55', 1, 65, 780);
INSERT INTO `userrelease` VALUES (689, '2020-02-11 15:42:55', 1, 38, 781);
INSERT INTO `userrelease` VALUES (690, '2020-02-11 15:42:55', 1, 60, 782);
INSERT INTO `userrelease` VALUES (691, '2020-02-11 15:42:55', 1, 66, 783);
INSERT INTO `userrelease` VALUES (692, '2020-02-11 15:42:55', 1, 89, 784);
INSERT INTO `userrelease` VALUES (693, '2020-02-11 15:42:55', 1, 53, 785);
INSERT INTO `userrelease` VALUES (694, '2020-02-11 15:42:55', 1, 25, 786);
INSERT INTO `userrelease` VALUES (695, '2020-02-11 15:42:55', 1, 82, 787);
INSERT INTO `userrelease` VALUES (696, '2020-02-11 15:42:55', 1, 37, 788);
INSERT INTO `userrelease` VALUES (697, '2020-02-11 15:42:55', 1, 28, 789);
INSERT INTO `userrelease` VALUES (698, '2020-02-11 15:42:55', 1, 67, 790);
INSERT INTO `userrelease` VALUES (699, '2020-02-11 15:42:55', 1, 48, 791);
INSERT INTO `userrelease` VALUES (700, '2020-02-11 15:42:55', 1, 75, 792);
INSERT INTO `userrelease` VALUES (701, '2020-02-11 15:42:55', 1, 25, 793);
INSERT INTO `userrelease` VALUES (702, '2020-02-11 15:42:55', 1, 20, 794);
INSERT INTO `userrelease` VALUES (703, '2020-02-11 15:42:55', 1, 84, 795);
INSERT INTO `userrelease` VALUES (704, '2020-02-11 15:42:55', 1, 87, 796);
INSERT INTO `userrelease` VALUES (705, '2020-02-11 15:42:55', 1, 32, 797);
INSERT INTO `userrelease` VALUES (706, '2020-02-11 15:42:55', 1, 8, 798);
INSERT INTO `userrelease` VALUES (707, '2020-02-11 15:42:55', 1, 24, 799);
INSERT INTO `userrelease` VALUES (708, '2020-02-11 15:42:55', 1, 64, 800);
INSERT INTO `userrelease` VALUES (709, '2020-02-11 15:42:55', 1, 62, 801);
INSERT INTO `userrelease` VALUES (710, '2020-02-11 15:42:55', 1, 45, 802);
INSERT INTO `userrelease` VALUES (711, '2020-02-11 15:42:55', 1, 99, 803);
INSERT INTO `userrelease` VALUES (712, '2020-02-11 15:42:55', 1, 30, 804);
INSERT INTO `userrelease` VALUES (713, '2020-02-11 15:42:55', 1, 78, 805);
INSERT INTO `userrelease` VALUES (714, '2020-02-11 15:42:55', 1, 72, 806);
INSERT INTO `userrelease` VALUES (715, '2020-02-11 15:42:55', 1, 65, 807);
INSERT INTO `userrelease` VALUES (716, '2020-02-11 15:42:55', 1, 46, 808);
INSERT INTO `userrelease` VALUES (717, '2020-02-11 15:42:55', 1, 28, 809);
INSERT INTO `userrelease` VALUES (718, '2020-02-11 15:42:55', 1, 61, 810);
INSERT INTO `userrelease` VALUES (719, '2020-02-11 15:42:55', 1, 63, 811);
INSERT INTO `userrelease` VALUES (720, '2020-02-11 15:42:55', 1, 50, 812);
INSERT INTO `userrelease` VALUES (721, '2020-02-11 15:42:55', 1, 76, 813);
INSERT INTO `userrelease` VALUES (722, '2020-02-11 15:42:55', 1, 55, 814);
INSERT INTO `userrelease` VALUES (723, '2020-02-11 15:42:55', 1, 79, 815);
INSERT INTO `userrelease` VALUES (724, '2020-02-11 15:42:55', 1, 65, 816);
INSERT INTO `userrelease` VALUES (725, '2020-02-11 15:42:55', 1, 65, 817);
INSERT INTO `userrelease` VALUES (726, '2020-02-11 15:42:55', 1, 33, 818);
INSERT INTO `userrelease` VALUES (727, '2020-02-11 15:42:55', 1, 69, 819);
INSERT INTO `userrelease` VALUES (728, '2020-02-11 15:42:55', 1, 86, 820);
INSERT INTO `userrelease` VALUES (729, '2020-02-11 15:42:55', 1, 63, 821);
INSERT INTO `userrelease` VALUES (730, '2020-02-11 15:42:55', 1, 69, 822);
INSERT INTO `userrelease` VALUES (731, '2020-02-11 15:42:55', 1, 93, 823);
INSERT INTO `userrelease` VALUES (732, '2020-02-11 15:42:55', 1, 13, 824);
INSERT INTO `userrelease` VALUES (733, '2020-02-11 15:42:55', 1, 58, 825);
INSERT INTO `userrelease` VALUES (734, '2020-02-11 15:42:55', 1, 94, 826);
INSERT INTO `userrelease` VALUES (735, '2020-02-11 15:42:55', 1, 91, 827);
INSERT INTO `userrelease` VALUES (736, '2020-02-11 15:42:55', 1, 92, 828);
INSERT INTO `userrelease` VALUES (737, '2020-02-11 15:42:55', 1, 61, 829);
INSERT INTO `userrelease` VALUES (738, '2020-02-11 15:42:55', 1, 18, 830);
INSERT INTO `userrelease` VALUES (739, '2020-02-11 15:42:55', 1, 13, 831);
INSERT INTO `userrelease` VALUES (740, '2020-02-11 15:42:55', 1, 24, 832);
INSERT INTO `userrelease` VALUES (741, '2020-02-11 15:42:55', 1, 4, 833);
INSERT INTO `userrelease` VALUES (742, '2020-02-11 15:42:55', 1, 91, 834);
INSERT INTO `userrelease` VALUES (743, '2020-02-11 15:42:55', 1, 48, 835);
INSERT INTO `userrelease` VALUES (744, '2020-02-11 15:42:55', 1, 32, 836);
INSERT INTO `userrelease` VALUES (745, '2020-02-11 15:42:55', 1, 55, 837);
INSERT INTO `userrelease` VALUES (746, '2020-02-11 15:42:55', 1, 15, 838);
INSERT INTO `userrelease` VALUES (747, '2020-02-11 15:42:55', 1, 28, 839);
INSERT INTO `userrelease` VALUES (748, '2020-02-11 15:42:55', 1, 66, 840);
INSERT INTO `userrelease` VALUES (749, '2020-02-11 15:42:55', 1, 83, 841);
INSERT INTO `userrelease` VALUES (750, '2020-02-11 15:42:55', 1, 82, 842);
INSERT INTO `userrelease` VALUES (751, '2020-02-11 15:42:55', 1, 50, 843);
INSERT INTO `userrelease` VALUES (752, '2020-02-11 15:42:55', 1, 21, 844);
INSERT INTO `userrelease` VALUES (753, '2020-02-11 15:42:55', 1, 38, 845);
INSERT INTO `userrelease` VALUES (754, '2020-02-11 15:42:55', 1, 39, 846);
INSERT INTO `userrelease` VALUES (755, '2020-02-11 15:42:55', 1, 18, 847);
INSERT INTO `userrelease` VALUES (756, '2020-02-11 15:42:55', 1, 55, 848);
INSERT INTO `userrelease` VALUES (757, '2020-02-11 15:42:55', 1, 19, 849);
INSERT INTO `userrelease` VALUES (758, '2020-02-11 15:42:55', 1, 8, 850);
INSERT INTO `userrelease` VALUES (759, '2020-02-11 15:42:55', 1, 34, 851);
INSERT INTO `userrelease` VALUES (760, '2020-02-11 15:42:55', 1, 87, 852);
INSERT INTO `userrelease` VALUES (761, '2020-02-11 15:42:55', 1, 92, 853);
INSERT INTO `userrelease` VALUES (762, '2020-02-11 15:42:55', 1, 55, 854);
INSERT INTO `userrelease` VALUES (763, '2020-02-11 15:42:55', 1, 6, 855);
INSERT INTO `userrelease` VALUES (764, '2020-02-11 15:42:55', 1, 53, 856);
INSERT INTO `userrelease` VALUES (765, '2020-02-11 15:42:55', 1, 49, 857);
INSERT INTO `userrelease` VALUES (766, '2020-02-11 15:42:55', 1, 30, 858);
INSERT INTO `userrelease` VALUES (767, '2020-02-11 15:42:55', 1, 69, 859);
INSERT INTO `userrelease` VALUES (768, '2020-02-11 15:42:55', 1, 83, 860);
INSERT INTO `userrelease` VALUES (769, '2020-02-11 15:42:55', 1, 50, 861);
INSERT INTO `userrelease` VALUES (770, '2020-02-11 15:42:55', 1, 7, 862);
INSERT INTO `userrelease` VALUES (771, '2020-02-11 15:42:55', 1, 81, 863);
INSERT INTO `userrelease` VALUES (772, '2020-02-11 15:42:55', 1, 40, 864);
INSERT INTO `userrelease` VALUES (773, '2020-02-11 15:42:55', 1, 49, 865);
INSERT INTO `userrelease` VALUES (774, '2020-02-11 15:42:55', 1, 97, 866);
INSERT INTO `userrelease` VALUES (775, '2020-02-11 15:42:55', 1, 24, 867);
INSERT INTO `userrelease` VALUES (776, '2020-02-11 15:42:55', 1, 47, 868);
INSERT INTO `userrelease` VALUES (777, '2020-02-11 15:42:55', 1, 26, 869);
INSERT INTO `userrelease` VALUES (778, '2020-02-11 15:42:55', 1, 31, 870);
INSERT INTO `userrelease` VALUES (779, '2020-02-11 15:42:55', 1, 67, 871);
INSERT INTO `userrelease` VALUES (780, '2020-02-11 15:42:55', 1, 93, 872);
INSERT INTO `userrelease` VALUES (781, '2020-02-11 15:42:55', 1, 84, 873);
INSERT INTO `userrelease` VALUES (782, '2020-02-11 15:42:55', 1, 84, 874);
INSERT INTO `userrelease` VALUES (783, '2020-02-11 15:42:55', 1, 51, 875);
INSERT INTO `userrelease` VALUES (784, '2020-02-11 15:42:55', 1, 24, 876);
INSERT INTO `userrelease` VALUES (785, '2020-02-11 15:42:55', 1, 98, 877);
INSERT INTO `userrelease` VALUES (786, '2020-02-11 15:42:55', 1, 28, 878);
INSERT INTO `userrelease` VALUES (787, '2020-02-11 15:42:55', 1, 66, 879);
INSERT INTO `userrelease` VALUES (788, '2020-02-11 15:42:55', 1, 100, 880);
INSERT INTO `userrelease` VALUES (789, '2020-02-11 15:42:55', 1, 63, 881);
INSERT INTO `userrelease` VALUES (790, '2020-02-11 15:42:55', 1, 36, 882);
INSERT INTO `userrelease` VALUES (791, '2020-02-11 15:42:55', 1, 84, 883);
INSERT INTO `userrelease` VALUES (792, '2020-02-11 15:42:55', 1, 69, 884);
INSERT INTO `userrelease` VALUES (793, '2020-02-11 15:42:55', 1, 6, 885);
INSERT INTO `userrelease` VALUES (794, '2020-02-11 15:42:55', 1, 29, 886);
INSERT INTO `userrelease` VALUES (795, '2020-02-11 15:42:55', 1, 84, 887);
INSERT INTO `userrelease` VALUES (796, '2020-02-11 15:42:55', 1, 23, 888);
INSERT INTO `userrelease` VALUES (797, '2020-02-11 15:42:55', 1, 53, 889);
INSERT INTO `userrelease` VALUES (798, '2020-02-11 15:42:55', 1, 52, 890);
INSERT INTO `userrelease` VALUES (799, '2020-02-11 15:42:55', 1, 91, 891);
INSERT INTO `userrelease` VALUES (800, '2020-02-11 15:42:55', 1, 17, 892);
INSERT INTO `userrelease` VALUES (801, '2020-02-11 15:42:55', 1, 37, 893);
INSERT INTO `userrelease` VALUES (802, '2020-02-11 15:42:55', 1, 3, 894);
INSERT INTO `userrelease` VALUES (803, '2020-02-11 15:42:55', 1, 64, 895);
INSERT INTO `userrelease` VALUES (804, '2020-02-11 15:42:55', 1, 93, 896);
INSERT INTO `userrelease` VALUES (805, '2020-02-11 15:42:55', 1, 31, 897);
INSERT INTO `userrelease` VALUES (806, '2020-02-11 15:42:55', 1, 11, 898);
INSERT INTO `userrelease` VALUES (807, '2020-02-11 15:42:55', 1, 90, 899);
INSERT INTO `userrelease` VALUES (808, '2020-02-11 15:42:55', 1, 21, 900);
INSERT INTO `userrelease` VALUES (809, '2020-02-11 15:42:55', 1, 94, 901);
INSERT INTO `userrelease` VALUES (810, '2020-02-11 15:42:55', 1, 74, 902);
INSERT INTO `userrelease` VALUES (811, '2020-02-11 15:42:55', 1, 71, 903);
INSERT INTO `userrelease` VALUES (812, '2020-02-11 15:42:55', 1, 68, 904);
INSERT INTO `userrelease` VALUES (813, '2020-02-11 15:42:55', 1, 73, 905);
INSERT INTO `userrelease` VALUES (814, '2020-02-11 15:42:55', 1, 96, 906);
INSERT INTO `userrelease` VALUES (815, '2020-02-11 15:42:55', 1, 66, 907);
INSERT INTO `userrelease` VALUES (816, '2020-02-11 15:42:55', 1, 100, 908);
INSERT INTO `userrelease` VALUES (817, '2020-02-11 15:42:55', 1, 97, 909);
INSERT INTO `userrelease` VALUES (818, '2020-02-11 15:42:55', 1, 74, 910);
INSERT INTO `userrelease` VALUES (819, '2020-02-11 15:42:55', 1, 24, 911);
INSERT INTO `userrelease` VALUES (820, '2020-02-11 15:42:55', 1, 23, 912);
INSERT INTO `userrelease` VALUES (821, '2020-02-11 15:42:55', 1, 73, 913);
INSERT INTO `userrelease` VALUES (822, '2020-02-11 15:42:55', 1, 80, 914);
INSERT INTO `userrelease` VALUES (823, '2020-02-11 15:42:55', 1, 90, 915);
INSERT INTO `userrelease` VALUES (824, '2020-02-11 15:42:55', 1, 18, 916);
INSERT INTO `userrelease` VALUES (825, '2020-02-11 15:42:55', 1, 30, 917);
INSERT INTO `userrelease` VALUES (826, '2020-02-11 15:42:55', 1, 55, 918);
INSERT INTO `userrelease` VALUES (827, '2020-02-11 15:42:55', 1, 47, 919);
INSERT INTO `userrelease` VALUES (828, '2020-02-11 15:42:55', 1, 74, 920);
INSERT INTO `userrelease` VALUES (829, '2020-02-11 15:42:55', 1, 34, 921);
INSERT INTO `userrelease` VALUES (830, '2020-02-11 15:42:55', 1, 6, 922);
INSERT INTO `userrelease` VALUES (831, '2020-02-11 15:42:55', 1, 54, 923);
INSERT INTO `userrelease` VALUES (832, '2020-02-11 15:42:55', 1, 66, 924);
INSERT INTO `userrelease` VALUES (833, '2020-02-11 15:42:55', 1, 7, 925);
INSERT INTO `userrelease` VALUES (834, '2020-02-11 15:42:55', 1, 22, 926);
INSERT INTO `userrelease` VALUES (835, '2020-02-11 15:42:55', 1, 31, 927);
INSERT INTO `userrelease` VALUES (836, '2020-02-11 15:42:55', 1, 22, 928);
INSERT INTO `userrelease` VALUES (837, '2020-02-11 15:42:55', 1, 80, 929);
INSERT INTO `userrelease` VALUES (838, '2020-02-11 15:42:55', 1, 26, 930);
INSERT INTO `userrelease` VALUES (839, '2020-02-11 15:42:55', 1, 20, 931);
INSERT INTO `userrelease` VALUES (840, '2020-02-11 15:42:55', 1, 9, 932);
INSERT INTO `userrelease` VALUES (841, '2020-02-11 15:42:55', 1, 49, 933);
INSERT INTO `userrelease` VALUES (842, '2020-02-11 15:42:55', 1, 70, 934);
INSERT INTO `userrelease` VALUES (843, '2020-02-11 15:42:55', 1, 30, 935);
INSERT INTO `userrelease` VALUES (844, '2020-02-11 15:42:55', 1, 2, 936);
INSERT INTO `userrelease` VALUES (845, '2020-02-11 15:42:55', 1, 86, 937);
INSERT INTO `userrelease` VALUES (846, '2020-02-11 15:42:55', 1, 4, 938);
INSERT INTO `userrelease` VALUES (847, '2020-02-11 15:42:55', 1, 38, 939);
INSERT INTO `userrelease` VALUES (848, '2020-02-11 15:42:55', 1, 41, 940);
INSERT INTO `userrelease` VALUES (849, '2020-02-11 15:42:55', 1, 87, 941);
INSERT INTO `userrelease` VALUES (850, '2020-02-11 15:42:55', 1, 1, 942);
INSERT INTO `userrelease` VALUES (851, '2020-02-11 15:42:55', 1, 3, 943);
INSERT INTO `userrelease` VALUES (852, '2020-02-11 15:42:55', 1, 49, 944);
INSERT INTO `userrelease` VALUES (853, '2020-02-11 15:42:55', 1, 9, 945);
INSERT INTO `userrelease` VALUES (854, '2020-02-11 15:42:55', 1, 1, 946);
INSERT INTO `userrelease` VALUES (855, '2020-02-11 15:42:55', 1, 46, 947);
INSERT INTO `userrelease` VALUES (856, '2020-02-11 15:42:55', 1, 84, 948);
INSERT INTO `userrelease` VALUES (857, '2020-02-11 15:42:55', 1, 59, 949);
INSERT INTO `userrelease` VALUES (858, '2020-02-11 15:42:55', 1, 65, 950);
INSERT INTO `userrelease` VALUES (859, '2020-02-11 15:42:55', 1, 50, 951);
INSERT INTO `userrelease` VALUES (860, '2020-02-11 15:42:55', 1, 30, 952);
INSERT INTO `userrelease` VALUES (861, '2020-02-11 15:42:55', 1, 8, 953);
INSERT INTO `userrelease` VALUES (862, '2020-02-11 15:42:55', 1, 62, 954);
INSERT INTO `userrelease` VALUES (863, '2020-02-11 15:42:55', 1, 28, 955);
INSERT INTO `userrelease` VALUES (864, '2020-02-11 15:42:55', 1, 79, 956);
INSERT INTO `userrelease` VALUES (865, '2020-02-11 15:42:55', 1, 39, 957);
INSERT INTO `userrelease` VALUES (866, '2020-02-11 15:42:55', 1, 87, 958);
INSERT INTO `userrelease` VALUES (867, '2020-02-11 15:42:55', 1, 58, 959);
INSERT INTO `userrelease` VALUES (868, '2020-02-11 15:42:55', 1, 68, 960);
INSERT INTO `userrelease` VALUES (869, '2020-02-11 15:42:55', 1, 42, 961);
INSERT INTO `userrelease` VALUES (870, '2020-02-11 15:42:55', 1, 25, 962);
INSERT INTO `userrelease` VALUES (871, '2020-02-11 15:42:55', 1, 48, 963);
INSERT INTO `userrelease` VALUES (872, '2020-02-11 15:42:55', 1, 27, 964);
INSERT INTO `userrelease` VALUES (873, '2020-02-11 15:42:55', 1, 88, 965);
INSERT INTO `userrelease` VALUES (874, '2020-02-11 15:42:55', 1, 88, 966);
INSERT INTO `userrelease` VALUES (875, '2020-02-11 15:42:55', 1, 40, 967);
INSERT INTO `userrelease` VALUES (876, '2020-02-11 15:42:55', 1, 84, 968);
INSERT INTO `userrelease` VALUES (877, '2020-02-11 15:42:55', 1, 61, 969);
INSERT INTO `userrelease` VALUES (878, '2020-02-11 15:42:55', 1, 91, 970);
INSERT INTO `userrelease` VALUES (879, '2020-02-11 15:42:55', 1, 29, 971);
INSERT INTO `userrelease` VALUES (880, '2020-02-11 15:42:55', 1, 28, 972);
INSERT INTO `userrelease` VALUES (881, '2020-02-11 15:42:55', 1, 75, 973);
INSERT INTO `userrelease` VALUES (882, '2020-02-11 15:42:55', 1, 60, 974);
INSERT INTO `userrelease` VALUES (883, '2020-02-11 15:42:55', 1, 43, 975);
INSERT INTO `userrelease` VALUES (884, '2020-02-11 15:42:55', 1, 14, 976);
INSERT INTO `userrelease` VALUES (885, '2020-02-11 15:42:55', 1, 75, 977);
INSERT INTO `userrelease` VALUES (886, '2020-02-11 15:42:55', 1, 93, 978);
INSERT INTO `userrelease` VALUES (887, '2020-02-11 15:42:55', 1, 54, 979);
INSERT INTO `userrelease` VALUES (888, '2020-02-11 15:42:55', 1, 33, 980);
INSERT INTO `userrelease` VALUES (889, '2020-02-11 15:42:55', 1, 55, 981);
INSERT INTO `userrelease` VALUES (890, '2020-02-11 15:42:55', 1, 26, 982);
INSERT INTO `userrelease` VALUES (891, '2020-02-11 15:42:55', 1, 37, 983);
INSERT INTO `userrelease` VALUES (892, '2020-02-11 15:42:55', 1, 84, 984);
INSERT INTO `userrelease` VALUES (893, '2020-02-11 15:42:55', 1, 3, 985);
INSERT INTO `userrelease` VALUES (894, '2020-02-11 15:42:55', 1, 99, 986);
INSERT INTO `userrelease` VALUES (895, '2020-02-11 15:42:55', 1, 69, 987);
INSERT INTO `userrelease` VALUES (896, '2020-02-11 15:42:55', 1, 46, 988);
INSERT INTO `userrelease` VALUES (897, '2020-02-11 15:42:55', 1, 54, 989);
INSERT INTO `userrelease` VALUES (898, '2020-02-11 15:42:55', 1, 59, 990);
INSERT INTO `userrelease` VALUES (899, '2020-02-11 15:42:55', 1, 43, 991);
INSERT INTO `userrelease` VALUES (900, '2020-02-11 15:42:55', 1, 82, 992);
INSERT INTO `userrelease` VALUES (901, '2020-02-11 15:42:55', 1, 96, 993);
INSERT INTO `userrelease` VALUES (902, '2020-02-11 15:42:55', 1, 89, 994);
INSERT INTO `userrelease` VALUES (903, '2020-02-11 15:42:55', 1, 63, 995);
INSERT INTO `userrelease` VALUES (904, '2020-02-11 15:42:55', 1, 55, 996);
INSERT INTO `userrelease` VALUES (905, '2020-02-11 15:42:55', 1, 91, 997);
INSERT INTO `userrelease` VALUES (906, '2020-02-11 15:42:55', 1, 64, 998);
INSERT INTO `userrelease` VALUES (907, '2020-02-11 15:42:55', 1, 96, 999);
INSERT INTO `userrelease` VALUES (908, '2020-02-11 15:42:55', 1, 45, 1000);
INSERT INTO `userrelease` VALUES (909, '2020-02-11 15:42:55', 1, 15, 1001);
INSERT INTO `userrelease` VALUES (910, '2020-02-11 15:42:55', 1, 45, 1002);
INSERT INTO `userrelease` VALUES (911, '2020-02-11 15:42:55', 1, 25, 1003);
INSERT INTO `userrelease` VALUES (912, '2020-02-11 15:42:55', 1, 95, 1004);
INSERT INTO `userrelease` VALUES (913, '2020-02-11 15:42:55', 1, 69, 1005);
INSERT INTO `userrelease` VALUES (914, '2020-02-11 15:42:55', 1, 100, 1006);
INSERT INTO `userrelease` VALUES (915, '2020-02-11 15:42:55', 1, 21, 1007);
INSERT INTO `userrelease` VALUES (916, '2020-02-11 15:42:55', 1, 61, 1008);
INSERT INTO `userrelease` VALUES (917, '2020-02-11 15:42:55', 1, 56, 1009);
INSERT INTO `userrelease` VALUES (918, '2020-02-11 15:42:55', 1, 43, 1010);
INSERT INTO `userrelease` VALUES (919, '2020-02-11 15:42:55', 1, 7, 1011);
INSERT INTO `userrelease` VALUES (920, '2020-02-11 15:42:55', 1, 39, 1012);
INSERT INTO `userrelease` VALUES (921, '2020-02-11 15:42:55', 1, 87, 1013);
INSERT INTO `userrelease` VALUES (922, '2020-02-11 15:42:55', 1, 59, 1014);
INSERT INTO `userrelease` VALUES (923, '2020-02-11 15:42:55', 1, 64, 1015);
INSERT INTO `userrelease` VALUES (924, '2020-02-11 15:42:55', 1, 32, 1016);
INSERT INTO `userrelease` VALUES (925, '2020-02-11 15:42:55', 1, 36, 1017);
INSERT INTO `userrelease` VALUES (926, '2020-02-11 15:42:55', 1, 34, 1018);
INSERT INTO `userrelease` VALUES (927, '2020-02-11 15:42:55', 1, 67, 1019);
INSERT INTO `userrelease` VALUES (928, '2020-02-11 15:42:55', 1, 36, 1020);
INSERT INTO `userrelease` VALUES (929, '2020-02-11 15:42:55', 1, 47, 1021);
INSERT INTO `userrelease` VALUES (930, '2020-02-11 15:42:55', 1, 86, 1022);
INSERT INTO `userrelease` VALUES (931, '2020-02-11 15:42:55', 1, 36, 1023);
INSERT INTO `userrelease` VALUES (932, '2020-02-11 15:42:55', 1, 5, 1024);
INSERT INTO `userrelease` VALUES (933, '2020-02-11 15:42:55', 1, 98, 1025);
INSERT INTO `userrelease` VALUES (934, '2020-02-11 15:42:55', 1, 52, 1026);
INSERT INTO `userrelease` VALUES (935, '2020-02-11 15:42:55', 1, 85, 1027);
INSERT INTO `userrelease` VALUES (936, '2020-02-11 15:42:55', 1, 53, 1028);
INSERT INTO `userrelease` VALUES (937, '2020-02-11 15:42:55', 1, 1, 1029);
INSERT INTO `userrelease` VALUES (938, '2020-02-11 15:42:55', 1, 89, 1030);
INSERT INTO `userrelease` VALUES (939, '2020-02-11 15:42:55', 1, 26, 1031);
INSERT INTO `userrelease` VALUES (940, '2020-02-11 15:42:55', 1, 50, 1032);
INSERT INTO `userrelease` VALUES (941, '2020-02-11 15:42:55', 1, 9, 1033);
INSERT INTO `userrelease` VALUES (942, '2020-02-11 15:42:55', 1, 71, 1034);
INSERT INTO `userrelease` VALUES (943, '2020-02-11 15:42:55', 1, 47, 1035);
INSERT INTO `userrelease` VALUES (944, '2020-02-11 15:42:55', 1, 3, 1036);
INSERT INTO `userrelease` VALUES (945, '2020-02-11 15:42:55', 1, 79, 1037);
INSERT INTO `userrelease` VALUES (946, '2020-02-11 15:42:55', 1, 37, 1038);
INSERT INTO `userrelease` VALUES (947, '2020-02-11 15:42:55', 1, 76, 1039);
INSERT INTO `userrelease` VALUES (948, '2020-02-11 15:42:55', 1, 11, 1040);
INSERT INTO `userrelease` VALUES (949, '2020-02-11 15:42:55', 1, 47, 1041);
INSERT INTO `userrelease` VALUES (950, '2020-02-11 15:42:55', 1, 95, 1042);
INSERT INTO `userrelease` VALUES (951, '2020-02-11 15:42:55', 1, 29, 1043);
INSERT INTO `userrelease` VALUES (952, '2020-02-11 15:42:55', 1, 24, 1044);
INSERT INTO `userrelease` VALUES (953, '2020-02-11 15:42:55', 1, 26, 1045);
INSERT INTO `userrelease` VALUES (954, '2020-02-11 15:42:55', 1, 16, 1046);
INSERT INTO `userrelease` VALUES (955, '2020-02-11 15:42:55', 1, 36, 1047);
INSERT INTO `userrelease` VALUES (956, '2020-02-11 15:42:55', 1, 89, 1048);
INSERT INTO `userrelease` VALUES (957, '2020-02-11 15:42:55', 1, 10, 1049);
INSERT INTO `userrelease` VALUES (958, '2020-02-11 15:42:55', 1, 26, 1050);
INSERT INTO `userrelease` VALUES (959, '2020-02-11 15:42:55', 1, 41, 1051);
INSERT INTO `userrelease` VALUES (960, '2020-02-11 15:42:55', 1, 82, 1052);
INSERT INTO `userrelease` VALUES (961, '2020-02-11 15:42:55', 1, 56, 1053);
INSERT INTO `userrelease` VALUES (962, '2020-02-11 15:42:55', 1, 84, 1054);
INSERT INTO `userrelease` VALUES (963, '2020-02-11 15:42:55', 1, 81, 1055);
INSERT INTO `userrelease` VALUES (964, '2020-02-11 15:42:55', 1, 24, 1056);
INSERT INTO `userrelease` VALUES (965, '2020-02-11 15:42:55', 1, 81, 1057);
INSERT INTO `userrelease` VALUES (966, '2020-02-11 15:42:55', 1, 88, 1058);
INSERT INTO `userrelease` VALUES (967, '2020-02-11 15:42:55', 1, 39, 1059);
INSERT INTO `userrelease` VALUES (968, '2020-02-11 15:42:55', 1, 21, 1060);
INSERT INTO `userrelease` VALUES (969, '2020-02-11 15:42:55', 1, 87, 1061);
INSERT INTO `userrelease` VALUES (970, '2020-02-11 15:42:55', 1, 29, 1062);
INSERT INTO `userrelease` VALUES (971, '2020-02-11 15:42:55', 1, 15, 1063);
INSERT INTO `userrelease` VALUES (972, '2020-02-11 15:42:55', 1, 22, 1064);
INSERT INTO `userrelease` VALUES (973, '2020-02-11 15:42:55', 1, 22, 1065);
INSERT INTO `userrelease` VALUES (974, '2020-02-11 15:42:55', 1, 80, 1066);
INSERT INTO `userrelease` VALUES (975, '2020-02-11 15:42:55', 1, 24, 1067);
INSERT INTO `userrelease` VALUES (976, '2020-02-11 15:42:55', 1, 61, 1068);
INSERT INTO `userrelease` VALUES (977, '2020-02-11 15:42:55', 1, 15, 1069);
INSERT INTO `userrelease` VALUES (978, '2020-02-11 15:42:55', 1, 42, 1070);
INSERT INTO `userrelease` VALUES (979, '2020-02-11 15:42:55', 1, 89, 1071);
INSERT INTO `userrelease` VALUES (980, '2020-02-11 15:42:55', 1, 71, 1072);
INSERT INTO `userrelease` VALUES (981, '2020-02-11 15:42:55', 1, 76, 1073);
INSERT INTO `userrelease` VALUES (982, '2020-02-11 15:42:55', 1, 14, 1074);
INSERT INTO `userrelease` VALUES (983, '2020-02-11 15:42:55', 1, 4, 1075);
INSERT INTO `userrelease` VALUES (984, '2020-02-11 15:42:55', 1, 22, 1076);
INSERT INTO `userrelease` VALUES (985, '2020-02-11 15:42:55', 1, 70, 1077);
INSERT INTO `userrelease` VALUES (986, '2020-02-11 15:42:55', 1, 53, 1078);
INSERT INTO `userrelease` VALUES (987, '2020-02-11 15:42:55', 1, 45, 1079);
INSERT INTO `userrelease` VALUES (988, '2020-02-11 15:42:55', 1, 20, 1080);
INSERT INTO `userrelease` VALUES (989, '2020-02-11 15:42:55', 1, 20, 1081);
INSERT INTO `userrelease` VALUES (990, '2020-02-11 15:42:55', 1, 95, 1082);
INSERT INTO `userrelease` VALUES (991, '2020-02-11 15:42:55', 1, 51, 1083);
INSERT INTO `userrelease` VALUES (992, '2020-02-11 15:42:55', 1, 42, 1084);
INSERT INTO `userrelease` VALUES (993, '2020-02-11 15:42:55', 1, 30, 1085);
INSERT INTO `userrelease` VALUES (994, '2020-02-11 15:42:55', 1, 85, 1086);
INSERT INTO `userrelease` VALUES (995, '2020-02-11 15:42:55', 1, 37, 1087);
INSERT INTO `userrelease` VALUES (996, '2020-02-11 15:42:55', 1, 80, 1088);
INSERT INTO `userrelease` VALUES (997, '2020-02-11 15:42:55', 1, 59, 1089);
INSERT INTO `userrelease` VALUES (998, '2020-02-11 15:42:55', 1, 17, 1090);
INSERT INTO `userrelease` VALUES (999, '2020-02-11 15:42:55', 1, 75, 1091);
INSERT INTO `userrelease` VALUES (1000, '2020-02-11 15:42:55', 1, 75, 1092);
INSERT INTO `userrelease` VALUES (1001, '2020-02-11 15:42:55', 1, 68, 1093);
INSERT INTO `userrelease` VALUES (1002, '2020-02-11 15:42:55', 1, 7, 1094);
INSERT INTO `userrelease` VALUES (1003, '2020-02-11 15:42:55', 1, 7, 1095);
INSERT INTO `userrelease` VALUES (1004, '2020-02-11 15:42:55', 1, 7, 1096);
INSERT INTO `userrelease` VALUES (1005, '2020-02-11 15:42:55', 1, 7, 1097);
INSERT INTO `userrelease` VALUES (1006, '2020-02-21 14:40:49', 1, 1604412308, 101);
INSERT INTO `userrelease` VALUES (1007, '2020-02-21 14:49:34', 1, 1604412308, 102);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `sid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '学号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '账号创建时间',
  `is_manager` tinyint(1) NULL DEFAULT 0 COMMENT '是否管理员',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1111111111', '测试啊', '333333', NULL, 0);
INSERT INTO `users` VALUES ('1604405141', 'www', '333333', '2020-01-02 16:25:53', 0);
INSERT INTO `users` VALUES ('1604412308', '晓婷', '123456', NULL, 1);
INSERT INTO `users` VALUES ('2222222222', 'qqqqq', '333333', NULL, 0);

-- ----------------------------
-- Table structure for userstate
-- ----------------------------
DROP TABLE IF EXISTS `userstate`;
CREATE TABLE `userstate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit` int(11) NOT NULL DEFAULT 80,
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `modified` datetime(0) NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
