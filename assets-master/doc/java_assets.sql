/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : java_assets

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/03/2022 15:09:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asset_aptitude
-- ----------------------------
DROP TABLE IF EXISTS `asset_aptitude`;
CREATE TABLE `asset_aptitude`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产',
  `img_id` int(11) NULL DEFAULT NULL COMMENT '图片',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `get_time` date NULL DEFAULT NULL COMMENT '获取时间',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产说明',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '无形资产' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_aptitude
-- ----------------------------
INSERT INTO `asset_aptitude` VALUES (1, '专利10', 10, 13, '2020-11-30', NULL, 'admin', '2021-03-08 15:35:23', 'admin', '2021-11-11 02:35:33');

-- ----------------------------
-- Table structure for asset_category
-- ----------------------------
DROP TABLE IF EXISTS `asset_category`;
CREATE TABLE `asset_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `pid` int(11) NOT NULL COMMENT '上级',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '分类类别',
  `list_sort` int(11) NULL DEFAULT 9 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资产分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_category
-- ----------------------------
INSERT INTO `asset_category` VALUES (1, '电子类', 0, '1', 1, '1');
INSERT INTO `asset_category` VALUES (2, '办公类', 0, '1', 2, '1');
INSERT INTO `asset_category` VALUES (3, '耗材类', 0, '2', 9, '1');
INSERT INTO `asset_category` VALUES (4, '交通类', 0, '1', 3, '1');
INSERT INTO `asset_category` VALUES (5, '资质荣耀', 0, '3', 4, '1');
INSERT INTO `asset_category` VALUES (6, '笔记本电脑', 1, '1', 1, '1');
INSERT INTO `asset_category` VALUES (7, '台式机', 1, '1', 2, '1');
INSERT INTO `asset_category` VALUES (8, '打印机', 2, '1', 3, '1');
INSERT INTO `asset_category` VALUES (9, '路由器', 1, '1', 3, '1');
INSERT INTO `asset_category` VALUES (10, '笔记本', 2, '2', 9, '1');
INSERT INTO `asset_category` VALUES (12, '轿车', 4, '1', 2, '1');
INSERT INTO `asset_category` VALUES (13, '发名专利', 5, '3', 1, '1');
INSERT INTO `asset_category` VALUES (14, '著作权', 5, '1', 2, '1');
INSERT INTO `asset_category` VALUES (15, '内存条', 6, '1', 1, '1');
INSERT INTO `asset_category` VALUES (16, '电缆设备', 0, '2', 1, '1');
INSERT INTO `asset_category` VALUES (17, '测试类', 0, '1', 1, '1');

-- ----------------------------
-- Table structure for asset_delivery
-- ----------------------------
DROP TABLE IF EXISTS `asset_delivery`;
CREATE TABLE `asset_delivery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `apply_id` int(11) NOT NULL COMMENT '申请ID(使用或领用)',
  `material_id` int(11) NULL DEFAULT NULL COMMENT '耗材ID',
  `asset_id` int(11) NULL DEFAULT NULL COMMENT '资产ID',
  `amount` float(10, 3) NOT NULL COMMENT '出库数量',
  `house_id` int(11) NOT NULL COMMENT '仓库',
  `recv_user_id` int(11) NOT NULL COMMENT '接收人',
  `img_id` int(11) NULL DEFAULT NULL COMMENT '确认单',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_delivery
-- ----------------------------
INSERT INTO `asset_delivery` VALUES (1, 6, 0, NULL, 41, 1.000, 2, 1, 10, 'admin', '2021-03-08 18:55:34', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (2, 6, 1, NULL, 41, 1.000, 2, 1, 10, 'admin', '2021-03-08 19:07:19', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (3, 11, 1, 1, NULL, 1.000, 2, 1, 10, 'admin', '2021-03-09 09:34:49', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (4, 11, 2, 2, NULL, 1.000, 2, 1, NULL, 'admin', '2021-03-25 15:21:27', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (5, 8, 3, 1, NULL, 1.000, 2, 1, NULL, 'admin', '2021-03-25 15:24:05', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (6, 11, 4, 2, NULL, 2.000, 2, 1, NULL, 'admin', '2021-03-25 15:25:19', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (7, 12, 3, NULL, 45, 1.000, 1, 1, 10, 'admin', '2021-04-13 15:46:16', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (8, 6, 4, NULL, 38, 1.000, 2, 1, 11, 'admin', '2021-09-10 15:04:36', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (9, 11, 6, 2, NULL, 1.000, 2, 1, 11, 'admin', '2021-09-11 11:34:25', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (10, 11, 7, 2, NULL, 3.000, 2, 1, NULL, 'admin', '2021-09-22 17:13:40', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (11, 9, 7, NULL, 53, 1.000, 1, 1, NULL, 'admin', '2021-10-20 16:15:02', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (12, 11, 5, 1, NULL, 3.000, 2, 1, NULL, 'admin', '2021-10-20 17:07:40', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (13, 11, 9, 2, NULL, 12.000, 2, 1, NULL, 'admin', '2021-10-26 14:04:07', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (14, 12, 8, NULL, 45, 1.000, 1, 1, NULL, 'admin', '2021-10-26 14:43:13', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (15, 7, 9, NULL, 48, 1.000, 1, 1, NULL, 'admin', '2021-10-26 14:49:27', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (16, 15, 10, NULL, 64, 1.000, 1, 1, NULL, 'admin', '2021-10-26 16:03:59', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (17, 8, 11, NULL, 67, 1.000, 2, 1, NULL, 'admin', '2021-11-04 16:46:54', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (18, 11, 11, 3, NULL, 11.000, 2, 1, NULL, 'admin', '2021-11-08 18:27:43', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (19, 11, 14, 1, NULL, 2.000, 2, 3, NULL, 'admin', '2021-11-26 10:09:47', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (20, 11, 13, 3, NULL, 12.000, 2, 1, NULL, 'admin', '2021-11-30 20:47:14', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (21, 8, 18, NULL, 68, 1.000, 1, 1, NULL, 'admin', '2021-11-30 21:09:16', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (22, 11, 12, 3, NULL, 12.000, 2, 1, NULL, 'admin', '2021-11-30 21:11:20', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (23, 7, 5, NULL, 47, 1.000, 1, 3, NULL, 'admin', '2021-12-21 14:39:31', NULL, NULL);
INSERT INTO `asset_delivery` VALUES (24, 3, 15, 7, NULL, 3.000, 1, 7, NULL, 'admin', '2022-03-09 13:55:25', NULL, NULL);

-- ----------------------------
-- Table structure for asset_entering
-- ----------------------------
DROP TABLE IF EXISTS `asset_entering`;
CREATE TABLE `asset_entering`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `purchase_id` int(11) NULL DEFAULT NULL COMMENT '采购订单',
  `house_id` int(11) NULL DEFAULT NULL COMMENT '仓库',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品参数',
  `factory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商',
  `proxy` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买渠道',
  `amount` float(10, 3) NOT NULL COMMENT '入库数量',
  `price1` float(10, 3) NULL DEFAULT NULL COMMENT '市场价格',
  `price2` float(10, 3) NULL DEFAULT NULL COMMENT '购买价格',
  `recv_user_id` int(11) NULL DEFAULT NULL COMMENT '接收人',
  `recv_time` datetime NOT NULL COMMENT '接收时间',
  `img_id` int(11) NULL DEFAULT NULL COMMENT '收货单',
  `nums` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_entering
-- ----------------------------
INSERT INTO `asset_entering` VALUES (3, 6, 1, 1, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 2.000, 6000.000, 5600.000, 1, '2021-03-08 00:00:00', 10, '3242314\n2342343', 'admin', '2021-03-08 09:51:40', 'admin', '2021-03-08 16:13:20');
INSERT INTO `asset_entering` VALUES (4, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 3.000, 6000.000, 5500.000, 1, '2021-02-28 00:00:00', NULL, '234123\n234\n124', 'admin', '2021-03-08 09:53:07', NULL, NULL);
INSERT INTO `asset_entering` VALUES (5, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 3.000, 6000.000, 5500.000, 1, '2021-02-28 00:00:00', NULL, '234123\n234\n124', 'admin', '2021-03-08 09:53:10', NULL, NULL);
INSERT INTO `asset_entering` VALUES (6, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 3.000, 6000.000, 5400.000, 1, '2021-03-08 00:00:00', NULL, '2341\n1234213\n2341', 'admin', '2021-03-08 09:54:16', NULL, NULL);
INSERT INTO `asset_entering` VALUES (7, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 3.000, 6000.000, 5400.000, 1, '2021-03-08 00:00:00', NULL, '2341\n1234213\n2341', 'admin', '2021-03-08 09:54:30', NULL, NULL);
INSERT INTO `asset_entering` VALUES (8, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 3.000, 6000.000, 5400.000, 1, '2021-03-08 00:00:00', NULL, '2341\n1234213\n2341', 'admin', '2021-03-08 09:54:43', NULL, NULL);
INSERT INTO `asset_entering` VALUES (9, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 3.000, 6000.000, 5400.000, 1, '2021-03-08 00:00:00', NULL, '2341\n1234213\n2341', 'admin', '2021-03-08 09:54:51', 'admin', '2021-03-08 16:10:31');
INSERT INTO `asset_entering` VALUES (10, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 3.000, 6000.000, 5400.000, 1, '2021-03-08 00:00:00', NULL, '2341\n1234213\n2341', 'admin', '2021-03-08 09:54:53', NULL, NULL);
INSERT INTO `asset_entering` VALUES (11, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 1.000, 5000.000, 1500.000, 1, '2021-03-08 00:00:00', NULL, '42134', 'admin', '2021-03-08 09:58:08', NULL, NULL);
INSERT INTO `asset_entering` VALUES (12, 6, 1, 2, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 1.000, 6000.000, 4000.000, 1, '2021-03-08 00:00:00', NULL, '2134324\n12421343', 'admin', '2021-03-08 10:07:35', NULL, NULL);
INSERT INTO `asset_entering` VALUES (13, 11, 2, 2, '圆珠笔', '无', NULL, NULL, 50.000, 3.000, 2.000, 1, '2021-03-08 00:00:00', NULL, NULL, 'admin', '2021-03-08 10:28:11', NULL, NULL);
INSERT INTO `asset_entering` VALUES (14, 11, 2, 2, '圆珠笔', '无', NULL, NULL, 300.000, 3.000, 2.000, 1, '2021-05-08 17:21:38', NULL, NULL, 'admin', '2021-05-08 17:21:44', NULL, NULL);
INSERT INTO `asset_entering` VALUES (15, 11, 2, 1, '圆珠笔', '无', NULL, NULL, 700.000, 3.000, 2.000, 1, '2021-05-03 00:00:00', NULL, NULL, 'admin', '2021-05-08 17:21:56', NULL, NULL);
INSERT INTO `asset_entering` VALUES (16, 7, 3, 1, '台式机', 'I5 8G', '', '', 1.000, NULL, 3688.000, 1, '2021-09-13 17:54:27', 11, '324324', 'admin', '2021-09-13 17:54:27', NULL, NULL);
INSERT INTO `asset_entering` VALUES (17, 7, 3, 1, '台式机', 'I5 8G', '', '', 1.000, NULL, 3688.000, 1, '2021-09-13 17:55:09', 11, '56123541', 'admin', '2021-09-13 17:55:09', NULL, NULL);
INSERT INTO `asset_entering` VALUES (20, 7, 3, 1, '台式机', 'I5 8G', '3', '34', 1.000, 4333.000, 3688.000, 1, '2021-09-14 15:59:04', 19, '333333', 'admin', '2021-09-14 15:59:04', 'admin', '2021-11-30 19:30:37');
INSERT INTO `asset_entering` VALUES (21, 9, 4, 1, '大雄路由', '123456', '大雄有限公司', '淘宝', 2.000, 500.000, 300.000, 1, '2021-10-20 00:00:00', NULL, '10001\n10002', 'admin', '2021-10-20 16:04:51', 'admin', '2021-10-20 16:20:50');
INSERT INTO `asset_entering` VALUES (22, 9, 4, 1, '大雄路由', '123456', '大雄有限公司', '淘宝', 8.000, 500.000, 300.000, 1, '2021-10-20 00:00:00', NULL, '10003\n10004\n10005\n10006\n10007\n10008\n10009\n10010', 'admin', '2021-10-20 16:08:56', NULL, NULL);
INSERT INTO `asset_entering` VALUES (23, 15, 7, 1, '金士顿', '16G', '金士顿旗舰店', '天猫', 2.000, 200.000, 160.000, 1, '2021-10-26 15:56:10', NULL, '1001\n1002', 'admin', '2021-10-26 15:56:30', 'admin', '2021-10-26 16:01:38');
INSERT INTO `asset_entering` VALUES (24, 6, 8, 1, '11', '11', '111', '111', 1.000, 12.000, 12.000, 1, '2021-11-09 00:00:00', NULL, '123', 'admin', '2021-11-04 14:03:35', NULL, NULL);
INSERT INTO `asset_entering` VALUES (25, 8, 9, 2, '富士', '1231', NULL, NULL, 1.000, 123.000, 132.000, 1, '2021-11-04 16:22:38', NULL, '121431', 'admin', '2021-11-04 16:22:53', NULL, NULL);
INSERT INTO `asset_entering` VALUES (26, 8, 9, 1, '富士', '1231', NULL, NULL, 1.000, 122.000, 123.000, 1, '2021-11-04 16:23:36', NULL, '21431123', 'admin', '2021-11-04 16:23:53', NULL, NULL);
INSERT INTO `asset_entering` VALUES (27, 8, 9, 1, '富士', '1231', NULL, NULL, 21.000, 12.000, 12.000, 1, '2021-11-04 16:24:13', NULL, '0000098', 'admin', '2021-11-04 16:24:27', 'admin', '2021-11-06 14:00:50');
INSERT INTO `asset_entering` VALUES (28, 11, 11, 1, '123', '123', NULL, NULL, 1.000, 100.000, 100.000, 1, '2021-11-06 00:00:00', 18, NULL, 'admin', '2021-11-06 16:02:42', 'admin', '2021-11-28 14:14:57');
INSERT INTO `asset_entering` VALUES (29, 7, 21, 1, '联想', '341234', NULL, NULL, 2.000, 453.000, 54.000, 7, '2022-03-09 14:52:42', NULL, NULL, 'tom', '2022-03-09 14:52:43', NULL, NULL);
INSERT INTO `asset_entering` VALUES (30, 7, 21, 1, '联想', '341234', NULL, NULL, 1.000, 4234.000, 324.000, 7, '2022-03-09 14:53:01', NULL, NULL, 'tom', '2022-03-09 14:53:45', NULL, NULL);

-- ----------------------------
-- Table structure for asset_info
-- ----------------------------
DROP TABLE IF EXISTS `asset_info`;
CREATE TABLE `asset_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  `factory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商',
  `proxy` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买渠道',
  `price` float(10, 3) NOT NULL COMMENT '当前价值',
  `price1` float(10, 3) NULL DEFAULT NULL COMMENT '市场价格',
  `price2` float(10, 3) NULL DEFAULT NULL COMMENT '购买价格',
  `house_id` int(11) NULL DEFAULT NULL COMMENT '仓库',
  `img_id` int(11) NULL DEFAULT NULL COMMENT '图例',
  `is_it` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否IT设备',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产说明',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产状态',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '所属部门',
  `use_user_id` int(11) NULL DEFAULT NULL COMMENT '使用人',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '预计归还时间',
  `scrap_time` date NULL DEFAULT NULL COMMENT '报废时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资产信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_info
-- ----------------------------
INSERT INTO `asset_info` VALUES (34, 6, '3242314', '开发电脑', NULL, '', '', 5200.000, 6000.000, 5600.000, 1, 7, 'N', '', '5', 100, NULL, '2021-09-10 13:46:29', NULL, 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (35, 6, '2342343', '开发电脑', NULL, '', '', 5600.000, 6000.000, 5600.000, 1, NULL, 'N', '', '5', NULL, NULL, NULL, NULL, 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (36, 6, '234123', '开发电脑', NULL, '', '', 4900.000, 6000.000, 5500.000, 2, NULL, 'N', '', '5', NULL, NULL, NULL, NULL, 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (37, 6, '234', '开发电脑', NULL, '', '', 4900.000, 6000.000, 5500.000, 2, NULL, 'N', '', '5', NULL, 1, '2021-09-10 15:02:38', NULL, 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (38, 6, '124', '开发电脑', NULL, '', '', 4900.000, 6000.000, 5500.000, 2, NULL, 'N', '', '5', NULL, 1, '2021-09-10 15:34:03', NULL, 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (39, 6, '2341', '开发电脑', NULL, '', '', 4800.000, 6000.000, 5400.000, 2, NULL, 'Y', '', '5', 103, 1, NULL, '2020-09-07', 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (40, 6, '1234213', '开发电脑', NULL, '', '', 4800.000, 6000.000, 5400.000, 2, NULL, 'N', '', '5', NULL, NULL, NULL, NULL, 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (41, 6, '42134', '开发电脑', NULL, '', '', 1500.000, 5000.000, 1500.000, 2, NULL, 'N', '', '5', 105, 1, '2021-03-08 00:00:00', NULL, 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (42, 6, '2134324', '开发电脑', NULL, '', '', 4000.000, 6000.000, 4000.000, 1, NULL, 'Y', '', '5', 102, NULL, NULL, '2021-03-09', 'admin', '2021-03-08 14:32:32', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (43, 6, '2213763', '开发电脑', NULL, '', '', 4000.000, 6000.000, 4000.000, 1, NULL, 'Y', '', '5', 102, NULL, NULL, NULL, 'admin', '2021-03-08 14:34:17', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (44, 8, 'dyj-023414', '激光打印机', '激光打印机', NULL, NULL, 6500.000, 24.000, 234.000, 2, 9, 'N', '234', '5', 104, 1, '2021-03-31 00:00:00', NULL, 'admin', '2021-03-08 14:48:17', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (45, 12, 'car201603', '红旗轿车', NULL, NULL, NULL, 250000.000, 0.000, 0.000, 1, 13, 'N', NULL, '5', 108, 1, '2021-04-13 00:00:00', NULL, 'admin', '2021-04-13 15:28:38', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (47, 7, '324324', '台式机', 'I5 8G', '', '', 3688.000, 0.000, 3688.000, 1, NULL, 'N', NULL, '5', 104, 3, NULL, NULL, 'admin', '2021-09-13 17:54:27', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (48, 7, '56123541', '台式机', 'I5 8G', '', '', 3688.000, 0.000, 3688.000, 1, NULL, 'N', NULL, '5', 103, 1, NULL, NULL, 'admin', '2021-09-13 17:55:09', 'admin', '2021-12-29 17:18:00');
INSERT INTO `asset_info` VALUES (49, 7, '563323541', '台式机', 'I5 8G', '', '', 3688.000, 0.000, 3688.000, 1, NULL, 'N', NULL, '5', 105, NULL, NULL, NULL, 'admin', '2021-09-13 17:55:28', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (50, 7, '34324123', '台式机', 'I5 8G', '', '', 3688.000, 0.000, 3688.000, 1, NULL, 'N', NULL, '5', 103, NULL, NULL, NULL, 'admin', '2021-09-14 15:55:58', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (51, 7, '3333333', '台式机', 'I5 8G', '3', '34', 3688.000, 4333.000, 3688.000, 1, 14, 'N', NULL, '5', 103, NULL, NULL, NULL, 'admin', '2021-09-14 15:59:04', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (52, 6, '0000000', '00000000', NULL, '00000000000', '0000000000', 0.000, 0.000, 0.000, 2, NULL, 'N', NULL, '5', 103, NULL, NULL, NULL, 'admin', '2021-10-15 09:05:37', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (53, 9, '10001', '大雄路由', '123456', '大雄有限公司', '淘宝', 280.000, 500.000, 300.000, 1, NULL, 'Y', NULL, '5', 103, 0, '2021-10-20 16:28:05', NULL, 'admin', '2021-10-20 16:04:51', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (54, 9, '10002', '大雄路由', '123456', '大雄有限公司', '淘宝', 100.000, 500.000, 300.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, '2021-10-23', 'admin', '2021-10-20 16:04:51', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (55, 9, '10003', '大雄路由', '123456', '大雄有限公司', '淘宝', 300.000, 500.000, 300.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-10-20 16:08:56', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (56, 9, '10004', '大雄路由', '123456', '大雄有限公司', '淘宝', 300.000, 500.000, 300.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-10-20 16:08:56', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (57, 9, '10005', '大雄路由', '123456', '大雄有限公司', '淘宝', 300.000, 500.000, 300.000, 1, NULL, 'N', NULL, '5', 100, NULL, NULL, NULL, 'admin', '2021-10-20 16:08:56', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (58, 9, '10006', '大雄路由', '123456', '大雄有限公司', '淘宝', 300.000, 500.000, 300.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-10-20 16:08:56', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (61, 9, '10009', '大雄路由', '123456', '大雄有限公司', '淘宝', 300.000, 500.000, 300.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-10-20 16:08:56', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (62, 9, '10010', '大雄路由', '123456', '大雄有限公司', '淘宝', 300.000, 500.000, 300.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-10-20 16:08:56', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (63, 6, '555', '66', NULL, 's\'s', NULL, 5.000, 0.000, 0.000, 1, NULL, 'Y', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-10-26 15:53:43', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (64, 15, '1001', '金士顿', '16G', '金士顿旗舰店', '天猫', 180.000, 200.000, 180.000, 1, NULL, 'N', NULL, '5', NULL, 0, '2021-10-26 16:04:03', NULL, 'admin', '2021-10-26 15:56:30', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (65, 15, '1002', '金士顿', '16G', '金士顿旗舰店', '天猫', 180.000, 200.000, 180.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-10-26 15:56:30', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (66, 6, '123', '11', '11', '111', '111', 12.000, 12.000, 12.000, 1, NULL, 'N', NULL, '5', NULL, NULL, NULL, NULL, 'admin', '2021-11-04 14:03:35', NULL, '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (67, 8, '121431', '富士', '1231', NULL, NULL, 132.000, 123.000, 132.000, 2, NULL, 'N', NULL, '5', NULL, 0, '2021-11-30 21:09:43', NULL, 'admin', '2021-11-04 16:22:53', 'admin', '2021-12-17 16:54:11');
INSERT INTO `asset_info` VALUES (68, 8, '21431123', '富士', '1231', NULL, NULL, 123.000, 122.000, 123.000, 1, NULL, 'N', NULL, '5', 113, 0, '2021-11-30 21:09:23', NULL, 'admin', '2021-11-04 16:23:53', NULL, '2022-01-13 17:18:04');
INSERT INTO `asset_info` VALUES (69, 8, '0000098', '富士', '1231', NULL, NULL, 16.000, 12.000, 12.000, 1, NULL, 'Y', NULL, '5', 102, NULL, NULL, NULL, 'admin', '2021-11-04 16:24:27', 'admin', '2022-01-13 17:19:59');
INSERT INTO `asset_info` VALUES (70, 0, '123456789', 'CS', NULL, NULL, NULL, 0.000, 0.000, 0.000, 1, NULL, 'Y', NULL, '1', 100, NULL, NULL, NULL, 'admin', '2021-12-17 16:29:54', NULL, NULL);
INSERT INTO `asset_info` VALUES (71, 0, '123456789', 'cs1', NULL, 'cs', NULL, 9999.000, 0.000, 0.000, 1, NULL, 'Y', NULL, '1', 100, NULL, NULL, NULL, 'admin', '2021-12-17 16:34:07', NULL, NULL);
INSERT INTO `asset_info` VALUES (72, 0, 'H110', '电脑', '阿大声道', '商文', '啊实打实大大', 9999.000, 9998.000, 9999.000, 2, NULL, 'Y', NULL, '1', 100, NULL, NULL, NULL, 'admin', '2021-12-17 16:38:00', NULL, NULL);
INSERT INTO `asset_info` VALUES (73, 7, '12431234', '231421343214', NULL, NULL, NULL, 33.000, 0.000, 0.000, 1, NULL, 'N', NULL, '2', NULL, 7, '2022-03-31 00:00:00', NULL, 'admin', '2022-03-09 13:52:27', NULL, NULL);
INSERT INTO `asset_info` VALUES (74, 7, 'ZC-2022-03-0001', '联想', '341234', NULL, NULL, 54.000, 453.000, 54.000, 1, NULL, 'N', NULL, '1', NULL, NULL, NULL, NULL, 'tom', '2022-03-09 14:52:43', NULL, NULL);
INSERT INTO `asset_info` VALUES (75, 7, 'ZC-2022-03-0002', '联想', '341234', NULL, NULL, 54.000, 453.000, 54.000, 1, NULL, 'N', NULL, '1', NULL, NULL, NULL, NULL, 'tom', '2022-03-09 14:52:43', NULL, NULL);
INSERT INTO `asset_info` VALUES (76, 7, 'ZC-2022-03-0003', '联想', '341234', NULL, NULL, 324.000, 4234.000, 324.000, 1, NULL, 'N', NULL, '1', NULL, NULL, NULL, NULL, 'tom', '2022-03-09 14:53:45', NULL, NULL);

-- ----------------------------
-- Table structure for asset_it
-- ----------------------------
DROP TABLE IF EXISTS `asset_it`;
CREATE TABLE `asset_it`  (
  `asset_id` int(11) NOT NULL COMMENT '资产ID',
  `is_online` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否在线',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `mac` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MAC地址',
  `gateway` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关',
  `last_time` datetime NULL DEFAULT NULL COMMENT '最后在线时间',
  PRIMARY KEY (`asset_id`) USING BTREE,
  UNIQUE INDEX `ip`(`ip`) USING BTREE COMMENT 'IP不能重复'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '使用申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_it
-- ----------------------------
INSERT INTO `asset_it` VALUES (39, 'N', '192.168.1.66', NULL, '192.168.1.2', '2021-09-17 15:21:00');
INSERT INTO `asset_it` VALUES (42, 'N', '192.168.1.100', NULL, NULL, NULL);
INSERT INTO `asset_it` VALUES (43, 'N', '192.168.1.77', NULL, '192.168.1.2', '2021-09-08 09:57:01');
INSERT INTO `asset_it` VALUES (53, 'N', NULL, NULL, NULL, NULL);
INSERT INTO `asset_it` VALUES (63, 'N', NULL, NULL, NULL, NULL);
INSERT INTO `asset_it` VALUES (69, 'N', NULL, NULL, NULL, NULL);
INSERT INTO `asset_it` VALUES (70, 'N', NULL, NULL, NULL, NULL);
INSERT INTO `asset_it` VALUES (71, 'N', NULL, NULL, NULL, NULL);
INSERT INTO `asset_it` VALUES (72, 'N', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for asset_maintain
-- ----------------------------
DROP TABLE IF EXISTS `asset_maintain`;
CREATE TABLE `asset_maintain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `asset_id` int(11) NOT NULL COMMENT '资产ID',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '维护类型',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维护原由',
  `check_user_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `check_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核不通过原因',
  `master_user_id` int(11) NULL DEFAULT NULL COMMENT '负责人',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `is_complete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否完成',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '维修费用',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '维修说明',
  `result` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修结果',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资产维护' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_maintain
-- ----------------------------
INSERT INTO `asset_maintain` VALUES (1, 6, 39, '1', '543523454', 1, '1', '2021-03-10 17:19:37', NULL, 1, '2021-03-09 00:00:00', '2021-03-11 00:00:00', 'admin', 'N', 345432.00, '<p>asdfasdfdsaf</p>', '5', '2021-03-09 14:32:49', 'admin', '2021-03-09 16:24:59');
INSERT INTO `asset_maintain` VALUES (2, 7, 47, '1', 'afdasfds', 1, '1', NULL, NULL, 1, NULL, NULL, 'admin', 'N', NULL, NULL, NULL, '2021-09-14 16:49:04', NULL, NULL);
INSERT INTO `asset_maintain` VALUES (3, 7, 50, '2', 'dafsads', NULL, NULL, NULL, NULL, NULL, '2021-09-14 00:00:00', '2021-09-17 00:00:00', 'admin', 'Y', NULL, 'adsf333', '1', '2021-09-14 17:08:02', 'admin', '2021-09-15 14:39:55');
INSERT INTO `asset_maintain` VALUES (4, 7, 73, '1', '12342314', 1, '1', '2022-03-09 14:00:27', NULL, 2, '2022-03-08 00:00:00', '2022-03-23 00:00:00', 'tom', 'N', 34.00, '<p>32143214</p>', '1', '2022-03-09 13:56:26', 'ry', '2022-03-09 14:00:38');

-- ----------------------------
-- Table structure for asset_material
-- ----------------------------
DROP TABLE IF EXISTS `asset_material`;
CREATE TABLE `asset_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  `factory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商',
  `proxy` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买渠道',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计量单位',
  `amount` float(10, 3) NOT NULL COMMENT '库存数量',
  `price1` float(10, 3) NULL DEFAULT NULL COMMENT '市场价格',
  `price2` float(10, 3) NULL DEFAULT NULL COMMENT '购买价格',
  `house_id` int(11) NULL DEFAULT NULL COMMENT '仓库',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '耗材说明',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '耗材状态',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '耗材信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_material
-- ----------------------------
INSERT INTO `asset_material` VALUES (1, 11, '圆珠笔', '无', '4324', '2343', '只', 1.000, 3.000, 2.000, 2, NULL, '1', 'admin', '2021-03-08 10:28:11', 'admin', '2021-03-08 13:40:57');
INSERT INTO `asset_material` VALUES (2, 11, '中性笔', NULL, '4324', '2343', '只', 34.000, 3.000, 2.000, 2, '', '1', 'admin', '2021-03-08 15:29:09', 'admin', '2021-04-14 11:18:25');
INSERT INTO `asset_material` VALUES (3, 11, '圆珠笔', '无', NULL, NULL, NULL, 265.000, 3.000, 2.000, 2, NULL, '1', 'admin', '2021-05-08 17:21:44', NULL, NULL);
INSERT INTO `asset_material` VALUES (4, 11, '圆珠笔', '无', NULL, NULL, NULL, 700.000, 3.000, 2.000, 1, NULL, '1', 'admin', '2021-05-08 17:21:56', NULL, NULL);
INSERT INTO `asset_material` VALUES (5, 11, '123', '123', NULL, NULL, NULL, 1.000, 100.000, 100.000, 1, NULL, '1', 'admin', '2021-11-06 16:02:42', NULL, NULL);
INSERT INTO `asset_material` VALUES (6, 11, '123', NULL, NULL, NULL, '1', 1.000, NULL, 1.000, 1, NULL, '1', 'admin', '2021-11-06 16:03:57', NULL, NULL);
INSERT INTO `asset_material` VALUES (7, 3, '214213', NULL, NULL, NULL, '克', 40.000, NULL, 3.000, 1, NULL, '1', 'admin', '2022-03-09 13:54:22', NULL, NULL);

-- ----------------------------
-- Table structure for asset_pickup
-- ----------------------------
DROP TABLE IF EXISTS `asset_pickup`;
CREATE TABLE `asset_pickup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `material_id` int(11) NOT NULL COMMENT '耗材ID',
  `apply_user_id` int(11) NULL DEFAULT NULL COMMENT '申请人',
  `amount` float(10, 3) NOT NULL COMMENT '领用数量',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请原由',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请说明',
  `check_user_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `check_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核不通过原因',
  `is_delivery` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否出库',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '耗材领用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_pickup
-- ----------------------------
INSERT INTO `asset_pickup` VALUES (1, 11, 1, 1, 1.000, '1', NULL, 1, '1', '2021-03-09 09:33:32', NULL, 'Y', 'admin', '2021-03-08 19:53:59', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (2, 11, 2, 1, 1.000, 'asfsdafdas', '233', 1, '1', '2021-03-25 15:17:56', NULL, 'Y', 'admin', '2021-03-25 15:17:45', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (3, 8, 1, 1, 1.000, '141324', NULL, 1, '1', '2021-03-25 15:24:01', NULL, 'Y', 'admin', '2021-03-25 15:23:56', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (4, 11, 2, 1, 2.000, '21341234', NULL, NULL, '1', NULL, NULL, 'Y', 'admin', '2021-03-25 15:25:09', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (5, 11, 1, 1, 3.000, '324324', '34324', 1, '1', '2021-10-20 17:07:26', '1412343214', 'Y', 'admin', '2021-09-01 11:34:06', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (6, 11, 2, 1, 1.000, '333', '代申请', 1, '1', '2021-09-11 11:27:55', NULL, 'Y', 'admin', '2021-09-11 11:27:55', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (7, 11, 2, 1, 3.000, 'test', NULL, 1, '1', '2021-09-22 17:13:28', NULL, 'Y', 'admin', '2021-09-22 17:08:30', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (8, 0, 1, 1, 1.000, '已用完', NULL, NULL, '0', NULL, NULL, 'Y', 'admin', '2021-10-19 13:10:02', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (9, 11, 2, 1, 12.000, '111', '111', 1, '1', '2021-10-26 14:03:38', NULL, 'Y', 'admin', '2021-10-26 14:01:44', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (10, 0, 2, 1, 1.000, '1', NULL, NULL, '0', NULL, NULL, 'N', 'admin', '2021-11-04 16:16:15', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (11, 11, 3, 1, 11.000, '11', '11', 1, '1', '2021-11-08 18:27:33', NULL, 'Y', 'admin', '2021-11-08 18:26:27', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (12, 11, 3, 1, 12.000, '1212', NULL, 1, '1', '2021-11-09 14:10:01', NULL, 'Y', 'admin', '2021-11-09 14:09:30', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (13, 11, 3, 1, 12.000, '12', NULL, 1, '1', '2021-11-11 21:04:49', NULL, 'Y', 'admin', '2021-11-09 15:35:28', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (14, 11, 1, 3, 2.000, 'DDF', NULL, 1, '1', '2021-11-26 10:09:08', NULL, 'Y', 'admin', '2021-11-12 10:43:23', 'admin', '2021-11-26 10:06:26');
INSERT INTO `asset_pickup` VALUES (15, 3, 7, 7, 3.000, '2314', '1234', 1, '1', '2022-03-09 13:54:52', NULL, 'Y', 'tom', '2022-03-09 13:54:33', NULL, NULL);
INSERT INTO `asset_pickup` VALUES (16, 3, 7, 2, 4.000, '4325345', NULL, NULL, '0', NULL, NULL, 'N', 'ry', '2022-03-09 14:00:49', NULL, NULL);

-- ----------------------------
-- Table structure for asset_purchase
-- ----------------------------
DROP TABLE IF EXISTS `asset_purchase`;
CREATE TABLE `asset_purchase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数要求',
  `factory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商',
  `proxy` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买渠道',
  `amount` float(10, 3) NOT NULL COMMENT '购买数量',
  `price1` float(10, 3) NULL DEFAULT NULL COMMENT '市场价格',
  `price2` float(10, 3) NULL DEFAULT NULL COMMENT '购买价格',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请原由',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请说明',
  `check_user_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `check_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核不通过原因',
  `master_user_id` int(11) NULL DEFAULT NULL COMMENT '采购负责人',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `is_complete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否完成',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_purchase
-- ----------------------------
INSERT INTO `asset_purchase` VALUES (1, 6, '开发电脑', 'I5 8G 500SSD', NULL, NULL, 1.000, NULL, NULL, '开发使用', NULL, 1, '1', '2021-03-08 10:07:34', NULL, 1, '2021-03-08 10:07:34', 'Y', 'admin', '2021-03-05 10:04:59', 'admin', '2021-03-05 11:51:04');
INSERT INTO `asset_purchase` VALUES (2, 11, '圆珠笔', '无', NULL, NULL, 100.000, 3.000, 2.000, '234234', NULL, 1, '1', '2021-03-08 10:07:34', NULL, 1, '2021-05-08 17:21:56', 'Y', 'admin', '2021-03-08 10:23:32', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (3, 7, '台式机', 'I5 8G', '', '', 3.000, NULL, 3688.000, '研发需要', '', NULL, '1', NULL, NULL, 1, '2021-09-14 15:59:04', 'Y', 'admin', '2021-09-13 16:12:06', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (4, 9, '大雄路由', '123456', '大雄有限公司', '淘宝', 10.000, 500.000, 300.000, '需要', NULL, NULL, '1', NULL, NULL, 1, '2021-10-20 16:08:56', 'Y', 'admin', '2021-10-20 11:47:14', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (7, 15, '金士顿', '16G', '金士顿旗舰店', '天猫', 2.000, 200.000, 180.000, '11', NULL, 1, '1', '2021-10-26 15:48:40', NULL, 1, '2021-10-26 15:56:30', 'Y', 'admin', '2021-10-26 15:48:17', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (8, 6, '11', '11', '111', '111', 1.000, 12.000, 12.000, '11', NULL, 1, '1', '2021-10-26 15:50:39', NULL, 1, '2021-11-04 14:03:35', 'Y', 'admin', '2021-10-26 15:50:11', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (9, 8, '富士', '1231', NULL, NULL, 12.000, NULL, NULL, '坏了', NULL, 1, '1', '2021-11-04 16:21:34', NULL, 1, '2021-11-04 00:00:00', 'N', 'admin', '2021-11-04 15:26:19', 'admin', '2021-11-04 16:05:45');
INSERT INTO `asset_purchase` VALUES (10, 11, '123', '123', NULL, NULL, 100.000, NULL, 10.000, '123', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'N', 'admin', '2021-11-06 15:58:00', 'admin', '2021-11-11 02:10:07');
INSERT INTO `asset_purchase` VALUES (11, 11, '123', '123', NULL, NULL, 1.000, NULL, NULL, '123', NULL, NULL, '1', NULL, NULL, NULL, '2021-11-06 16:02:42', 'Y', 'admin', '2021-11-06 16:00:51', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (12, 0, '笔记本', '1', '1', '1', 1.000, 1.000, 1.000, '1', '1', NULL, '0', NULL, NULL, NULL, NULL, 'N', 'admin', '2021-11-08 09:58:06', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (13, 0, 's', 'qqq', 'qwd', '312', 12.000, 123.000, 132.000, '312', '132', NULL, '0', NULL, NULL, NULL, NULL, 'N', 'admin', '2021-11-08 09:58:43', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (14, 15, '你发电机', '圣诞节昆南贾', '发卡十多年', '房间数当你', 1.000, 10.000, NULL, '12341234', '1234', 1, '1', '2022-01-24 16:34:50', NULL, 7, '2022-01-18 00:00:00', 'N', 'admin', '2021-11-08 16:26:36', 'admin', '2021-11-11 02:33:55');
INSERT INTO `asset_purchase` VALUES (15, 0, '交换机', '5130', 'H3C', NULL, 10.000, NULL, NULL, '测试', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'N', 'admin', '2021-12-18 22:32:06', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (16, 10, '戴尔笔记本', '酷睿i11', NULL, NULL, 10.000, 4500.000, 4300.000, '办公使用', NULL, 1, '1', '2022-01-24 16:34:31', NULL, 7, '2022-01-23 00:00:00', 'N', 'admin', '2021-12-28 18:05:01', 'admin', '2021-12-28 18:05:22');
INSERT INTO `asset_purchase` VALUES (17, 7, '123', '123', NULL, NULL, 123.000, NULL, NULL, '123', NULL, 1, '1', '2022-01-13 17:39:57', NULL, 1, '2022-01-13 00:00:00', 'N', 'admin', '2022-01-03 19:28:07', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (18, 0, '111', '42', NULL, NULL, 1.000, NULL, NULL, '12', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'N', 'admin', '2022-01-13 17:39:36', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (19, 3, '金箍棒', '结实', '花果山', '东海龙宫', 1.000, 439999.000, 999.000, '需要兵器', '没说明', 1, '1', '2022-01-19 16:06:17', NULL, 1, '2022-01-19 00:00:00', 'N', 'tom', '2022-01-19 16:02:17', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (20, 10, '123', '444444', '23423', '23', 3.000, 123.000, 123.000, '2344', '2323', 1, '1', '2022-01-24 09:18:03', NULL, 1, '2022-01-24 00:00:00', 'N', 'admin', '2022-01-24 09:02:36', NULL, NULL);
INSERT INTO `asset_purchase` VALUES (21, 7, '联想', '341234', NULL, NULL, 3.000, NULL, NULL, '434', NULL, 1, '1', '2022-03-09 14:03:34', NULL, 7, '2022-03-09 14:53:45', 'Y', 'ry', '2022-03-09 14:01:30', NULL, NULL);

-- ----------------------------
-- Table structure for asset_sales
-- ----------------------------
DROP TABLE IF EXISTS `asset_sales`;
CREATE TABLE `asset_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `material_id` int(11) NULL DEFAULT NULL COMMENT '耗材ID',
  `asset_id` int(11) NULL DEFAULT NULL COMMENT '资产ID',
  `aptitude_id` int(11) NULL DEFAULT NULL COMMENT '无形资产ID',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '租售类型',
  `amount` float(10, 3) NOT NULL COMMENT '数量',
  `price` float(10, 3) NOT NULL COMMENT '总价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租售原由',
  `master_user_id` int(11) NULL DEFAULT NULL COMMENT '负责人',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `is_complete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否完成',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资产租售' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_sales
-- ----------------------------
INSERT INTO `asset_sales` VALUES (1, 6, NULL, 34, NULL, '1', 1.000, 340.000, '234234', 1, NULL, NULL, 'admin', 'Y', '2021-03-09 11:40:01', NULL, NULL);
INSERT INTO `asset_sales` VALUES (2, 11, 1, NULL, NULL, '2', 40.000, 600.000, '34214324', NULL, NULL, NULL, 'admin', 'N', '2021-03-09 11:42:01', NULL, NULL);
INSERT INTO `asset_sales` VALUES (3, 13, NULL, NULL, 1, '1', 1.000, 341.000, '2342314', 1, '2021-03-08 00:00:00', '2021-03-12 00:00:00', 'admin', 'N', '2021-03-09 13:37:17', 'admin', '2021-03-09 13:49:07');
INSERT INTO `asset_sales` VALUES (4, 8, NULL, 69, NULL, '2', 1.000, 1231.000, '123', NULL, NULL, NULL, 'admin', 'N', '2021-11-04 16:58:34', NULL, NULL);

-- ----------------------------
-- Table structure for asset_stock
-- ----------------------------
DROP TABLE IF EXISTS `asset_stock`;
CREATE TABLE `asset_stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `year` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年度',
  `worth` float(10, 2) NULL DEFAULT 0.00 COMMENT '资产总值',
  `asset_count` int(11) NULL DEFAULT NULL COMMENT '固定资产总数',
  `asset_worth` float(10, 2) NULL DEFAULT 0.00 COMMENT '固定资产总值',
  `material_count` int(11) NULL DEFAULT 0 COMMENT '耗材总类',
  `material_worth` float(10, 2) NULL DEFAULT NULL COMMENT '耗材资产总值',
  `scrap_count` int(11) NULL DEFAULT NULL COMMENT '报废资产总数',
  `scrap_worth` int(11) NULL DEFAULT NULL COMMENT '报废资产总值',
  `maintain_count` int(11) NULL DEFAULT NULL COMMENT '资产维护次数',
  `purchase_count` int(11) NULL DEFAULT 1 COMMENT '采购次数',
  `purchase_worth` float(10, 2) NULL DEFAULT NULL COMMENT '采购总值',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '盘点说明',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `year`(`year`) USING BTREE COMMENT '一年一盘点'
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资产盘点' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_stock
-- ----------------------------
INSERT INTO `asset_stock` VALUES (1, '2020', 36358.00, 9, 32300.00, 2, 3358.00, 34, 4800, 34, 5, 12341.00, NULL, 'admin', '2021-03-10 14:54:34', 'admin', '2021-03-11 16:44:59');
INSERT INTO `asset_stock` VALUES (3, '2021', 22099.00, 3, 19998.00, 6, 2101.00, 2, 4100, 1, 5, 712.00, '摇铃的', 'admin', '2021-03-10 15:41:13', 'admin', '2021-03-11 16:22:36');
INSERT INTO `asset_stock` VALUES (4, '2019', 34358.00, 9, 33300.00, 2, 5843.00, 4, 435, 56, 34, 45432.00, NULL, 'admin', '2021-03-11 15:31:15', 'admin', '2021-03-11 16:44:45');
INSERT INTO `asset_stock` VALUES (5, '2018', 284016.00, 8, 281900.00, 4, 2116.00, 0, NULL, 0, 0, NULL, '234', 'admin', '2021-05-22 10:51:21', NULL, NULL);
INSERT INTO `asset_stock` VALUES (6, '2022', 22099.00, 3, 19998.00, 6, 2101.00, 0, NULL, 0, 2, 439999.00, NULL, 'admin', '2021-10-20 16:58:56', NULL, NULL);
INSERT INTO `asset_stock` VALUES (7, '2023', 300844.00, 20, 298740.00, 4, 2104.00, 0, NULL, 0, 0, NULL, NULL, 'admin', '2021-10-20 16:59:45', NULL, NULL);

-- ----------------------------
-- Table structure for asset_taking
-- ----------------------------
DROP TABLE IF EXISTS `asset_taking`;
CREATE TABLE `asset_taking`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `asset_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产名',
  `material_id` int(11) NULL DEFAULT NULL COMMENT '耗材ID',
  `asset_id` int(11) NULL DEFAULT NULL COMMENT '资产ID',
  `amount` float(10, 3) NULL DEFAULT NULL COMMENT '出库数量',
  `house_id` int(11) NULL DEFAULT NULL COMMENT '仓库',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '使用人',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '使用部门',
  `img_id` int(11) NULL DEFAULT NULL COMMENT '确认单',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点说明',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资产盘点' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_taking
-- ----------------------------
INSERT INTO `asset_taking` VALUES (30, 6, '开发电脑', NULL, 34, NULL, 1, NULL, 100, NULL, '5', NULL, 'admin', '2021-10-26 17:27:25', NULL, NULL);
INSERT INTO `asset_taking` VALUES (31, 15, '金士顿', NULL, 64, NULL, 1, 0, NULL, NULL, '5', NULL, 'admin', '2021-10-26 17:28:09', NULL, NULL);
INSERT INTO `asset_taking` VALUES (32, 8, '富士', NULL, 69, NULL, 2, NULL, 105, NULL, '6', NULL, 'admin', '2021-11-08 16:29:43', NULL, NULL);
INSERT INTO `asset_taking` VALUES (33, 8, '富士', NULL, 69, NULL, 2, NULL, 105, NULL, '6', NULL, 'admin', '2021-11-11 21:06:57', NULL, NULL);
INSERT INTO `asset_taking` VALUES (34, 7, '台式机', NULL, 47, NULL, 1, 3, 104, NULL, '2', NULL, 'admin', '2021-11-11 21:09:19', NULL, NULL);
INSERT INTO `asset_taking` VALUES (35, 7, '台式机', NULL, 48, NULL, 1, 1, 103, NULL, '5', NULL, 'admin', '2021-12-29 17:18:00', NULL, NULL);
INSERT INTO `asset_taking` VALUES (36, 8, '富士', NULL, 69, NULL, 1, NULL, 100, NULL, '5', NULL, 'admin', '2022-01-05 15:26:36', NULL, NULL);

-- ----------------------------
-- Table structure for asset_use
-- ----------------------------
DROP TABLE IF EXISTS `asset_use`;
CREATE TABLE `asset_use`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `cate_id` int(11) NOT NULL COMMENT '资产分类',
  `apply_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '申请人ID',
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数要求',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请原由',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请说明',
  `check_user_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `check_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核不通过原因',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `asset_id` int(11) NULL DEFAULT NULL COMMENT '资产ID',
  `is_delivery` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否出库',
  `is_revert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否归还',
  `revert_time` datetime NULL DEFAULT NULL COMMENT '归还时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '使用申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_use
-- ----------------------------
INSERT INTO `asset_use` VALUES (4, 6, 1, 'asdfadsf', '43241234', '34214324', 1, '1', '2021-09-10 15:02:38', NULL, '2021-09-10 00:00:00', '2022-09-23 00:00:00', 38, 'Y', 'Y', '2021-09-10 15:34:03', 'admin', '2021-09-09 16:41:21', NULL, NULL);
INSERT INTO `asset_use` VALUES (5, 7, 3, 'afd', '34', NULL, 1, '1', '2021-10-15 16:47:05', NULL, NULL, NULL, 47, 'Y', 'N', NULL, 'test', '2021-09-16 15:17:01', NULL, NULL);
INSERT INTO `asset_use` VALUES (6, 6, 4, '16G内存', '办公使用', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'ee', '2021-09-22 17:17:51', NULL, NULL);
INSERT INTO `asset_use` VALUES (7, 9, 1, '12345', '需要', '111', 1, '1', '2021-10-20 16:12:04', NULL, '2021-10-20 00:00:00', '2021-10-30 00:00:00', 53, 'Y', 'Y', '2021-10-20 16:28:05', 'admin', '2021-10-20 16:09:55', NULL, NULL);
INSERT INTO `asset_use` VALUES (8, 12, 1, '111', '11', '111', 1, '1', '2021-10-26 14:42:43', NULL, '2021-10-26 00:00:00', NULL, 45, 'Y', 'N', NULL, 'admin', '2021-10-26 14:42:00', NULL, NULL);
INSERT INTO `asset_use` VALUES (9, 7, 1, '111', '111', '12', 1, '1', '2021-10-26 14:49:21', NULL, '2021-10-26 00:00:00', NULL, 48, 'Y', 'N', NULL, 'admin', '2021-10-26 14:48:38', NULL, NULL);
INSERT INTO `asset_use` VALUES (10, 15, 1, '16G', '11', NULL, 1, '1', '2021-10-26 16:03:45', NULL, NULL, NULL, 64, 'Y', 'Y', '2021-10-26 16:04:03', 'admin', '2021-10-26 16:03:24', NULL, NULL);
INSERT INTO `asset_use` VALUES (11, 8, 1, '32', '1', NULL, 1, '1', '2021-11-04 16:46:24', NULL, '2021-11-03 00:00:00', '2021-11-12 00:00:00', 67, 'Y', 'Y', '2021-11-30 21:09:43', 'admin', '2021-11-04 15:29:46', 'admin', '2021-11-04 15:29:57');
INSERT INTO `asset_use` VALUES (12, 7, 1, '12', '21', '执照', 1, '0', '2021-12-29 08:25:15', NULL, '2021-11-24 00:00:00', '2021-11-23 00:00:00', NULL, 'N', 'N', NULL, 'admin', '2021-11-08 09:59:52', NULL, NULL);
INSERT INTO `asset_use` VALUES (13, 9, 1, '123', '123', '123', 1, '2', '2021-12-29 08:25:10', NULL, '2021-11-08 00:00:00', '2021-11-10 00:00:00', NULL, 'N', 'N', NULL, 'admin', '2021-11-08 10:27:00', 'admin', '2021-11-11 15:18:10');
INSERT INTO `asset_use` VALUES (14, 6, 1, '112', '32', '123', 1, '1', '2021-11-09 10:56:22', NULL, NULL, NULL, 41, 'N', 'N', NULL, 'admin', '2021-11-09 10:55:51', NULL, NULL);
INSERT INTO `asset_use` VALUES (15, 6, 1, '12', '12', NULL, 1, '1', '2021-11-09 11:45:17', NULL, NULL, NULL, 38, 'N', 'N', NULL, 'admin', '2021-11-09 11:44:56', NULL, NULL);
INSERT INTO `asset_use` VALUES (16, 8, 1, '12312', '3123', NULL, 1, '1', '2021-11-09 15:23:51', NULL, NULL, NULL, 67, 'N', 'N', NULL, 'admin', '2021-11-09 15:14:46', NULL, NULL);
INSERT INTO `asset_use` VALUES (17, 0, 1, 'DFDF', 'EFE', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'admin', '2021-11-12 10:40:55', NULL, NULL);
INSERT INTO `asset_use` VALUES (18, 8, 1, '1020', 'XUY', NULL, 1, '1', '2021-11-28 22:34:24', NULL, NULL, NULL, 68, 'Y', 'Y', '2021-11-30 21:09:23', 'admin', '2021-11-12 10:43:01', 'admin', '2021-11-22 11:12:17');
INSERT INTO `asset_use` VALUES (19, 0, 1, 'test', 'test', NULL, NULL, '0', NULL, NULL, '2021-12-28 00:00:00', '2021-12-21 00:00:00', NULL, 'N', 'N', NULL, 'admin', '2021-12-21 13:43:40', NULL, NULL);
INSERT INTO `asset_use` VALUES (20, 7, 1, 'HP', '业务单据打印', '领导同意', NULL, '0', NULL, NULL, '2022-01-01 00:00:00', '2021-12-31 00:00:00', NULL, 'N', 'N', NULL, 'admin', '2021-12-31 16:03:52', NULL, NULL);
INSERT INTO `asset_use` VALUES (21, 6, 1, 'i7', '办公', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'admin', '2022-01-13 16:28:02', NULL, NULL);
INSERT INTO `asset_use` VALUES (22, 7, 7, '1241234', '32414', '333', 1, '1', '2022-03-09 13:52:40', NULL, '2022-03-09 00:00:00', '2022-03-31 00:00:00', 73, 'N', 'N', NULL, 'tom', '2022-03-09 13:51:54', NULL, NULL);

-- ----------------------------
-- Table structure for asset_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `asset_warehouse`;
CREATE TABLE `asset_warehouse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `master_user_id` int(11) NOT NULL COMMENT '负责人',
  `links` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库说明',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_warehouse
-- ----------------------------
INSERT INTO `asset_warehouse` VALUES (1, '大仓库', '一楼', 1, '222', '1', NULL, 'admin', '2021-03-05 16:02:17', NULL, NULL);
INSERT INTO `asset_warehouse` VALUES (2, '杂物间', '三楼', 1, '234123', '1', NULL, 'admin', '2021-03-05 16:04:31', 'admin', '2021-05-08 17:17:43');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_msg', '消息', NULL, NULL, 'SysMsg', 'crud', 'com.ruoyi.sys', 'sys', 'msg', '消息', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2\"}', 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53', NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_chart', '报表', NULL, NULL, 'SysChart', 'crud', 'com.ruoyi.sys', 'sys', 'chart', '报表管理', 'yepanpan', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_dataset', '数据集', NULL, NULL, 'SysDataset', 'crud', 'com.ruoyi.sys', 'sys', 'dataset', '数据集', 'yepanpan', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:25', NULL);
INSERT INTO `gen_table` VALUES (4, 'xdata_client', '应用', NULL, NULL, 'XdataClient', 'crud', 'com.ruoyi.sys', 'sys', 'client', '应用管理', 'yepanpan', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56', NULL);
INSERT INTO `gen_table` VALUES (5, 'xdata_model', '模型', NULL, NULL, 'XdataModel', 'crud', 'com.ruoyi.sys', 'sys', 'model', '模型管理', 'yepanpan', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:21', NULL);
INSERT INTO `gen_table` VALUES (6, 'xdata_pipe', '通道', NULL, NULL, 'XdataPipe', 'crud', 'com.ruoyi.sys', 'sys', 'pipe', '通道', 'yepanpan', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46', NULL);
INSERT INTO `gen_table` VALUES (7, 'asset_aptitude', '无形资产', NULL, NULL, 'AssetAptitude', 'crud', 'com.ruoyi.asset', 'asset', 'aptitude', '无形资产', 'yepanpan', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08', NULL);
INSERT INTO `gen_table` VALUES (8, 'asset_category', '资产分类', '', '', 'AssetCategory', 'tree', 'com.ruoyi.asset', 'asset', 'category', '资产分类', 'yepanpan', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"title\",\"treeParentCode\":\"pid\",\"parentMenuId\":\"2042\"}', 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:07', NULL);
INSERT INTO `gen_table` VALUES (9, 'asset_delivery', '出库', NULL, NULL, 'AssetDelivery', 'crud', 'com.ruoyi.asset', 'asset', 'delivery', '出库管理', 'yepanpan', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52', NULL);
INSERT INTO `gen_table` VALUES (10, 'asset_info', '资产信息', NULL, NULL, 'AssetInfo', 'crud', 'com.ruoyi.asset', 'asset', 'info', '资产信息', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41', NULL);
INSERT INTO `gen_table` VALUES (11, 'asset_material', '耗材信息', NULL, NULL, 'AssetMaterial', 'crud', 'com.ruoyi.asset', 'asset', 'material', '耗材信息', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14', NULL);
INSERT INTO `gen_table` VALUES (12, 'asset_pickup', '耗材领用', NULL, NULL, 'AssetPickup', 'crud', 'com.ruoyi.asset', 'asset', 'pickup', '耗材领用', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16', NULL);
INSERT INTO `gen_table` VALUES (13, 'asset_purchase', '采购申请', NULL, NULL, 'AssetPurchase', 'crud', 'com.ruoyi.asset', 'asset', 'purchase', '采购申请', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35', NULL);
INSERT INTO `gen_table` VALUES (14, 'asset_sales', '资产租售', NULL, NULL, 'AssetSales', 'crud', 'com.ruoyi.asset', 'asset', 'sales', '资产租售', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13', NULL);
INSERT INTO `gen_table` VALUES (15, 'asset_use', '使用申请', NULL, NULL, 'AssetUse', 'crud', 'com.ruoyi.asset', 'asset', 'use', '使用申请', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57', NULL);
INSERT INTO `gen_table` VALUES (16, 'asset_warehouse', '仓库', NULL, NULL, 'AssetWarehouse', 'crud', 'com.ruoyi.asset', 'asset', 'warehouse', '仓库', 'yepanpan', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23', NULL);
INSERT INTO `gen_table` VALUES (17, 'asset_entering', '入库', NULL, NULL, 'AssetEntering', 'crud', 'com.ruoyi.asset', 'asset', 'entering', '入库管理', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14', NULL);
INSERT INTO `gen_table` VALUES (18, 'asset_maintain', '资产维护', NULL, NULL, 'AssetMaintain', 'crud', 'com.ruoyi.asset', 'asset', 'maintain', '资产维护', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18', NULL);
INSERT INTO `gen_table` VALUES (19, 'asset_stock', '资产盘点', NULL, NULL, 'AssetStock', 'crud', 'com.ruoyi.asset', 'asset', 'stock', '资产统计', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16', NULL);
INSERT INTO `gen_table` VALUES (20, 'asset_taking', '资产盘点', NULL, NULL, 'AssetTaking', 'crud', 'com.ruoyi.asset', 'assets', 'taking', '资产盘点', 'yepanpan', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09', NULL);
INSERT INTO `gen_table` VALUES (21, 'asset_it', 'IT设备', NULL, NULL, 'AssetIt', 'crud', 'com.ruoyi.asset', 'asset', 'it', 'IT设备', 'yepanpan', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2021-09-07 15:42:28', '', '2021-09-07 15:45:16', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (2, '1', 'title', '标题', 'varchar(100)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (3, '1', 'content', '内容', 'varchar(255)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (4, '1', 'url', '链接', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (5, '1', 'type', '消息类型', 'varchar(1)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'ext_msg_type', 5, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (6, '1', 'add_time', '发送时间', 'datetime', 'Date', 'addTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (7, '1', 'add_user', '发信人', 'int(11)', 'Long', 'addUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (8, '1', 'add_user_name', '发信人姓名', 'varchar(255)', 'String', 'addUserName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (9, '1', 'to_user', '收信人', 'int(11)', 'Long', 'toUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (10, '1', 'to_user_name', '收信人姓名', 'varchar(50)', 'String', 'toUserName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 10, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (11, '1', 'read_time', '读取时间', 'datetime', 'Date', 'readTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2021-02-25 17:34:22', '', '2021-02-25 17:53:53');
INSERT INTO `gen_table_column` VALUES (12, '2', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (13, '2', 'type', '类型', 'varchar(10)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (14, '2', 'code', '代码', 'varchar(50)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (15, '2', 'title', '名称', 'varchar(100)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (16, '2', 'ds_id', '数据源', 'int(11)', 'Long', 'dsId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (17, '2', 'xaxis', '横向坐标', 'varchar(50)', 'String', 'xaxis', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (18, '2', 'yaxis', '纵向坐标', 'varchar(50)', 'String', 'yaxis', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (19, '2', 'comment', '说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (20, '2', 'list_sort', '排序', 'int(11)', 'Long', 'listSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (21, '2', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:54:57');
INSERT INTO `gen_table_column` VALUES (22, '3', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:25');
INSERT INTO `gen_table_column` VALUES (23, '3', 'type', '类型', 'char(10)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (24, '3', 'code', '代码', 'varchar(50)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (25, '3', 'title', '名称', 'varchar(100)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (26, '3', 'sqls', '查询SQL', 'text', 'String', 'sqls', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (27, '3', 'param', '参数', 'varchar(255)', 'String', 'param', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (28, '3', 'list_sort', '排序', 'int(11)', 'Long', 'listSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (29, '3', 'comment', '说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (30, '3', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2021-02-25 17:34:33', '', '2021-02-25 17:55:26');
INSERT INTO `gen_table_column` VALUES (31, '4', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (32, '4', 'title', '应用名称', 'varchar(10)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (33, '4', 'type', '类型', 'varchar(1)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (34, '4', 'code', '应用代码', 'varchar(32)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (35, '4', 'secret', '应用密钥', 'varchar(32)', 'String', 'secret', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (36, '4', 'url', '媒体附件', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (37, '4', 'icon', '图标', 'varchar(255)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (38, '4', 'db_type', '数据库类型', 'char(1)', 'String', 'dbType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (39, '4', 'jdbc', '数据连接', 'varchar(255)', 'String', 'jdbc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (40, '4', 'db_user', '数据库账号', 'varchar(50)', 'String', 'dbUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (41, '4', 'db_pass', '数据库密码', 'varchar(50)', 'String', 'dbPass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (42, '4', 'status', '状态', 'varchar(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:31:56');
INSERT INTO `gen_table_column` VALUES (43, '5', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:21');
INSERT INTO `gen_table_column` VALUES (44, '5', 'title', '模型名称', 'varchar(10)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:21');
INSERT INTO `gen_table_column` VALUES (45, '5', 'type', '类型', 'varchar(1)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:21');
INSERT INTO `gen_table_column` VALUES (46, '5', 'tables', '数据表', 'varchar(100)', 'String', 'tables', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:21');
INSERT INTO `gen_table_column` VALUES (47, '5', 'list_sort', '排序', 'int(11)', 'Long', 'listSort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:21');
INSERT INTO `gen_table_column` VALUES (48, '5', 'status', '状态', 'varchar(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:21');
INSERT INTO `gen_table_column` VALUES (49, '6', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (50, '6', 'client_id', '应用', 'int(11)', 'Long', 'clientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (51, '6', 'model_id', '模型名称', 'int(11)', 'Long', 'modelId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (52, '6', 'mode', '权限', 'varchar(1)', 'String', 'mode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (53, '6', 'read_sql', '读取操作', 'varchar(500)', 'String', 'readSql', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (54, '6', 'insert_sql', '新增操作', 'varchar(1000)', 'String', 'insertSql', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (55, '6', 'update_sql', '更新操作', 'varchar(1000)', 'String', 'updateSql', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (56, '6', 'del_sql', '删除操作', 'varchar(255)', 'String', 'delSql', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (57, '6', 'exist_sql', '查询操作', 'varchar(255)', 'String', 'existSql', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (58, '6', 'last_time', '上次同步时间', 'datetime', 'Date', 'lastTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (59, '6', 'last_result', '上次同步结果', 'int(11)', 'Long', 'lastResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (60, '6', 'list_sort', '优先级', 'int(11)', 'Long', 'listSort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (61, '6', 'status', '状态', 'varchar(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 13, 'admin', '2021-02-25 17:34:43', '', '2021-02-25 18:32:46');
INSERT INTO `gen_table_column` VALUES (62, '7', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (63, '7', 'name', '资产名', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (64, '7', 'img_id', '图片', 'int(11)', 'Long', 'imgId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 3, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (65, '7', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (66, '7', 'get_time', '获取时间', 'date', 'Date', 'getTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (67, '7', 'comment', '资产说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (68, '7', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (69, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (70, '7', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-04 20:21:47', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (71, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:26:08');
INSERT INTO `gen_table_column` VALUES (72, '8', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:07');
INSERT INTO `gen_table_column` VALUES (73, '8', 'title', '分类名称', 'varchar(100)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:07');
INSERT INTO `gen_table_column` VALUES (74, '8', 'pid', '上级', 'int(11)', 'Long', 'pid', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:07');
INSERT INTO `gen_table_column` VALUES (75, '8', 'type', '分类类别', 'char(1)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'cate_type', 4, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:07');
INSERT INTO `gen_table_column` VALUES (76, '8', 'list_sort', '排序', 'int(11)', 'Long', 'listSort', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:07');
INSERT INTO `gen_table_column` VALUES (77, '8', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'radio', 'ext_status', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:07');
INSERT INTO `gen_table_column` VALUES (78, '9', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (79, '9', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (80, '9', 'material_id', '耗材ID', 'int(11)', 'Long', 'materialId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (81, '9', 'asset_id', '资产ID', 'int(11)', 'Long', 'assetId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (82, '9', 'amount', '出库数量', 'float(10,3)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (83, '9', 'house_id', '仓库', 'int(11)', 'Long', 'houseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (84, '9', 'recv_user_id', '接收人', 'int(11)', 'Long', 'recvUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (85, '9', 'img_id', '确认单', 'int(11)', 'Long', 'imgId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (86, '9', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (87, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (88, '9', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (89, '9', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:29:52');
INSERT INTO `gen_table_column` VALUES (90, '10', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (91, '10', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (92, '10', 'num', '资产编号', 'varchar(200)', 'String', 'num', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (93, '10', 'name', '产品名称', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (95, '10', 'factory', '厂商', 'varchar(200)', 'String', 'factory', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (96, '10', 'proxy', '购买渠道', 'varchar(200)', 'String', 'proxy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (97, '10', 'price', '当前价值', 'float(10,3)', 'BigDecimal', 'price', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (98, '10', 'price1', '市场价格', 'float(10,3)', 'BigDecimal', 'price1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (99, '10', 'price2', '购买价格', 'float(10,3)', 'BigDecimal', 'price2', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (100, '10', 'house_id', '仓库', 'int(11)', 'Long', 'houseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (101, '10', 'img_id', '图例', 'int(11)', 'Long', 'imgId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 12, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (102, '10', 'comment', '资产说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (103, '10', 'status', '资产状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'asset_status', 14, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (104, '10', 'use_user_id', '使用人', 'int(11)', 'Long', 'useUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (105, '10', 'finish_time', '预计归还时间', 'datetime', 'Date', 'finishTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (106, '10', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (107, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (108, '10', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (109, '10', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (110, '11', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (111, '11', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (112, '11', 'name', '产品名称', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (114, '11', 'factory', '厂商', 'varchar(200)', 'String', 'factory', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (115, '11', 'proxy', '购买渠道', 'varchar(200)', 'String', 'proxy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (116, '11', 'unit', '计量单位', 'varchar(10)', 'String', 'unit', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (117, '11', 'amount', '库存数量', 'float(10,3)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (118, '11', 'price1', '市场价格', 'float(10,3)', 'BigDecimal', 'price1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (119, '11', 'price2', '购买价格', 'float(10,3)', 'BigDecimal', 'price2', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (120, '11', 'house_id', '仓库', 'int(11)', 'Long', 'houseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (121, '11', 'comment', '耗材说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (122, '11', 'status', '耗材状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'asset_status', 13, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (123, '11', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (124, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (125, '11', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (126, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (127, '12', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (128, '12', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (129, '12', 'material_id', '耗材ID', 'int(11)', 'Long', 'materialId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (130, '12', 'amount', '领用数量', 'float(10,3)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (131, '12', 'reason', '申请原由', 'varchar(200)', 'String', 'reason', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (132, '12', 'comment', '申请说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (133, '12', 'check_user_id', '审核人', 'int(11)', 'Long', 'checkUserId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (134, '12', 'check_status', '审核结果', 'char(1)', 'String', 'checkStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'check_status', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (135, '12', 'check_time', '审核时间', 'datetime', 'Date', 'checkTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (136, '12', 'check_reason', '审核不通过原因', 'varchar(200)', 'String', 'checkReason', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (137, '12', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (138, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (139, '12', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (140, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:58:16');
INSERT INTO `gen_table_column` VALUES (141, '13', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (142, '13', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (143, '13', 'name', '产品名称', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (145, '13', 'factory', '厂商', 'varchar(200)', 'String', 'factory', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (146, '13', 'proxy', '购买渠道', 'varchar(200)', 'String', 'proxy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (147, '13', 'amount', '购买数量', 'float(10,3)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (148, '13', 'price1', '市场价格', 'float(10,3)', 'BigDecimal', 'price1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (149, '13', 'price2', '购买价格', 'float(10,3)', 'BigDecimal', 'price2', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (150, '13', 'reason', '申请原由', 'varchar(200)', 'String', 'reason', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (151, '13', 'comment', '申请说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (152, '13', 'check_user_id', '审核人', 'int(11)', 'Long', 'checkUserId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (153, '13', 'check_status', '审核结果', 'char(1)', 'String', 'checkStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'check_status', 13, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (154, '13', 'check_time', '审核时间', 'datetime', 'Date', 'checkTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (155, '13', 'check_reason', '审核不通过原因', 'varchar(200)', 'String', 'checkReason', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (156, '13', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (157, '13', 'master_user_id', '采购负责人', 'int(11)', 'Long', 'masterUserId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (158, '13', 'finish_time', '完成时间', 'datetime', 'Date', 'finishTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (159, '13', 'is_complete', '是否完成', 'char(1)', 'String', 'isComplete', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (160, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (161, '13', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (162, '13', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (163, '14', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (164, '14', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (165, '14', 'material_id', '耗材ID', 'int(11)', 'Long', 'materialId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (166, '14', 'asset_id', '资产ID', 'int(11)', 'Long', 'assetId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (167, '14', 'type', '租售类型', 'char(1)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sales_type', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (168, '14', 'amount', '数量', 'float(10,3)', 'BigDecimal', 'amount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (169, '14', 'price', '总价', 'float(10,3)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (170, '14', 'reason', '租售原由', 'varchar(200)', 'String', 'reason', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (171, '14', 'master_user_id', '负责人', 'int(11)', 'Long', 'masterUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (172, '14', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (173, '14', 'finish_time', '完成时间', 'datetime', 'Date', 'finishTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (174, '14', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (175, '14', 'is_complete', '是否完成', 'char(1)', 'String', 'isComplete', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (176, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (177, '14', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (178, '14', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 08:55:13');
INSERT INTO `gen_table_column` VALUES (179, '15', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (180, '15', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (182, '15', 'reason', '申请原由', 'varchar(200)', 'String', 'reason', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (183, '15', 'comment', '申请说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (184, '15', 'check_user_id', '审核人', 'int(11)', 'Long', 'checkUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (185, '15', 'check_status', '审核结果', 'char(1)', 'String', 'checkStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'check_status', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (186, '15', 'check_time', '审核时间', 'datetime', 'Date', 'checkTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (187, '15', 'check_reason', '审核不通过原因', 'varchar(200)', 'String', 'checkReason', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (188, '15', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (189, '15', 'finish_time', '结束时间', 'datetime', 'Date', 'finishTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (190, '15', 'asset_id', '资产ID', 'int(11)', 'Long', 'assetId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (191, '15', 'is_revert', '是否归还', 'char(1)', 'String', 'isRevert', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (192, '15', 'revert_time', '归还时间', 'datetime', 'Date', 'revertTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (193, '15', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 15, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (194, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (195, '15', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (196, '15', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-03-04 20:21:48', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (197, '16', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (198, '16', 'title', '个仓库名称', 'varchar(200)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (199, '16', 'address', '地址', 'varchar(200)', 'String', 'address', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (200, '16', 'master_user_id', '负责人', 'int(11)', 'Long', 'masterUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (201, '16', 'links', '联系方式', 'varchar(50)', 'String', 'links', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (202, '16', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'ext_status', 6, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (203, '16', 'comment', '仓库说明', 'varchar(200)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (204, '16', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (205, '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (206, '16', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (207, '16', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2021-03-04 20:21:48', '', '2021-03-04 20:25:23');
INSERT INTO `gen_table_column` VALUES (208, '10', 'param', '参数', 'text', 'String', 'param', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 5, '', '2021-03-05 09:10:25', '', '2021-03-05 09:10:41');
INSERT INTO `gen_table_column` VALUES (209, '11', 'param', '参数', 'text', 'String', 'param', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 4, '', '2021-03-05 09:10:53', '', '2021-03-05 09:11:14');
INSERT INTO `gen_table_column` VALUES (210, '13', 'param', '参数要求', 'text', 'String', 'param', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 4, '', '2021-03-05 09:11:01', '', '2021-03-05 09:11:35');
INSERT INTO `gen_table_column` VALUES (211, '15', 'param', '参数要求', 'text', 'String', 'param', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 3, '', '2021-03-05 09:11:03', '', '2021-03-05 09:11:57');
INSERT INTO `gen_table_column` VALUES (212, '17', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (213, '17', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (214, '17', 'purchase_id', '采购订单', 'int(11)', 'Long', 'purchaseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (215, '17', 'house_id', '仓库', 'int(11)', 'Long', 'houseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (216, '17', 'name', '产品名称', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (218, '17', 'factory', '厂商', 'varchar(200)', 'String', 'factory', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (219, '17', 'proxy', '购买渠道', 'varchar(200)', 'String', 'proxy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (220, '17', 'amount', '购买数量', 'float(10,3)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (221, '17', 'price1', '市场价格', 'float(10,3)', 'BigDecimal', 'price1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (222, '17', 'price2', '购买价格', 'float(10,3)', 'BigDecimal', 'price2', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (223, '17', 'recv_user_id', '接收人', 'int(11)', 'Long', 'recvUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (224, '17', 'recv_time', '接收时间', 'datetime', 'Date', 'recvTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (225, '17', 'img_id', '收货单', 'int(11)', 'Long', 'imgId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 14, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (226, '17', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (227, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (228, '17', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (229, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-03-05 15:52:03', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (230, '17', 'param', '参数要求', 'text', 'String', 'param', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, '', '2021-03-05 16:14:00', '', '2021-03-05 16:14:14');
INSERT INTO `gen_table_column` VALUES (231, '18', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (232, '18', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (233, '18', 'asset_id', '资产ID', 'int(11)', 'Long', 'assetId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (234, '18', 'type', '维护类型', 'char(1)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'maintain_type', 4, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (235, '18', 'reason', '维护原由', 'varchar(200)', 'String', 'reason', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (236, '18', 'master_user_id', '负责人', 'int(11)', 'Long', 'masterUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (237, '18', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (238, '18', 'finish_time', '完成时间', 'datetime', 'Date', 'finishTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (239, '18', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (240, '18', 'is_complete', '是否完成', 'char(1)', 'String', 'isComplete', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_yes_no', 10, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (241, '18', 'comment', '维修说明', 'text', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 11, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (242, '18', 'result', '维修结果', 'char(1)', 'String', 'result', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'maintain_result', 12, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (243, '18', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (244, '18', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (245, '18', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-03-09 14:02:14', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (246, '18', 'check_user_id', '审核人', 'int(11)', 'Long', 'checkUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2021-03-09 14:03:59', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (247, '18', 'check_status', '审核结果', 'char(1)', 'String', 'checkStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'check_status', 7, '', '2021-03-09 14:03:59', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (248, '18', 'check_time', '审核时间', 'datetime', 'Date', 'checkTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, '', '2021-03-09 14:03:59', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (249, '18', 'check_reason', '审核不通过原因', 'varchar(200)', 'String', 'checkReason', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2021-03-09 14:03:59', '', '2021-03-09 14:07:18');
INSERT INTO `gen_table_column` VALUES (250, '19', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (251, '19', 'year', '年度', 'int(4)', 'Integer', 'year', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (252, '19', 'worth', '资产总值', 'float(10,2)', 'BigDecimal', 'worth', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (253, '19', 'asset_count', '固定资产总数', 'int(11)', 'Long', 'assetCount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (254, '19', 'asset_worth', '固定资产总值', 'float(10,2)', 'BigDecimal', 'assetWorth', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (255, '19', 'material_count', '耗材总类', 'int(11)', 'Long', 'materialCount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (256, '19', 'material_worth', '耗材资产总值', 'float(10,2)', 'BigDecimal', 'materialWorth', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (257, '19', 'scrap_count', '报废资产总数', 'int(11)', 'Long', 'scrapCount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (258, '19', 'scrap_worth', '报废资产总值', 'int(11)', 'Long', 'scrapWorth', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (259, '19', 'maintain_count', '资产维护次数', 'int(11)', 'Long', 'maintainCount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (260, '19', 'purchase_count', '采购次数', 'int(11)', 'Long', 'purchaseCount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (261, '19', 'purchase_worth', '采购总值', 'float(10,2)', 'BigDecimal', 'purchaseWorth', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (262, '19', 'comment', '盘点说明', 'text', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (263, '19', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (264, '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (265, '19', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (266, '19', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2021-03-10 14:44:04', '', '2021-04-13 16:24:16');
INSERT INTO `gen_table_column` VALUES (267, '20', 'id', '自增长主键ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (268, '20', 'cate_id', '资产分类', 'int(11)', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (269, '20', 'material_id', '耗材ID', 'int(11)', 'Long', 'materialId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (270, '20', 'asset_id', '资产ID', 'int(11)', 'Long', 'assetId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (271, '20', 'amount', '出库数量', 'float(10,3)', 'BigDecimal', 'amount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (272, '20', 'house_id', '仓库', 'int(11)', 'Long', 'houseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (273, '20', 'user_id', '使用人', 'int(11)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (274, '20', 'deptt_id', '使用部门', 'int(11)', 'Long', 'depttId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (275, '20', 'img_id', '照片', 'int(11)', 'Long', 'imgId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (276, '20', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'asset_status', 10, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (277, '20', 'comment', '盘点说明', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (278, '20', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (279, '20', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (280, '20', 'update_by', '更新人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (281, '20', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-04-13 16:22:13', '', '2021-04-13 16:23:09');
INSERT INTO `gen_table_column` VALUES (282, '21', 'asset_id', '资产ID', 'int(11)', 'Long', 'assetId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-09-07 15:42:28', '', '2021-09-07 15:45:16');
INSERT INTO `gen_table_column` VALUES (283, '21', 'is_online', '是否在线', 'char(1)', 'String', 'isOnline', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 2, 'admin', '2021-09-07 15:42:28', '', '2021-09-07 15:45:16');
INSERT INTO `gen_table_column` VALUES (284, '21', 'ip', 'IP地址', 'char(1)', 'String', 'ip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-09-07 15:42:28', '', '2021-09-07 15:45:16');
INSERT INTO `gen_table_column` VALUES (285, '21', 'mac', 'MAC地址', 'datetime', 'String', 'mac', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2021-09-07 15:42:28', '', '2021-09-07 15:45:16');
INSERT INTO `gen_table_column` VALUES (286, '21', 'gateway', '网关', 'varchar(50)', 'String', 'gateway', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-09-07 15:42:28', '', '2021-09-07 15:45:16');
INSERT INTO `gen_table_column` VALUES (287, '21', 'last_time', '最后在线时间', 'datetime', 'Date', 'lastTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-09-07 15:42:28', '', '2021-09-07 15:45:16');

-- ----------------------------
-- Table structure for sys_chart
-- ----------------------------
DROP TABLE IF EXISTS `sys_chart`;
CREATE TABLE `sys_chart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `ds_id` int(11) NOT NULL COMMENT '数据源',
  `xaxis` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '横向坐标',
  `yaxis` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纵向坐标',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `list_sort` int(11) NOT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '代码不能重复'
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chart
-- ----------------------------
INSERT INTO `sys_chart` VALUES (1, 'line', 'student_grade', '按年级统计在校生', 2, 'grade=年级', 'total=学生数', NULL, 1, '1');
INSERT INTO `sys_chart` VALUES (2, 'bar', 'student_grade2', '年级学生柱状图', 2, 'year=年级', 'total=学生数据', '', 2, '1');
INSERT INTO `sys_chart` VALUES (3, 'pie', 'student_grade3', '年级学生组成', 2, 'grade=年级', 'total=学生数', NULL, 3, '1');
INSERT INTO `sys_chart` VALUES (4, 'table', 'student_result', '成绩查询', 3, NULL, NULL, 'name=姓名\ncourse=课程\nresult=成绩', 5, '1');
INSERT INTO `sys_chart` VALUES (5, 'pie', 'teacher_type', '教师分类组成', 8, 'title=教师类型', 'total=教师数', NULL, 2, '1');
INSERT INTO `sys_chart` VALUES (6, 'pie', 'student_specialty', '学生专业分布', 9, 'title=专业', 'total=学生数', NULL, 1, '1');
INSERT INTO `sys_chart` VALUES (7, 'table', 'scheduling_day', '今日全校课表', 10, NULL, NULL, 'sectionName=节次\nroomName=教室\ncourseName=课程\nname=上课教师\nclassName=班级\nspecName=专业', 4, '1');
INSERT INTO `sys_chart` VALUES (8, 'table', 'my_scheduling', '教师本人课表', 11, NULL, NULL, 'week=周次\nsectionName=节次\nroomName=教室\ncourseName=课程\nclassName=班级\nspecName=专业', 4, '1');
INSERT INTO `sys_chart` VALUES (9, 'gauge', 'enroll_signup', '招生注册率', 12, '', '', NULL, 9, '1');
INSERT INTO `sys_chart` VALUES (10, 'table', 'student_glory_query', '学生荣耀查询', 21, NULL, NULL, 'name=学生姓名\ncode=学号\ntitle=荣耀名称\nlevel_name=级别\ntype_name=类型\ndepart=颁奖单位\nget_time=获奖时间', 9, '1');
INSERT INTO `sys_chart` VALUES (11, 'table', 'student_scheduling', '学生课表', 22, NULL, NULL, 'week=周次\nsectionName=节次\nroomName=教室\ncourseName=课程\nname=教师', 9, '1');
INSERT INTO `sys_chart` VALUES (12, 'line', 'student_checkin', '招生报到统计', 23, 'year=年份', 'total=报到人数', NULL, 9, '1');
INSERT INTO `sys_chart` VALUES (13, 'bar', 'worth_year_bar', '总资产统计', 29, 'title=年度', 'value=资产总值', NULL, 1, '1');
INSERT INTO `sys_chart` VALUES (14, 'bar', 'asset_worth_year_bar', '固定资产统计', 31, 'title=年度', 'value=总值', NULL, 2, '1');
INSERT INTO `sys_chart` VALUES (15, 'pie', 'purchase_worth_year_bar', '采购统计', 32, 'title=年度', 'value=总额', NULL, 3, '1');
INSERT INTO `sys_chart` VALUES (16, 'bar', 'scrap_worth_year_bar', '报废统计', 33, 'title=年度', 'value=报废价值', NULL, 4, '1');
INSERT INTO `sys_chart` VALUES (17, 'bar', 'maintain_year_bar', '维护统计', 34, 'title=年度', 'value=次数', NULL, 5, '1');
INSERT INTO `sys_chart` VALUES (18, 'bar', 'material_worth_year_bar', '耗材统计', 37, 'title=年度', 'value=总价值', NULL, 7, '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-02-25 16:38:41', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-02-25 16:38:41', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-02-25 16:38:41', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '数据库备份命令', 'db_backup', 'D:\\tools\\dbback\\assets.bat', 'Y', 'admin', '2021-03-22 13:52:09', 'admin', '2021-03-22 13:52:59', '可以是直接命令，也可以是sh或bat脚本');
INSERT INTO `sys_config` VALUES (5, '资产编号规则', 'asset_num', 'ZC-年-月-序号', 'Y', 'admin', '2021-03-22 13:52:09', 'admin', '2021-03-22 13:52:59', '资产编号规则');

-- ----------------------------
-- Table structure for sys_dataset
-- ----------------------------
DROP TABLE IF EXISTS `sys_dataset`;
CREATE TABLE `sys_dataset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `type` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代码',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `sqls` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '查询SQL',
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `list_sort` int(11) NOT NULL COMMENT '排序',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '代码不能重复'
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dataset
-- ----------------------------
INSERT INTO `sys_dataset` VALUES (4, '3', 'unread_msg', '未读消息数', 'SELECT count(id) FROM sys_msg WHERE to_user=ME AND read_time IS NULL', NULL, 1, NULL, '1');
INSERT INTO `sys_dataset` VALUES (24, '3', 'all_worth', '资产总值', 'select worth from  asset_stock where year = DATE_FORMAT(now(),\'%Y\')', NULL, 2, NULL, '1');
INSERT INTO `sys_dataset` VALUES (25, '3', 'asset_count', '固定资产总数', 'select asset_worth from  asset_stock where year = DATE_FORMAT(now(),\'%Y\')', NULL, 2, NULL, '1');
INSERT INTO `sys_dataset` VALUES (26, '3', 'material_count', '耗材种类', 'select count(id) from asset_material where status !=\'3\'', NULL, 3, NULL, '1');
INSERT INTO `sys_dataset` VALUES (27, '3', 'material_worth', '耗材价值', 'select sum(price2 * amount) from asset_material where status !=\'3\'', NULL, 3, NULL, '1');
INSERT INTO `sys_dataset` VALUES (28, '3', 'asset_worth', '固定资产总值', 'select sum(price) from asset_info where status !=\'5\'', NULL, 2, NULL, '1');
INSERT INTO `sys_dataset` VALUES (29, '2', 'worth_year', '总资产统计', 'select * from (select worth value,year title from asset_stock order by year desc limit 10) t order by title asc', NULL, 4, NULL, '1');
INSERT INTO `sys_dataset` VALUES (31, '2', 'asset_worth_year', '固定资产统计', 'select * from (select asset_worth value,year title from asset_stock order by year desc limit 10) t order by title asc', NULL, 4, NULL, '1');
INSERT INTO `sys_dataset` VALUES (32, '2', 'purchase_worth_year', '采购统计', 'select * from (select purchase_worth value,year title from asset_stock order by year desc limit 10) t order by title asc', NULL, 4, NULL, '1');
INSERT INTO `sys_dataset` VALUES (33, '2', 'scrap_worth_year', '报废统计', 'select * from (select scrap_worth value,year title from asset_stock order by year desc limit 10) t order by title asc', NULL, 4, NULL, '1');
INSERT INTO `sys_dataset` VALUES (34, '2', 'maintain_year', '维护统计', 'select * from (select maintain_count value,year title from asset_stock order by year desc limit 10) t order by title asc', NULL, 4, NULL, '1');
INSERT INTO `sys_dataset` VALUES (35, '3', 'scrap_worth', '报废总值', 'select worth from  asset_stock where year = DATE_FORMAT(now(),\'%Y\')', NULL, 2, NULL, '1');
INSERT INTO `sys_dataset` VALUES (36, '3', 'purchase_worth', '采购总值', 'select purchase_worth from  asset_stock where year = DATE_FORMAT(now(),\'%Y\')', NULL, 4, NULL, '1');
INSERT INTO `sys_dataset` VALUES (37, '2', 'material_worth_year', '耗材统计', 'select * from (select material_worth value,year title from asset_stock order by year desc limit 10) t order by title asc', NULL, 5, NULL, '1');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '000', 0, 'boss', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', 'admin', '2021-12-18 10:19:06');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '22地', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', 'admin', '2021-12-18 10:18:53');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '河南基地', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', 'admin', '2021-12-17 15:57:09');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL);
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '安徽基地', 3, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-17 15:57:35', '', NULL);
INSERT INTO `sys_dept` VALUES (111, 100, '0,100', '潮州基地', 4, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-17 15:58:04', '', NULL);
INSERT INTO `sys_dept` VALUES (112, 100, '0,100', '20', 5, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-17 15:58:45', 'admin', '2021-12-18 10:19:06');
INSERT INTO `sys_dept` VALUES (113, 110, '0,100,110', '信息管理部', 1, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-17 15:59:14', '', NULL);
INSERT INTO `sys_dept` VALUES (114, 111, '0,100,111', '信息管理部', 1, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-17 15:59:33', '', NULL);
INSERT INTO `sys_dept` VALUES (115, 112, '0,100,112', '信息管理部', 1, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-17 16:00:16', '', NULL);
INSERT INTO `sys_dept` VALUES (116, 114, '0,100,111,114', '11', 1, '1', '18569636964', '456854455@qq.com', '0', '0', 'admin', '2022-01-13 17:55:48', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (33, 1, '启用', '1', 'common_status', NULL, NULL, 'N', '0', 'admin', '2020-11-09 13:52:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 2, '禁用', '0', 'common_status', NULL, NULL, 'N', '0', 'admin', '2020-11-09 13:52:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (100, 1, '系统消息', '0', 'ext_msg_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 17:37:35', 'admin', '2021-02-25 17:37:54', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '私人消息', '1', 'ext_msg_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 17:37:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, 'web应用', '1', 'xdata_app_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:46:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '移动应用', '2', 'xdata_app_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:46:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '其它', '3', 'xdata_app_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:46:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '基础数据', '1', 'xdata_model_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:47:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '业务数据', '2', 'xdata_model_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:47:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 3, '归档数据', '3', 'xdata_model_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:47:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 4, '其它数据', '4', 'xdata_model_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:47:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, '读', 'r', 'xdata_pipe_mode', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:48:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 2, '写', 'w', 'xdata_pipe_mode', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:48:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 1, 'MySQL', '1', 'xdata_db_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:49:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 2, 'Oracle', '2', 'xdata_db_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:49:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 3, 'SQL Server', '3', 'xdata_db_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:49:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 4, 'PostgreSQL', '4', 'xdata_db_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:49:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 9, '其它', '9', 'xdata_db_type', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:50:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 1, '启用', '1', 'ext_status', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:53:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 2, '禁用', '0', 'ext_status', NULL, NULL, 'N', '0', 'admin', '2021-02-25 18:54:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 1, '固定资产', '1', 'cate_type', NULL, NULL, 'N', '0', 'admin', '2021-03-04 20:27:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 2, '基本耗材', '2', 'cate_type', NULL, NULL, 'N', '0', 'admin', '2021-03-04 20:28:00', 'admin', '2021-03-05 09:45:27', NULL);
INSERT INTO `sys_dict_data` VALUES (120, 3, '无形资产', '3', 'cate_type', NULL, NULL, 'N', '0', 'admin', '2021-03-04 20:28:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 9, '其它资产', '9', 'cate_type', NULL, NULL, 'N', '0', 'admin', '2021-03-04 20:28:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 1, '出租', '1', 'sales_type', NULL, NULL, 'N', '0', 'admin', '2021-03-05 08:54:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 2, '出售', '2', 'sales_type', NULL, NULL, 'N', '0', 'admin', '2021-03-05 08:54:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 0, '待审核', '0', 'check_status', NULL, NULL, 'N', '0', 'admin', '2021-03-05 08:57:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 1, '通过', '1', 'check_status', NULL, NULL, 'N', '0', 'admin', '2021-03-05 08:57:20', 'admin', '2021-03-05 08:57:40', NULL);
INSERT INTO `sys_dict_data` VALUES (126, 2, '不通过', '2', 'check_status', NULL, NULL, 'N', '0', 'admin', '2021-03-05 08:57:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 1, '闲置', '1', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:26:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 2, '在用', '2', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:26:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 3, '损坏', '3', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:26:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 4, '维修', '4', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:26:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 5, '报废', '5', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:26:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 9, '丢失', '9', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:26:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 1, '正常', '1', 'material_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:27:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 2, '库存不足', '2', 'material_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:28:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 3, '空仓', '3', 'material_status', NULL, NULL, 'N', '0', 'admin', '2021-03-08 11:28:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 6, '售出', '6', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-09 11:33:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 7, '出租', '7', 'asset_status', NULL, NULL, 'N', '0', 'admin', '2021-03-09 11:34:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 1, '维护', '1', 'maintain_type', NULL, NULL, 'N', '0', 'admin', '2021-03-09 14:05:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 2, '维修', '2', 'maintain_type', NULL, NULL, 'N', '0', 'admin', '2021-03-09 14:05:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 1, '恢复正常', '1', 'maintain_result', NULL, NULL, 'N', '0', 'admin', '2021-03-09 14:06:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 2, '继续维修', '2', 'maintain_result', NULL, NULL, 'N', '0', 'admin', '2021-03-09 14:06:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 5, '报废', '5', 'maintain_result', NULL, NULL, 'N', '0', 'admin', '2021-03-09 14:06:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 1, '查询列表', '1', 'dataset_type', NULL, NULL, 'N', '0', 'admin', '2020-12-04 16:34:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 2, '统计列表', '2', 'dataset_type', NULL, NULL, 'N', '0', 'admin', '2020-12-04 16:35:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 3, '计算结果', '3', 'dataset_type', NULL, NULL, 'N', '0', 'admin', '2020-12-04 16:35:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 1, '柱状图', 'bar', 'chart_type', NULL, NULL, 'N', '0', 'admin', '2020-12-04 16:35:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 2, '折线图', 'line', 'chart_type', NULL, NULL, 'N', '0', 'admin', '2020-12-04 16:36:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 3, '饼图', 'pie', 'chart_type', NULL, NULL, 'N', '0', 'admin', '2020-12-04 16:36:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 4, '仪表盘', 'gauge', 'chart_type', NULL, NULL, 'N', '0', 'admin', '2020-12-04 16:37:52', 'admin', '2020-12-21 14:11:13', NULL);
INSERT INTO `sys_dict_data` VALUES (152, 5, '表格', 'table', 'chart_type', NULL, NULL, 'N', '0', 'admin', '2020-12-21 14:11:50', 'admin', '2020-12-21 14:11:55', NULL);
INSERT INTO `sys_dict_data` VALUES (153, 1, '文档', '1', 'file_type', NULL, NULL, 'N', '0', 'admin', '2022-03-03 10:26:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (154, 2, '图片', '2', 'file_type', NULL, NULL, 'N', '0', 'admin', '2022-03-03 10:26:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (155, 3, '音视频', '3', 'file_type', NULL, NULL, 'N', '0', 'admin', '2022-03-03 10:27:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (156, 4, '压缩包', '4', 'file_type', NULL, NULL, 'N', '0', 'admin', '2022-03-03 10:27:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (157, 5, '其它', '5', 'file_type', NULL, NULL, 'N', '0', 'admin', '2022-03-03 10:27:20', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (12, '通用状态', 'common_status', '0', 'admin', '2020-11-09 13:51:53', 'admin', '2020-11-09 14:00:10', NULL);
INSERT INTO `sys_dict_type` VALUES (39, '用户性别', 'sys_user_sex', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (40, '数据集类型', 'dataset_type', '0', 'admin', '2020-12-04 16:33:58', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (41, '报表类型', 'chart_type', '0', 'admin', '2020-12-04 16:34:10', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (42, '文件类型', 'file_type', '0', '', NULL, '', NULL, '文件类型');
INSERT INTO `sys_dict_type` VALUES (100, '消息类型', 'ext_msg_type', '0', 'admin', '2021-02-25 17:37:14', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '应用类型', 'xdata_app_type', '0', 'admin', '2021-02-25 18:45:59', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '模型分类', 'xdata_model_type', '0', 'admin', '2021-02-25 18:46:55', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '管道模式', 'xdata_pipe_mode', '0', 'admin', '2021-02-25 18:48:14', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '数据库类型', 'xdata_db_type', '0', 'admin', '2021-02-25 18:49:10', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '通用状态', 'ext_status', '0', 'admin', '2021-02-25 18:53:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '资产分类类别', 'cate_type', '0', 'admin', '2021-03-04 20:27:28', 'admin', '2021-03-04 20:27:39', NULL);
INSERT INTO `sys_dict_type` VALUES (107, '资产状态', 'asset_status', '0', 'admin', '2021-03-04 20:30:31', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '租售类型', 'sales_type', '0', 'admin', '2021-03-05 08:54:26', 'admin', '2021-03-05 08:55:00', NULL);
INSERT INTO `sys_dict_type` VALUES (109, '审核状态', 'check_status', '0', 'admin', '2021-03-05 08:56:58', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (110, '耗材状态', 'material_status', '0', 'admin', '2021-03-08 11:27:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (111, '维护类型', 'maintain_type', '0', 'admin', '2021-03-09 14:05:20', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (112, '维护结果', 'maintain_result', '0', 'admin', '2021-03-09 14:05:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MD5值',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上传人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `md5`(`md5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_files
-- ----------------------------
INSERT INTO `sys_files` VALUES (9, 'e824b899a9014c083e64d6f5097b02087bf4f407.jpg', '/profile/upload/2021/03/08/cf8fdbeb-52bd-4fd5-b4de-cf4eef3cc811.jpg', '908106d5fe57762e2b45f9310f39c45d', 'admin', '2021-03-08 14:54:26');
INSERT INTO `sys_files` VALUES (10, '微信图片_20201128210814.jpg', '/profile/upload/2021/03/08/83c03a65-8c8d-432a-88da-70e48aed0167.jpg', '844e256bc1c53be11313befc50665866', 'admin', '2021-03-08 15:35:02');
INSERT INTO `sys_files` VALUES (11, '微信截图_20210714111058.png', '/profile/upload/2021/09/10/02b8c9ca-88f5-4aca-96fa-ccace242695b.png', '6c575ca03210dd7ea196f3602a70636f', 'admin', '2021-09-10 14:11:04');
INSERT INTO `sys_files` VALUES (12, '微信图片_20210823162546.jpg', '/profile/upload/2021/09/10/201eeafe-4a1a-4112-8281-fd6305222df5.jpg', '5ad91510d668287d55bc9c7bab1b437c', 'admin', '2021-09-10 14:27:06');
INSERT INTO `sys_files` VALUES (13, 'IMG_20210913_183541.jpg', '/profile/upload/2021/09/18/37cd01d8-877c-485a-a891-cf7d6a6a015c.jpg', '88a7b4e9229a991f72c1c650df352469', 'admin', '2021-09-18 10:31:38');
INSERT INTO `sys_files` VALUES (14, 'share2qq_temp9aeaf82b4fd9f0415e736a68da61952e.jpg', '/profile/upload/2021/09/18/86d26b1c-c1f6-4973-9466-5a322a573bf4.jpg', '17ec546684f1361e1b4a79be06e79f6f', 'admin', '2021-09-18 11:40:44');
INSERT INTO `sys_files` VALUES (15, '16319380877531316447886403774932.jpg', '/profile/upload/2021/09/18/0406a228-d82c-4aaa-8382-c610faff1d24.jpg', '63712b8339221ab6ccc87492c9117c2f', 'admin', '2021-09-18 12:09:35');
INSERT INTO `sys_files` VALUES (16, 'lustre_manual.pdf', '/profile/upload/2021/09/29/be08d11f-0941-4455-9482-e4a8762a0c8d.pdf', '6ddb35aedacceeadeba6565314608691', 'admin', '2021-09-29 10:42:12');
INSERT INTO `sys_files` VALUES (17, '微信图片_20210927150049.png', '/profile/upload/2021/10/20/715abd45-a79f-47af-b90b-b19229b2ce1f.png', '869751dfa021d8b1a74159a9d4aada65', 'admin', '2021-10-20 16:02:57');
INSERT INTO `sys_files` VALUES (18, '1.jpg', '/profile/upload/2021/11/28/0119e9ce-ab6c-40cf-b2cd-8e05a6586261.jpg', '1bc4ba2c30cb7629dd0547196619ac41', 'admin', '2021-11-28 14:14:51');
INSERT INTO `sys_files` VALUES (19, '2.jpg', '/profile/upload/2021/11/30/97a943f9-517b-499c-b9a4-2ea54139a52b.jpg', '7368edf508633b0a2854600f7b267c65', 'admin', '2021-11-30 19:30:35');
INSERT INTO `sys_files` VALUES (20, 'profile.jpg', '/profile/upload/2021/12/23/8394a3cf-6df7-4f45-824b-884a7b3ce11f.jpg', '647590950a6cd0ba16dbb9835f8e995e', 'admin', '2021-12-23 14:09:00');
INSERT INTO `sys_files` VALUES (21, 'ic_position.png', '/profile/upload/2022/01/08/0717a904-da8d-4a96-af61-00f3cc98832d.png', '461a86da90f62e504fcd58f8a024eecf', 'admin', '2022-01-08 23:44:13');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-02-25 16:38:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1049 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2192 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 9, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-02-25 16:38:41', 'admin', '2021-11-29 04:33:24', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 4, 4, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-02-25 16:38:41', 'admin', '2021-03-25 14:45:25', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '开发工具', 4, 4, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-02-25 16:38:41', 'admin', '2021-03-25 14:45:34', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '管理工具', 0, 4, 'ext', NULL, 1, 0, 'M', '0', '0', '', 'validCode', 'admin', '2021-02-25 16:38:41', 'admin', '2021-02-25 17:18:02', '若依官网地址');
INSERT INTO `sys_menu` VALUES (9, '查询统计', 0, 8, 'charts', NULL, 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2021-02-25 17:19:34', 'admin', '2021-11-29 04:34:21', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-02-25 16:38:41', 'admin', '2021-02-25 17:20:30', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-02-25 16:38:41', 'admin', '2021-02-25 17:20:38', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-02-25 16:38:41', 'admin', '2021-02-25 17:20:43', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-02-25 16:38:41', 'admin', '2021-02-25 17:20:48', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-02-25 16:38:41', 'admin', '2021-02-25 17:20:54', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-02-25 16:38:41', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-02-25 16:38:41', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-02-25 16:38:41', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 4, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-02-25 16:38:41', 'admin', '2021-09-01 10:52:42', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-02-25 16:38:41', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-02-25 16:38:41', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-02-25 16:38:41', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-02-25 16:38:41', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-02-25 16:38:41', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-02-25 16:38:41', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-02-25 16:38:41', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-02-25 16:38:41', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-02-25 16:38:41', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '数据中心', 4, 1, 'xdata', NULL, 1, 0, 'M', '0', '0', NULL, 'build', 'admin', '2021-02-25 17:24:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '数据报表', 4, 2, 'chart', NULL, 1, 0, 'M', '0', '0', NULL, 'chart', 'admin', '2021-02-25 17:24:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '消息查询', 2, 1, 'msg', 'sys/msg/index', 1, 0, 'C', '0', '0', 'sys:msg:list', 'message', 'admin', '2021-02-25 18:31:07', 'admin', '2021-02-25 19:01:58', '消息菜单');
INSERT INTO `sys_menu` VALUES (2004, '消息查询', 2003, 1, '#', '', 1, 0, 'F', '0', '0', 'sys:msg:query', '#', 'admin', '2021-02-25 18:31:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '消息新增', 2003, 2, '#', '', 1, 0, 'F', '0', '0', 'sys:msg:add', '#', 'admin', '2021-02-25 18:31:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '消息修改', 2003, 3, '#', '', 1, 0, 'F', '0', '0', 'sys:msg:edit', '#', 'admin', '2021-02-25 18:31:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '消息删除', 2003, 4, '#', '', 1, 0, 'F', '0', '0', 'sys:msg:remove', '#', 'admin', '2021-02-25 18:31:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '消息导出', 2003, 5, '#', '', 1, 0, 'F', '0', '0', 'sys:msg:export', '#', 'admin', '2021-02-25 18:31:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '应用管理', 2001, 1, 'client', 'xdata/client/index', 1, 0, 'C', '0', '0', 'xdata:client:list', 'server', 'admin', '2021-02-25 18:33:19', 'admin', '2021-02-25 18:50:41', '应用管理菜单');
INSERT INTO `sys_menu` VALUES (2010, '应用管理查询', 2009, 1, '#', '', 1, 0, 'F', '0', '0', 'xdata:client:query', '#', 'admin', '2021-02-25 18:33:19', 'admin', '2021-02-25 18:42:50', '');
INSERT INTO `sys_menu` VALUES (2011, '应用管理新增', 2009, 2, '#', '', 1, 0, 'F', '0', '0', 'xdata:client:add', '#', 'admin', '2021-02-25 18:33:19', 'admin', '2021-02-25 18:42:55', '');
INSERT INTO `sys_menu` VALUES (2012, '应用管理修改', 2009, 3, '#', '', 1, 0, 'F', '0', '0', 'xdata:client:edit', '#', 'admin', '2021-02-25 18:33:19', 'admin', '2021-02-25 18:43:04', '');
INSERT INTO `sys_menu` VALUES (2013, '应用管理删除', 2009, 4, '#', '', 1, 0, 'F', '0', '0', 'xdata:client:remove', '#', 'admin', '2021-02-25 18:33:19', 'admin', '2021-02-25 18:43:10', '');
INSERT INTO `sys_menu` VALUES (2014, '应用管理导出', 2009, 5, '#', '', 1, 0, 'F', '0', '0', 'xdata:client:export', '#', 'admin', '2021-02-25 18:33:19', 'admin', '2021-02-25 18:43:15', '');
INSERT INTO `sys_menu` VALUES (2015, '模型管理', 2001, 1, 'model', 'xdata/model/index', 1, 0, 'C', '0', '0', 'xdata:model:list', 'table', 'admin', '2021-02-25 18:33:31', 'admin', '2021-02-25 18:51:34', '模型管理菜单');
INSERT INTO `sys_menu` VALUES (2016, '模型管理查询', 2015, 1, '#', '', 1, 0, 'F', '0', '0', 'xdata:model:query', '#', 'admin', '2021-02-25 18:33:31', 'admin', '2021-02-25 18:43:25', '');
INSERT INTO `sys_menu` VALUES (2017, '模型管理新增', 2015, 2, '#', '', 1, 0, 'F', '0', '0', 'xdata:model:add', '#', 'admin', '2021-02-25 18:33:31', 'admin', '2021-02-25 18:43:30', '');
INSERT INTO `sys_menu` VALUES (2018, '模型管理修改', 2015, 3, '#', '', 1, 0, 'F', '0', '0', 'xdata:model:edit', '#', 'admin', '2021-02-25 18:33:31', 'admin', '2021-02-25 18:43:35', '');
INSERT INTO `sys_menu` VALUES (2019, '模型管理删除', 2015, 4, '#', '', 1, 0, 'F', '0', '0', 'xdata:model:remove', '#', 'admin', '2021-02-25 18:33:31', 'admin', '2021-02-25 18:43:41', '');
INSERT INTO `sys_menu` VALUES (2020, '模型管理导出', 2015, 5, '#', '', 1, 0, 'F', '0', '0', 'xdata:model:export', '#', 'admin', '2021-02-25 18:33:31', 'admin', '2021-02-25 18:43:47', '');
INSERT INTO `sys_menu` VALUES (2021, '通道管理', 2001, 1, 'pipe', 'xdata/pipe/index', 1, 0, 'C', '0', '0', 'xdata:pipe:list', 'swagger', 'admin', '2021-02-25 18:33:42', 'admin', '2021-02-25 18:51:26', '通道菜单');
INSERT INTO `sys_menu` VALUES (2022, '通道查询', 2021, 1, '#', '', 1, 0, 'F', '0', '0', 'xdata:pipe:query', '#', 'admin', '2021-02-25 18:33:42', 'admin', '2021-02-25 18:43:54', '');
INSERT INTO `sys_menu` VALUES (2023, '通道新增', 2021, 2, '#', '', 1, 0, 'F', '0', '0', 'xdata:pipe:add', '#', 'admin', '2021-02-25 18:33:42', 'admin', '2021-02-25 18:43:59', '');
INSERT INTO `sys_menu` VALUES (2024, '通道修改', 2021, 3, '#', '', 1, 0, 'F', '0', '0', 'xdata:pipe:edit', '#', 'admin', '2021-02-25 18:33:42', 'admin', '2021-02-25 18:44:04', '');
INSERT INTO `sys_menu` VALUES (2025, '通道删除', 2021, 4, '#', '', 1, 0, 'F', '0', '0', 'xdata:pipe:remove', '#', 'admin', '2021-02-25 18:33:42', 'admin', '2021-02-25 18:44:09', '');
INSERT INTO `sys_menu` VALUES (2026, '通道导出', 2021, 5, '#', '', 1, 0, 'F', '0', '0', 'xdata:pipe:export', '#', 'admin', '2021-02-25 18:33:42', 'admin', '2021-02-25 18:44:14', '');
INSERT INTO `sys_menu` VALUES (2027, '数据集', 2002, 1, 'dataset', 'sys/dataset/index', 1, 0, 'C', '0', '0', 'sys:dataset:list', 'tab', 'admin', '2021-02-25 18:33:52', 'admin', '2021-02-25 18:52:08', '数据集菜单');
INSERT INTO `sys_menu` VALUES (2028, '数据集查询', 2027, 1, '#', '', 1, 0, 'F', '0', '0', 'sys:dataset:query', '#', 'admin', '2021-02-25 18:33:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '数据集新增', 2027, 2, '#', '', 1, 0, 'F', '0', '0', 'sys:dataset:add', '#', 'admin', '2021-02-25 18:33:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '数据集修改', 2027, 3, '#', '', 1, 0, 'F', '0', '0', 'sys:dataset:edit', '#', 'admin', '2021-02-25 18:33:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '数据集删除', 2027, 4, '#', '', 1, 0, 'F', '0', '0', 'sys:dataset:remove', '#', 'admin', '2021-02-25 18:33:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '数据集导出', 2027, 5, '#', '', 1, 0, 'F', '0', '0', 'sys:dataset:export', '#', 'admin', '2021-02-25 18:33:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '报表设计', 2002, 1, 'chart', 'sys/chart/index', 1, 0, 'C', '0', '0', 'sys:chart:list', 'chart', 'admin', '2021-02-25 18:34:01', 'admin', '2021-02-25 18:52:22', '报表管理菜单');
INSERT INTO `sys_menu` VALUES (2034, '报表管理查询', 2033, 1, '#', '', 1, 0, 'F', '0', '0', 'sys:chart:query', '#', 'admin', '2021-02-25 18:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '报表管理新增', 2033, 2, '#', '', 1, 0, 'F', '0', '0', 'sys:chart:add', '#', 'admin', '2021-02-25 18:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '报表管理修改', 2033, 3, '#', '', 1, 0, 'F', '0', '0', 'sys:chart:edit', '#', 'admin', '2021-02-25 18:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '报表管理删除', 2033, 4, '#', '', 1, 0, 'F', '0', '0', 'sys:chart:remove', '#', 'admin', '2021-02-25 18:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '报表管理导出', 2033, 5, '#', '', 1, 0, 'F', '0', '0', 'sys:chart:export', '#', 'admin', '2021-02-25 18:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '个人中心', 0, 2, 'person', NULL, 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2021-02-25 19:19:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '收件箱', 2039, 11, 'msg/in', 'sys/msg/in', 1, 0, 'C', '0', '0', 'sys:msg:in', 'message', 'admin', '2021-02-25 19:21:10', 'admin', '2021-03-09 16:36:25', '');
INSERT INTO `sys_menu` VALUES (2041, '发件箱', 2039, 12, 'msg/out', 'sys/msg/out', 1, 0, 'C', '0', '0', 'sys:msg:out', 'message', 'admin', '2021-02-25 19:21:47', 'admin', '2021-03-09 16:36:30', '');
INSERT INTO `sys_menu` VALUES (2042, '资产管理', 0, 3, 'assets', NULL, 1, 0, 'M', '0', '0', '', 'redis', 'admin', '2021-03-04 20:24:02', 'admin', '2021-11-29 04:34:34', '');
INSERT INTO `sys_menu` VALUES (2043, '仓库管理', 2042, 1, 'warehouse', 'asset/warehouse/index', 1, 0, 'C', '0', '0', 'asset:warehouse:list', 'input', 'admin', '2021-03-05 09:00:39', 'admin', '2021-03-05 15:55:42', '仓库菜单');
INSERT INTO `sys_menu` VALUES (2044, '仓库查询', 2043, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:warehouse:query', '#', 'admin', '2021-03-05 09:00:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '仓库新增', 2043, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:warehouse:add', '#', 'admin', '2021-03-05 09:00:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '仓库修改', 2043, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:warehouse:edit', '#', 'admin', '2021-03-05 09:00:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '仓库删除', 2043, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:warehouse:remove', '#', 'admin', '2021-03-05 09:00:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '仓库导出', 2043, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:warehouse:export', '#', 'admin', '2021-03-05 09:00:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '资产分类', 2042, 1, 'category', 'asset/category/index', 1, 0, 'C', '0', '0', 'asset:category:list', 'nested', 'admin', '2021-03-05 09:00:51', 'admin', '2021-03-08 15:49:25', '资产分类菜单');
INSERT INTO `sys_menu` VALUES (2050, '资产分类查询', 2049, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:category:query', '#', 'admin', '2021-03-05 09:00:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '资产分类新增', 2049, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:category:add', '#', 'admin', '2021-03-05 09:00:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '资产分类修改', 2049, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:category:edit', '#', 'admin', '2021-03-05 09:00:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '资产分类删除', 2049, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:category:remove', '#', 'admin', '2021-03-05 09:00:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '资产分类导出', 2049, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:category:export', '#', 'admin', '2021-03-05 09:00:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '资产信息', 2042, 1, 'info', 'asset/info/index', 1, 0, 'C', '0', '0', 'asset:info:list', 'redis', 'admin', '2021-03-05 09:01:04', 'admin', '2021-03-08 15:49:44', '资产信息菜单');
INSERT INTO `sys_menu` VALUES (2056, '资产信息查询', 2055, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:info:query', '#', 'admin', '2021-03-05 09:01:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '资产信息新增', 2055, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:info:add', '#', 'admin', '2021-03-05 09:01:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '资产信息修改', 2055, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:info:edit', '#', 'admin', '2021-03-05 09:01:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '资产信息删除', 2055, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:info:remove', '#', 'admin', '2021-03-05 09:01:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '资产信息导出', 2055, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:info:export', '#', 'admin', '2021-03-05 09:01:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '采购管理', 2042, 1, 'purchase', 'asset/purchase/index', 1, 0, 'C', '0', '0', 'asset:purchase:list', 'shopping', 'admin', '2021-03-05 09:01:16', 'admin', '2021-03-05 10:17:32', '采购申请菜单');
INSERT INTO `sys_menu` VALUES (2062, '采购申请查询', 2061, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:purchase:query', '#', 'admin', '2021-03-05 09:01:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '采购申请新增', 2061, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:purchase:add', '#', 'admin', '2021-03-05 09:01:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '采购申请修改', 2061, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:purchase:edit', '#', 'admin', '2021-03-05 09:01:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '采购申请删除', 2061, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:purchase:remove', '#', 'admin', '2021-03-05 09:01:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '采购申请导出', 2061, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:purchase:export', '#', 'admin', '2021-03-05 09:01:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '使用申请', 2042, 1, 'use', 'asset/use/index', 1, 0, 'C', '0', '0', 'asset:use:list', 'button', 'admin', '2021-03-05 09:02:05', 'admin', '2021-03-08 19:34:07', '使用申请菜单');
INSERT INTO `sys_menu` VALUES (2068, '使用申请查询', 2067, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:use:query', '#', 'admin', '2021-03-05 09:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '使用申请新增', 2067, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:use:add', '#', 'admin', '2021-03-05 09:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '使用申请修改', 2067, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:use:edit', '#', 'admin', '2021-03-05 09:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '使用申请删除', 2067, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:use:remove', '#', 'admin', '2021-03-05 09:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '使用申请导出', 2067, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:use:export', '#', 'admin', '2021-03-05 09:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '出库管理', 2042, 1, 'delivery', 'asset/delivery/index', 1, 0, 'C', '0', '0', 'asset:delivery:list', 'form', 'admin', '2021-03-05 09:02:12', 'admin', '2021-03-08 19:33:58', '出库管理菜单');
INSERT INTO `sys_menu` VALUES (2074, '出库管理查询', 2073, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:delivery:query', '#', 'admin', '2021-03-05 09:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '出库管理新增', 2073, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:delivery:add', '#', 'admin', '2021-03-05 09:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '出库管理修改', 2073, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:delivery:edit', '#', 'admin', '2021-03-05 09:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '出库管理删除', 2073, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:delivery:remove', '#', 'admin', '2021-03-05 09:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '出库管理导出', 2073, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:delivery:export', '#', 'admin', '2021-03-05 09:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '无形资产', 2042, 1, 'aptitude', 'asset/aptitude/index', 1, 0, 'C', '0', '0', 'asset:aptitude:list', 'star', 'admin', '2021-03-05 09:02:23', 'admin', '2021-03-08 15:50:20', '无形资产菜单');
INSERT INTO `sys_menu` VALUES (2080, '无形资产查询', 2079, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:aptitude:query', '#', 'admin', '2021-03-05 09:02:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '无形资产新增', 2079, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:aptitude:add', '#', 'admin', '2021-03-05 09:02:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '无形资产修改', 2079, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:aptitude:edit', '#', 'admin', '2021-03-05 09:02:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '无形资产删除', 2079, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:aptitude:remove', '#', 'admin', '2021-03-05 09:02:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '无形资产导出', 2079, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:aptitude:export', '#', 'admin', '2021-03-05 09:02:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '耗材信息', 2042, 1, 'material', 'asset/material/index', 1, 0, 'C', '0', '0', 'asset:material:list', 'post', 'admin', '2021-03-05 09:02:31', 'admin', '2021-03-08 15:50:10', '耗材信息菜单');
INSERT INTO `sys_menu` VALUES (2086, '耗材信息查询', 2085, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:material:query', '#', 'admin', '2021-03-05 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '耗材信息新增', 2085, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:material:add', '#', 'admin', '2021-03-05 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '耗材信息修改', 2085, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:material:edit', '#', 'admin', '2021-03-05 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '耗材信息删除', 2085, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:material:remove', '#', 'admin', '2021-03-05 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '耗材信息导出', 2085, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:material:export', '#', 'admin', '2021-03-05 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '资产租售', 2042, 1, 'sales', 'asset/sales/index', 1, 0, 'C', '0', '0', 'asset:sales:list', 'money', 'admin', '2021-03-05 09:02:40', 'admin', '2021-03-08 19:34:37', '资产租售菜单');
INSERT INTO `sys_menu` VALUES (2092, '资产租售查询', 2091, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:sales:query', '#', 'admin', '2021-03-05 09:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '资产租售新增', 2091, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:sales:add', '#', 'admin', '2021-03-05 09:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2094, '资产租售修改', 2091, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:sales:edit', '#', 'admin', '2021-03-05 09:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '资产租售删除', 2091, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:sales:remove', '#', 'admin', '2021-03-05 09:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '资产租售导出', 2091, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:sales:export', '#', 'admin', '2021-03-05 09:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '耗材领用', 2042, 1, 'pickup', 'asset/pickup/index', 1, 0, 'C', '0', '0', 'asset:pickup:list', 'checkbox', 'admin', '2021-03-05 09:03:34', 'admin', '2021-03-08 19:34:19', '耗材领用菜单');
INSERT INTO `sys_menu` VALUES (2098, '耗材领用查询', 2097, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:pickup:query', '#', 'admin', '2021-03-05 09:03:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '耗材领用新增', 2097, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:pickup:add', '#', 'admin', '2021-03-05 09:03:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '耗材领用修改', 2097, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:pickup:edit', '#', 'admin', '2021-03-05 09:03:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '耗材领用删除', 2097, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:pickup:remove', '#', 'admin', '2021-03-05 09:03:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '耗材领用导出', 2097, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:pickup:export', '#', 'admin', '2021-03-05 09:03:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '采购申请', 2039, 1, 'asset/purchase/my', 'asset/purchase/my', 1, 0, 'C', '0', '0', 'asset:purchase:my', 'shopping', 'admin', '2021-03-05 09:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '新增', 2103, 1, '', NULL, 1, 0, 'F', '0', '0', 'asset:purchase:add', '#', 'admin', '2021-03-05 09:54:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '编辑信息', 2103, 2, '', NULL, 1, 0, 'F', '0', '0', 'asset:purchase:edit', '#', 'admin', '2021-03-05 09:55:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '删除', 2103, 3, '', NULL, 1, 0, 'F', '0', '0', 'asset:purchase:delete', '#', 'admin', '2021-03-05 09:55:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2107, '查询信息', 2103, 3, '', NULL, 1, 0, 'F', '0', '0', 'asset:purchase:query', '#', 'admin', '2021-03-05 09:55:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '审核', 2061, 5, '', NULL, 1, 0, 'F', '0', '0', 'asset:purchase:check', '#', 'admin', '2021-03-05 11:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '采购任务', 2039, 3, 'asset/purchase/task', 'asset/purchase/task', 1, 0, 'C', '0', '0', 'asset:purchase:task', 'tool', 'admin', '2021-03-05 11:39:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '查询', 2109, 1, '', NULL, 1, 0, 'F', '0', '0', 'asset:purchase:query', '#', 'admin', '2021-03-05 11:40:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '编辑', 2109, 2, '', NULL, 1, 0, 'F', '0', '0', 'asset:purchase:edit', '#', 'admin', '2021-03-05 11:40:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2112, '入库管理', 2042, 1, 'entering', 'asset/entering/index', 1, 0, 'C', '0', '0', 'asset:entering:list', 'edit', 'admin', '2021-03-05 15:54:18', 'admin', '2021-03-08 16:05:33', '入库管理菜单');
INSERT INTO `sys_menu` VALUES (2113, '入库管理查询', 2112, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:entering:query', '#', 'admin', '2021-03-05 15:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '入库管理新增', 2112, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:entering:add', '#', 'admin', '2021-03-05 15:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '入库管理修改', 2112, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:entering:edit', '#', 'admin', '2021-03-05 15:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '入库管理删除', 2112, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:entering:remove', '#', 'admin', '2021-03-05 15:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '入库管理导出', 2112, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:entering:export', '#', 'admin', '2021-03-05 15:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2118, '使用申请', 2039, 2, 'asset/use/my', 'asset/use/my', 1, 0, 'C', '0', '0', 'asset:use:my', 'button', 'admin', '2021-03-08 16:25:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2119, '新增', 2118, 1, '', NULL, 1, 0, 'F', '0', '0', 'asset:use:add', '#', 'admin', '2021-03-08 16:25:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '编辑', 2118, 2, '', NULL, 1, 0, 'F', '0', '0', 'asset:use:edit', '#', 'admin', '2021-03-08 16:26:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2121, '删除', 2118, 3, '', NULL, 1, 0, 'F', '0', '0', 'asset:use:delete', '#', 'admin', '2021-03-08 16:26:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '查询', 2118, 4, '', NULL, 1, 0, 'F', '0', '0', 'asset:use:query', '#', 'admin', '2021-03-08 16:26:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '领用申请', 2039, 3, 'asset/pickup/my', 'asset/pickup/my', 1, 0, 'C', '0', '0', 'asset:pickup:my', 'checkbox', 'admin', '2021-03-08 19:43:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '新增', 2123, 1, '', NULL, 1, 0, 'F', '0', '0', 'asset:pickup:add', '#', 'admin', '2021-03-08 19:43:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2125, '编辑', 2123, 2, '', NULL, 1, 0, 'F', '0', '0', 'asset:pickup:edit', '#', 'admin', '2021-03-08 19:44:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '删除', 2123, 3, '', NULL, 1, 0, 'F', '0', '0', 'asset:pickup:delete', '#', 'admin', '2021-03-08 19:44:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '查询', 2123, 4, '', NULL, 1, 0, 'F', '0', '0', 'asset:pickup:query', '#', 'admin', '2021-03-08 19:44:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '资产维护', 2042, 1, 'maintain', 'asset/maintain/index', 1, 0, 'C', '0', '0', 'asset:maintain:list', 'tool', 'admin', '2021-03-09 14:08:24', 'admin', '2021-03-09 14:09:18', '资产维护菜单');
INSERT INTO `sys_menu` VALUES (2129, '资产维护查询', 2128, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:maintain:query', '#', 'admin', '2021-03-09 14:08:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2130, '资产维护新增', 2128, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:maintain:add', '#', 'admin', '2021-03-09 14:08:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '资产维护修改', 2128, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:maintain:edit', '#', 'admin', '2021-03-09 14:08:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2132, '资产维护删除', 2128, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:maintain:remove', '#', 'admin', '2021-03-09 14:08:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '资产维护导出', 2128, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:maintain:export', '#', 'admin', '2021-03-09 14:08:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '维护申请', 2039, 4, 'asset/maintain/my', 'asset/maintain/my', 1, 0, 'C', '0', '0', 'asset:maintain:my', 'tool', 'admin', '2021-03-09 14:09:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '新增', 2134, 1, '', NULL, 1, 0, 'F', '0', '0', 'asset:maintain:add', '#', 'admin', '2021-03-09 14:10:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '编辑', 2134, 2, '', NULL, 1, 0, 'F', '0', '0', 'asset:maintain:edit', '#', 'admin', '2021-03-09 14:10:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2137, '删除', 2134, 3, '', NULL, 1, 0, 'F', '0', '0', 'asset:maintain:delete', '#', 'admin', '2021-03-09 14:10:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2138, '查询', 2134, 4, '', NULL, 1, 0, 'F', '0', '0', 'asset:maintain:query', '#', 'admin', '2021-03-09 14:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '维护任务', 2039, 3, 'asset/maintain/task', 'asset/maintain/task', 1, 0, 'C', '0', '0', 'asset:maintain:task', 'skill', 'admin', '2021-03-09 15:23:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '编辑', 2139, 1, '', NULL, 1, 0, 'F', '0', '0', 'asset:maintain:edit', '#', 'admin', '2021-03-09 15:24:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '查询', 2139, 2, '', NULL, 1, 0, 'F', '0', '0', 'asset:maintain:query', '#', 'admin', '2021-03-09 15:24:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '审核', 2067, 6, '', NULL, 1, 0, 'F', '0', '0', 'asset:use:check', '#', 'admin', '2021-03-09 16:34:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2143, '审核', 2097, 6, '', NULL, 1, 0, 'F', '0', '0', 'asset:pickup:check', '#', 'admin', '2021-03-09 16:35:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2144, '审核', 2128, 6, '', NULL, 1, 0, 'F', '0', '0', 'asset:maintain:check', '#', 'admin', '2021-03-09 16:36:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2145, '资产统计', 2042, 1, 'stock', 'asset/stock/index', 1, 0, 'C', '0', '0', 'asset:stock:list', 'monitor', 'admin', '2021-03-10 14:45:23', 'admin', '2021-04-13 16:12:16', '资产盘点菜单');
INSERT INTO `sys_menu` VALUES (2146, '资产统计查询', 2145, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:stock:query', '#', 'admin', '2021-03-10 14:45:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, '资产统计新增', 2145, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:stock:add', '#', 'admin', '2021-03-10 14:45:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, '资产统计修改', 2145, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:stock:edit', '#', 'admin', '2021-03-10 14:45:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2149, '资产统计删除', 2145, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:stock:remove', '#', 'admin', '2021-03-10 14:45:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2150, '资产统计导出', 2145, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:stock:export', '#', 'admin', '2021-03-10 14:45:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2151, '总资产统计', 9, 9, 'sys/chart/menu/worth_year_bar', 'sys/chart/menu', 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2021-03-11 14:50:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2152, '固定资产统计', 9, 9, 'sys/chart/menu/asset_worth_year_bar', 'sys/chart/menu', 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2021-03-11 14:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2153, '采购统计', 9, 9, 'sys/chart/menu/purchase_worth_year_bar', 'sys/chart/menu', 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2021-03-11 14:51:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2154, '报废统计', 9, 9, 'sys/chart/menu/scrap_worth_year_bar', 'sys/chart/menu', 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2021-03-11 14:51:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2155, '维护统计', 9, 9, 'sys/chart/menu/maintain_year_bar', 'sys/chart/menu', 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2021-03-11 14:51:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2156, '耗材统计', 9, 9, 'sys/chart/menu/material_worth_year_bar', 'sys/chart/menu', 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2021-03-11 16:22:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2160, '网盘管理', 4, 3, 'yun', NULL, 1, 0, 'M', '0', '0', NULL, 'international', 'admin', '2021-03-25 14:33:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '云盘目录', 2160, 1, 'folder', 'yun/folder/index', 1, 0, 'C', '0', '0', 'yun:folder:list', 'tab', 'admin', '2021-03-15 10:32:32', 'admin', '2021-03-24 14:40:22', '云盘目录菜单');
INSERT INTO `sys_menu` VALUES (2167, '云盘目录查询', 2166, 1, '#', '', 1, 0, 'F', '0', '0', 'yun:folder:query', '#', 'admin', '2021-03-15 10:32:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '云盘目录新增', 2166, 2, '#', '', 1, 0, 'F', '0', '0', 'yun:folder:add', '#', 'admin', '2021-03-15 10:32:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2169, '云盘目录修改', 2166, 3, '#', '', 1, 0, 'F', '0', '0', 'yun:folder:edit', '#', 'admin', '2021-03-15 10:32:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2170, '云盘目录删除', 2166, 4, '#', '', 1, 0, 'F', '0', '0', 'yun:folder:remove', '#', 'admin', '2021-03-15 10:32:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2171, '云盘目录导出', 2166, 5, '#', '', 1, 0, 'F', '0', '0', 'yun:folder:export', '#', 'admin', '2021-03-15 10:32:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2172, '云盘文件', 2160, 1, 'files', 'yun/files/index', 1, 0, 'C', '0', '0', 'yun:files:list', 'documentation', 'admin', '2021-03-15 10:32:44', 'admin', '2021-03-24 14:40:40', '云盘文件菜单');
INSERT INTO `sys_menu` VALUES (2173, '云盘文件查询', 2172, 1, '#', '', 1, 0, 'F', '0', '0', 'yun:files:query', '#', 'admin', '2021-03-15 10:32:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2174, '云盘文件新增', 2172, 2, '#', '', 1, 0, 'F', '0', '0', 'yun:files:add', '#', 'admin', '2021-03-15 10:32:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2175, '云盘文件修改', 2172, 3, '#', '', 1, 0, 'F', '0', '0', 'yun:files:edit', '#', 'admin', '2021-03-15 10:32:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2176, '云盘文件删除', 2172, 4, '#', '', 1, 0, 'F', '0', '0', 'yun:files:remove', '#', 'admin', '2021-03-15 10:32:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2177, '云盘文件导出', 2172, 5, '#', '', 1, 0, 'F', '0', '0', 'yun:files:export', '#', 'admin', '2021-03-15 10:32:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2178, '我的网盘', 2039, 13, 'yun/files/my', 'yun/files/my', 1, 0, 'C', '0', '0', 'yun:files:my', 'upload', 'admin', '2021-03-16 11:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2179, '资产盘点', 2042, 1, 'taking', 'asset/taking/index', 1, 0, 'C', '0', '0', 'assets:taking:list', 'button', 'admin', '2021-04-13 16:24:57', 'admin', '2021-04-13 16:26:07', '资产盘点菜单');
INSERT INTO `sys_menu` VALUES (2180, '资产盘点查询', 2179, 1, '#', '', 1, 0, 'F', '0', '0', 'assets:taking:query', '#', 'admin', '2021-04-13 16:24:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2181, '资产盘点新增', 2179, 2, '#', '', 1, 0, 'F', '0', '0', 'assets:taking:add', '#', 'admin', '2021-04-13 16:24:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2182, '资产盘点修改', 2179, 3, '#', '', 1, 0, 'F', '0', '0', 'assets:taking:edit', '#', 'admin', '2021-04-13 16:24:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2183, '资产盘点删除', 2179, 4, '#', '', 1, 0, 'F', '0', '0', 'assets:taking:remove', '#', 'admin', '2021-04-13 16:24:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2184, '资产盘点导出', 2179, 5, '#', '', 1, 0, 'F', '0', '0', 'assets:taking:export', '#', 'admin', '2021-04-13 16:24:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2185, 'IT设备', 2042, 99, 'it', 'asset/it/index', 1, 0, 'C', '0', '0', 'asset:it:list', 'server', 'admin', '2021-09-07 15:45:47', 'admin', '2021-09-08 10:08:55', 'IT设备菜单');
INSERT INTO `sys_menu` VALUES (2186, 'IT设备查询', 2185, 1, '#', '', 1, 0, 'F', '0', '0', 'asset:it:query', '#', 'admin', '2021-09-07 15:45:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2187, 'IT设备新增', 2185, 2, '#', '', 1, 0, 'F', '0', '0', 'asset:it:add', '#', 'admin', '2021-09-07 15:45:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2188, 'IT设备修改', 2185, 3, '#', '', 1, 0, 'F', '0', '0', 'asset:it:edit', '#', 'admin', '2021-09-07 15:45:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2189, 'IT设备删除', 2185, 4, '#', '', 1, 0, 'F', '0', '0', 'asset:it:remove', '#', 'admin', '2021-09-07 15:45:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2190, 'IT设备导出', 2185, 5, '#', '', 1, 0, 'F', '0', '0', 'asset:it:export', '#', 'admin', '2021-09-07 15:45:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '入库', 2109, 3, '', NULL, 1, 0, 'F', '0', '0', 'asset:entering:add', '#', 'admin', '2022-03-09 14:49:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_msg
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg`;
CREATE TABLE `sys_msg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型',
  `add_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `add_user` int(11) NOT NULL DEFAULT 0 COMMENT '发信人',
  `add_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发信人姓名',
  `to_user` int(11) NULL DEFAULT NULL COMMENT '收信人',
  `to_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收信人姓名',
  `read_time` datetime NULL DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_msg
-- ----------------------------
INSERT INTO `sys_msg` VALUES (1, 'fadf', 'adfadsf', 'adfadsf', '1', '2020-12-11 17:39:10', 1, '管理员', 1, '管理员', '2020-12-14 10:57:12');
INSERT INTO `sys_msg` VALUES (2, 'fadf', 'adfadsf', 'adfadsf', '1', '2020-12-11 17:39:10', 1, '管理员', 2, '若依', NULL);
INSERT INTO `sys_msg` VALUES (3, '回复 fadf', 'dsafa', 'asdfdasf', '1', '2020-12-11 17:46:48', 1, '管理员', 1, '管理员', '2020-12-14 10:57:12');
INSERT INTO `sys_msg` VALUES (4, '4rewrtre', 'rewtewrt', 'https://www.baidu.com/', '1', '2020-12-22 11:54:21', 4, '宋波', 1, '管理员', '2020-12-23 09:05:23');
INSERT INTO `sys_msg` VALUES (5, '回复 4rewrtre', 'afasfadsfdasf', NULL, '1', '2020-12-22 12:00:35', 1, '管理员', 4, '宋波', '2020-12-22 13:34:15');
INSERT INTO `sys_msg` VALUES (6, '34214', '234234324', NULL, '1', '2020-12-23 13:48:10', 3, '高老师', 1, '管理员', '2020-12-23 13:52:26');
INSERT INTO `sys_msg` VALUES (7, '回复 34214', '123123123', NULL, '1', '2020-12-23 13:48:24', 1, '管理员', 3, '高老师', '2020-12-23 13:48:35');
INSERT INTO `sys_msg` VALUES (8, '341234', '234234342', NULL, '1', NULL, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_msg` VALUES (9, 'sadfasd', 'fasdfsadf', 'asdfsadf', '1', NULL, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_msg` VALUES (10, 'asdf', 'adsfasdf', NULL, '1', NULL, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_msg` VALUES (11, 'asfasd', 'fdasf', NULL, '1', '2021-02-25 19:51:59', 1, '若依', 1, '超级管理员', '2021-02-25 19:52:48');
INSERT INTO `sys_msg` VALUES (12, '回复 asfasd', 'asdfasdfsdaf', NULL, '1', '2021-02-25 19:52:51', 1, '若依', 1, '超级管理员', '2021-03-05 09:42:19');
INSERT INTO `sys_msg` VALUES (13, '采购通知', '您有新的采购任务，要求在2021-03-16前完成', '/person/asset/purchase/task', '2', NULL, 0, '系统', 1, '超级管理员', '2021-03-05 11:52:42');
INSERT INTO `sys_msg` VALUES (14, '采购通知', '您有新的采购任务，要求在2021-03-10前完成', 'asset/purchase/task', '2', NULL, 0, '系统', 1, '超级管理员', '2021-03-08 11:09:20');
INSERT INTO `sys_msg` VALUES (15, '资产维护通知', '您有新的资产维护任务，要求在2021-03-11前完成', 'asset/maintain/task', '2', '2021-03-09 15:41:20', 0, '系统', 1, '超级管理员', '2021-03-09 15:45:28');
INSERT INTO `sys_msg` VALUES (16, '资产维护通知', '您有新的资产维护任务，要求在2021-03-11前完成', 'asset/maintain/task', '2', '2021-03-09 16:30:16', 0, '系统', 1, '超级管理员', '2021-03-09 16:37:12');
INSERT INTO `sys_msg` VALUES (17, '资产维护通知', '您有新的资产维护任务，要求在2021-03-11前完成', 'asset/maintain/task', '2', '2021-03-10 17:19:37', 0, '系统', 1, '超级管理员', '2021-03-10 18:50:28');
INSERT INTO `sys_msg` VALUES (18, '采购通知', '您有新的采购任务，要求在2021-10-26前完成', 'asset/purchase/task', '2', '2021-10-26 15:48:40', 0, '系统', 1, '超级管理员', '2021-10-26 20:25:12');
INSERT INTO `sys_msg` VALUES (19, '采购通知', '您有新的采购任务，要求在2021-10-26前完成', 'asset/purchase/task', '2', '2021-10-26 15:50:39', 0, '系统', 1, '超级管理员', '2021-10-26 15:54:36');
INSERT INTO `sys_msg` VALUES (20, '采购通知', '您有新的采购任务，要求在2021-11-04前完成', 'asset/purchase/task', '2', '2021-11-04 16:21:34', 0, '系统', 1, '超级管理员', '2021-11-05 13:29:42');
INSERT INTO `sys_msg` VALUES (21, '采购通知', '您有新的采购任务，要求在2022-01-13前完成', 'asset/purchase/task', '2', '2022-01-13 17:39:57', 0, '系统', 1, '超级管理员', '2022-01-13 17:42:51');
INSERT INTO `sys_msg` VALUES (22, '采购通知', '您有新的采购任务，要求在2022-01-19前完成', 'asset/purchase/task', '2', '2022-01-19 16:06:17', 0, '系统', 1, '超级管理员', '2022-02-24 11:41:57');
INSERT INTO `sys_msg` VALUES (23, '采购通知', '您有新的采购任务，要求在2022-01-24前完成', 'asset/purchase/task', '2', '2022-01-24 09:18:03', 0, '系统', 1, '超级管理员', '2022-01-24 09:32:49');
INSERT INTO `sys_msg` VALUES (24, '采购通知', '您有新的采购任务，要求在2022-01-23前完成', 'asset/purchase/task', '2', '2022-01-24 16:34:31', 0, '系统', 7, 'tom', '2022-03-09 14:44:38');
INSERT INTO `sys_msg` VALUES (25, '采购通知', '您有新的采购任务，要求在2022-01-18前完成', 'asset/purchase/task', '2', '2022-01-24 16:34:50', 0, '系统', 7, 'tom', '2022-03-09 14:44:36');
INSERT INTO `sys_msg` VALUES (26, '资产维护通知', '您有新的资产维护任务，要求在2022-03-23前完成', '/asset/maintain/task', '2', '2022-03-09 14:00:27', 0, '系统', 2, '若依', '2022-03-09 14:57:35');
INSERT INTO `sys_msg` VALUES (27, '采购通知', '您有新的采购任务，要求在2022-03-11前完成', '/asset/purchase/task', '2', '2022-03-09 14:03:34', 0, '系统', 7, 'tom', '2022-03-09 14:44:32');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1213 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-02-25 16:38:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-02-25 16:38:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-02-25 16:38:41', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '5', 0, 0, '0', '0', 'admin', '2021-02-25 16:38:41', 'admin', '2022-03-09 14:51:57', '普通角色');
INSERT INTO `sys_role` VALUES (3, '资产维护员', 'maintain', 4, '1', 1, 1, '0', '0', 'admin', '2021-03-09 16:38:16', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '采购员', 'purchase', 4, '1', 0, 0, '0', '0', 'admin', '2021-03-09 16:39:15', 'admin', '2021-10-26 20:32:22', NULL);
INSERT INTO `sys_role` VALUES (5, '资产主管', 'manager', 5, '3', 1, 1, '0', '0', 'admin', '2021-03-09 16:39:54', '', '2021-10-15 17:15:31', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2103);
INSERT INTO `sys_role_menu` VALUES (2, 2104);
INSERT INTO `sys_role_menu` VALUES (2, 2105);
INSERT INTO `sys_role_menu` VALUES (2, 2106);
INSERT INTO `sys_role_menu` VALUES (2, 2107);
INSERT INTO `sys_role_menu` VALUES (2, 2109);
INSERT INTO `sys_role_menu` VALUES (2, 2110);
INSERT INTO `sys_role_menu` VALUES (2, 2111);
INSERT INTO `sys_role_menu` VALUES (2, 2118);
INSERT INTO `sys_role_menu` VALUES (2, 2119);
INSERT INTO `sys_role_menu` VALUES (2, 2120);
INSERT INTO `sys_role_menu` VALUES (2, 2121);
INSERT INTO `sys_role_menu` VALUES (2, 2122);
INSERT INTO `sys_role_menu` VALUES (2, 2123);
INSERT INTO `sys_role_menu` VALUES (2, 2124);
INSERT INTO `sys_role_menu` VALUES (2, 2125);
INSERT INTO `sys_role_menu` VALUES (2, 2126);
INSERT INTO `sys_role_menu` VALUES (2, 2127);
INSERT INTO `sys_role_menu` VALUES (2, 2134);
INSERT INTO `sys_role_menu` VALUES (2, 2135);
INSERT INTO `sys_role_menu` VALUES (2, 2136);
INSERT INTO `sys_role_menu` VALUES (2, 2137);
INSERT INTO `sys_role_menu` VALUES (2, 2138);
INSERT INTO `sys_role_menu` VALUES (2, 2139);
INSERT INTO `sys_role_menu` VALUES (2, 2178);
INSERT INTO `sys_role_menu` VALUES (2, 2191);
INSERT INTO `sys_role_menu` VALUES (3, 2039);
INSERT INTO `sys_role_menu` VALUES (3, 2139);
INSERT INTO `sys_role_menu` VALUES (3, 2140);
INSERT INTO `sys_role_menu` VALUES (3, 2141);
INSERT INTO `sys_role_menu` VALUES (4, 2039);
INSERT INTO `sys_role_menu` VALUES (4, 2109);
INSERT INTO `sys_role_menu` VALUES (4, 2110);
INSERT INTO `sys_role_menu` VALUES (4, 2111);
INSERT INTO `sys_role_menu` VALUES (5, 2039);
INSERT INTO `sys_role_menu` VALUES (5, 2040);
INSERT INTO `sys_role_menu` VALUES (5, 2041);
INSERT INTO `sys_role_menu` VALUES (5, 2042);
INSERT INTO `sys_role_menu` VALUES (5, 2055);
INSERT INTO `sys_role_menu` VALUES (5, 2056);
INSERT INTO `sys_role_menu` VALUES (5, 2057);
INSERT INTO `sys_role_menu` VALUES (5, 2058);
INSERT INTO `sys_role_menu` VALUES (5, 2059);
INSERT INTO `sys_role_menu` VALUES (5, 2060);
INSERT INTO `sys_role_menu` VALUES (5, 2061);
INSERT INTO `sys_role_menu` VALUES (5, 2062);
INSERT INTO `sys_role_menu` VALUES (5, 2063);
INSERT INTO `sys_role_menu` VALUES (5, 2064);
INSERT INTO `sys_role_menu` VALUES (5, 2065);
INSERT INTO `sys_role_menu` VALUES (5, 2066);
INSERT INTO `sys_role_menu` VALUES (5, 2067);
INSERT INTO `sys_role_menu` VALUES (5, 2068);
INSERT INTO `sys_role_menu` VALUES (5, 2069);
INSERT INTO `sys_role_menu` VALUES (5, 2070);
INSERT INTO `sys_role_menu` VALUES (5, 2071);
INSERT INTO `sys_role_menu` VALUES (5, 2072);
INSERT INTO `sys_role_menu` VALUES (5, 2073);
INSERT INTO `sys_role_menu` VALUES (5, 2074);
INSERT INTO `sys_role_menu` VALUES (5, 2075);
INSERT INTO `sys_role_menu` VALUES (5, 2076);
INSERT INTO `sys_role_menu` VALUES (5, 2077);
INSERT INTO `sys_role_menu` VALUES (5, 2078);
INSERT INTO `sys_role_menu` VALUES (5, 2079);
INSERT INTO `sys_role_menu` VALUES (5, 2080);
INSERT INTO `sys_role_menu` VALUES (5, 2081);
INSERT INTO `sys_role_menu` VALUES (5, 2082);
INSERT INTO `sys_role_menu` VALUES (5, 2083);
INSERT INTO `sys_role_menu` VALUES (5, 2084);
INSERT INTO `sys_role_menu` VALUES (5, 2085);
INSERT INTO `sys_role_menu` VALUES (5, 2086);
INSERT INTO `sys_role_menu` VALUES (5, 2087);
INSERT INTO `sys_role_menu` VALUES (5, 2088);
INSERT INTO `sys_role_menu` VALUES (5, 2089);
INSERT INTO `sys_role_menu` VALUES (5, 2090);
INSERT INTO `sys_role_menu` VALUES (5, 2091);
INSERT INTO `sys_role_menu` VALUES (5, 2092);
INSERT INTO `sys_role_menu` VALUES (5, 2093);
INSERT INTO `sys_role_menu` VALUES (5, 2094);
INSERT INTO `sys_role_menu` VALUES (5, 2095);
INSERT INTO `sys_role_menu` VALUES (5, 2096);
INSERT INTO `sys_role_menu` VALUES (5, 2097);
INSERT INTO `sys_role_menu` VALUES (5, 2098);
INSERT INTO `sys_role_menu` VALUES (5, 2099);
INSERT INTO `sys_role_menu` VALUES (5, 2100);
INSERT INTO `sys_role_menu` VALUES (5, 2101);
INSERT INTO `sys_role_menu` VALUES (5, 2102);
INSERT INTO `sys_role_menu` VALUES (5, 2103);
INSERT INTO `sys_role_menu` VALUES (5, 2104);
INSERT INTO `sys_role_menu` VALUES (5, 2105);
INSERT INTO `sys_role_menu` VALUES (5, 2106);
INSERT INTO `sys_role_menu` VALUES (5, 2107);
INSERT INTO `sys_role_menu` VALUES (5, 2108);
INSERT INTO `sys_role_menu` VALUES (5, 2109);
INSERT INTO `sys_role_menu` VALUES (5, 2110);
INSERT INTO `sys_role_menu` VALUES (5, 2111);
INSERT INTO `sys_role_menu` VALUES (5, 2112);
INSERT INTO `sys_role_menu` VALUES (5, 2113);
INSERT INTO `sys_role_menu` VALUES (5, 2114);
INSERT INTO `sys_role_menu` VALUES (5, 2115);
INSERT INTO `sys_role_menu` VALUES (5, 2116);
INSERT INTO `sys_role_menu` VALUES (5, 2117);
INSERT INTO `sys_role_menu` VALUES (5, 2118);
INSERT INTO `sys_role_menu` VALUES (5, 2119);
INSERT INTO `sys_role_menu` VALUES (5, 2120);
INSERT INTO `sys_role_menu` VALUES (5, 2121);
INSERT INTO `sys_role_menu` VALUES (5, 2122);
INSERT INTO `sys_role_menu` VALUES (5, 2123);
INSERT INTO `sys_role_menu` VALUES (5, 2124);
INSERT INTO `sys_role_menu` VALUES (5, 2125);
INSERT INTO `sys_role_menu` VALUES (5, 2126);
INSERT INTO `sys_role_menu` VALUES (5, 2127);
INSERT INTO `sys_role_menu` VALUES (5, 2128);
INSERT INTO `sys_role_menu` VALUES (5, 2129);
INSERT INTO `sys_role_menu` VALUES (5, 2130);
INSERT INTO `sys_role_menu` VALUES (5, 2131);
INSERT INTO `sys_role_menu` VALUES (5, 2132);
INSERT INTO `sys_role_menu` VALUES (5, 2133);
INSERT INTO `sys_role_menu` VALUES (5, 2134);
INSERT INTO `sys_role_menu` VALUES (5, 2135);
INSERT INTO `sys_role_menu` VALUES (5, 2136);
INSERT INTO `sys_role_menu` VALUES (5, 2137);
INSERT INTO `sys_role_menu` VALUES (5, 2138);
INSERT INTO `sys_role_menu` VALUES (5, 2139);
INSERT INTO `sys_role_menu` VALUES (5, 2140);
INSERT INTO `sys_role_menu` VALUES (5, 2141);
INSERT INTO `sys_role_menu` VALUES (5, 2142);
INSERT INTO `sys_role_menu` VALUES (5, 2143);
INSERT INTO `sys_role_menu` VALUES (5, 2144);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2021/11/18/0c1f138c-5a39-4344-a1c0-df9387f810ad.jpeg', '$2a$10$wVdm1SAq/6/5CkdknYxKkeRlYGMkTJg0RXGLxN2IYHzpG6UnSC0hi', '0', '0', '127.0.0.1', '2021-02-25 16:38:41', 'admin', '2021-02-25 16:38:41', '', '2021-11-18 07:58:13', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$hs92B54aLmjr2PkpUGKYtOIJ/HNEiB1YC425Vom5CHyZO4dIgLfiq', '0', '0', '127.0.0.1', '2021-02-25 16:38:41', 'admin', '2021-02-25 16:38:41', 'admin', '2022-03-09 14:00:07', '测试员');
INSERT INTO `sys_user` VALUES (3, 102, 'test', '测试用户', '00', '', '', '0', '', '$2a$10$wH.kNUKHnvudWHb8TE4hOOAjkDNs0mJAUoTUnSW63XW2qVUNx7aPm', '0', '0', '', NULL, 'admin', '2021-09-16 15:15:20', 'admin', '2022-01-03 19:28:59', NULL);
INSERT INTO `sys_user` VALUES (4, 102, 'ee', 'ee', '00', '', '', '0', '', '$2a$10$LzN.4bjkM4FS6NWyulXxFO3aFRKQvXlCsYSnSbNBQweG6nRdfldg6', '0', '2', '', NULL, 'admin', '2021-09-22 17:15:43', 'admin', '2021-10-15 09:24:58', NULL);
INSERT INTO `sys_user` VALUES (5, 103, 'qweasdzxc', 'qqq', '00', '', '13688541234', '0', '', '$2a$10$CnnGmzwHZdIkEvrDQSQ3puEiO8AFSMEK4zHfz3AF/KEDZklYYDQti', '0', '2', '', NULL, 'admin', '2021-10-15 16:50:49', 'admin', '2021-10-15 16:51:37', NULL);
INSERT INTO `sys_user` VALUES (6, 100, 'cs', 'cs', '00', '', '', '0', '', '$2a$10$7xq50BmNX5xEGoBq8NxL9e9YbFUUPZV6W1wFG1p/xnI1QjQm9brOq', '0', '0', '', NULL, 'admin', '2021-12-17 16:16:55', 'admin', '2021-12-17 16:17:39', NULL);
INSERT INTO `sys_user` VALUES (7, 108, 'tom', 'tom', '00', '', '15888888889', '0', '', '$2a$10$IKpbLl7SQxbQIxych2w47ut/BHPsppfLE6dJ0DQnuw0mt7KW1Juyy', '0', '0', '', NULL, 'admin', '2022-01-19 15:59:34', '', NULL, '普通角色\n');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (7, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 5);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (6, 3);
INSERT INTO `sys_user_role` VALUES (6, 4);
INSERT INTO `sys_user_role` VALUES (6, 5);
INSERT INTO `sys_user_role` VALUES (7, 2);

-- ----------------------------
-- Table structure for xdata_client
-- ----------------------------
DROP TABLE IF EXISTS `xdata_client`;
CREATE TABLE `xdata_client`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名称',
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用代码',
  `secret` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用密钥',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒体附件',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `db_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `jdbc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据连接',
  `db_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库账号',
  `db_pass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xdata_client
-- ----------------------------
INSERT INTO `xdata_client` VALUES (1, '数据备份', '1', 'db2f4bf76f21bf9f44bed10ed30a8aba', '9c0e66ab26e561c4ceff9649a8fcd19e', NULL, NULL, '1', 'jdbc:mysql://localhost:3306/java_szxy_data?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'root', 'root', '1');
INSERT INTO `xdata_client` VALUES (2, '教务系统', '1', '12695b8513de059116db8aebf506af6f', '90ca372d19ea42ff8bfeb1d46c5ca7db', NULL, NULL, '1', 'jdbc:mysql://localhost:3306/java_szxy_data?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'root', 'root', '1');

-- ----------------------------
-- Table structure for xdata_log
-- ----------------------------
DROP TABLE IF EXISTS `xdata_log`;
CREATE TABLE `xdata_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `pipe_id` int(11) NOT NULL COMMENT '管道',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `result` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结果',
  `rows` int(11) NULL DEFAULT NULL COMMENT '行数',
  `error` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '传输日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xdata_log
-- ----------------------------

-- ----------------------------
-- Table structure for xdata_model
-- ----------------------------
DROP TABLE IF EXISTS `xdata_model`;
CREATE TABLE `xdata_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型名称',
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `tables` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据表',
  `list_sort` int(11) NULL DEFAULT 9 COMMENT '排序',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xdata_model
-- ----------------------------
INSERT INTO `xdata_model` VALUES (1, '专业信息', '1', 'base_specialty', 1, '1');

-- ----------------------------
-- Table structure for xdata_pipe
-- ----------------------------
DROP TABLE IF EXISTS `xdata_pipe`;
CREATE TABLE `xdata_pipe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `client_id` int(11) NOT NULL COMMENT '应用',
  `model_id` int(11) NOT NULL COMMENT '模型名称',
  `mode` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `read_sql` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '读取操作',
  `insert_sql` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新增操作',
  `update_sql` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新操作',
  `del_sql` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除操作',
  `exist_sql` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '查询操作',
  `last_time` datetime NULL DEFAULT NULL COMMENT '上次同步时间',
  `last_result` int(11) NULL DEFAULT NULL COMMENT '上次同步结果',
  `list_sort` int(11) NULL DEFAULT 9 COMMENT '优先级',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通道' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xdata_pipe
-- ----------------------------
INSERT INTO `xdata_pipe` VALUES (1, '', 1, 1, 'r', 'SELECT id, dept_id, code, title, period, start_date, end_date, master_user, list_sort, status, is_enroll, create_by, create_time, update_by, update_time FROM base_specialty limit #{_page} , #{_rows};', 'INSERT INTO base_specialty( id, dept_id, code, title, period, start_date, end_date, master_user, list_sort, status, is_enroll, create_by, create_time, update_by, update_time ) VALUES ( NULL, #{dept_id}, #{code}, #{title}, #{period}, #{start_date}, #{end_date}, #{master_user}, #{list_sort}, #{status}, #{is_enroll}, #{create_by}, #{create_time}, #{update_by}, #{update_time} );', 'UPDATE base_specialty SET dept_id =  #{dept_id}, code =  #{code}, title =  #{title}, period =  #{period}, start_date =  #{start_date}, end_date =  #{end_date}, master_user =  #{master_user}, list_sort =  #{list_sort}, status =  #{status}, is_enroll =  #{is_enroll}, create_by =  #{create_by}, create_time =  #{create_time}, update_by =  #{update_by}, update_time =  #{update_time} WHERE id = #{id};', NULL, 'SELECT * FROM base_specialty WHERE id = #{id} LIMIT 1', '2021-04-13 16:29:00', -1, 1, '0');
INSERT INTO `xdata_pipe` VALUES (2, '', 2, 1, 'w', 'SELECT id, dept_id, code, title, period, start_date, end_date, master_user, list_sort, status, is_enroll, create_by, create_time, update_by, update_time FROM base_specialty limit #{_page} , #{_rows};', 'INSERT INTO base_specialty( id, dept_id, code, title, period, start_date, end_date, master_user, list_sort, status, is_enroll, create_by, create_time, update_by, update_time ) VALUES ( NULL, #{dept_id}, #{code}, #{title}, #{period}, #{start_date}, #{end_date}, #{master_user}, #{list_sort}, #{status}, #{is_enroll}, #{create_by}, #{create_time}, #{update_by}, #{update_time} );', 'UPDATE base_specialty SET dept_id =  #{dept_id}, code =  #{code}, title =  #{title}, period =  #{period}, start_date =  #{start_date}, end_date =  #{end_date}, master_user =  #{master_user}, list_sort =  #{list_sort}, status =  #{status}, is_enroll =  #{is_enroll}, create_by =  #{create_by}, create_time =  #{create_time}, update_by =  #{update_by}, update_time =  #{update_time} WHERE code = #{code};', NULL, 'SELECT * FROM base_specialty WHERE code = #{code}  LIMIT 1', '2020-12-31 09:05:46', 3, 1, '0');

-- ----------------------------
-- Table structure for yun_files
-- ----------------------------
DROP TABLE IF EXISTS `yun_files`;
CREATE TABLE `yun_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `folder_id` int(11) NULL DEFAULT 0 COMMENT '目录',
  `file_id` int(11) NOT NULL COMMENT '文件',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `is_public` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否共享',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '云盘文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yun_files
-- ----------------------------
INSERT INTO `yun_files` VALUES (5, 0, 10, '微信图片_20201128210814.jpg', '2', 'Y', 'admin', '2021-03-17 14:45:11', '', NULL);
INSERT INTO `yun_files` VALUES (6, 5, 13, '16121474130256962.mp4', '3', 'N', 'admin', '2021-03-17 14:45:19', '', NULL);
INSERT INTO `yun_files` VALUES (7, 0, 11, 'Web3.2_控件开发包编程指南.pdf', '5', 'Y', 'admin', '2021-03-17 14:45:59', 'admin', '2021-03-17 15:48:43');
INSERT INTO `yun_files` VALUES (8, 0, 10, '微信图片_20201128210814.jpg', '2', 'Y', 'admin', '2021-03-17 15:05:16', '', NULL);
INSERT INTO `yun_files` VALUES (9, 0, 15, '青鸟消防无线局域智慧消防系统 (1).jpg', '2', 'N', 'admin', '2021-03-17 15:33:51', '', NULL);
INSERT INTO `yun_files` VALUES (10, 8, 14, '“双随机、一公开”消防监督抽查实施细则（试行） (1).doc', '1', 'N', 'admin', '2021-03-17 15:35:47', '', NULL);
INSERT INTO `yun_files` VALUES (11, 8, 12, '爱尚酒店.pdf', '1', 'N', 'admin', '2021-03-17 15:37:39', '', NULL);
INSERT INTO `yun_files` VALUES (12, 0, 16, 'lustre_manual.pdf', '1', 'Y', 'admin', '2021-09-29 10:42:12', '', NULL);

-- ----------------------------
-- Table structure for yun_folder
-- ----------------------------
DROP TABLE IF EXISTS `yun_folder`;
CREATE TABLE `yun_folder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `pid` int(11) NULL DEFAULT 0 COMMENT '上级',
  `list_sort` int(11) NULL DEFAULT 9 COMMENT '排序',
  `is_public` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否公开',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '云盘目录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yun_folder
-- ----------------------------
INSERT INTO `yun_folder` VALUES (8, '目录1', 0, 9, 'N', 'admin', '2021-03-17 15:33:31', 'admin', '2021-03-17 15:47:42');

SET FOREIGN_KEY_CHECKS = 1;
