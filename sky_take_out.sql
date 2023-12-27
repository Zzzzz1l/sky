/*
 Navicat Premium Data Transfer

 Source Server         : ZH
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : sky_take_out

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 27/12/2023 17:22:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (2, 4, '张浩', '0', '18438908593', '34', '安徽省', '3401', '合肥市', '340104', '蜀山区', '合肥工业大学', '3', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1, '码农烧烤', 3, 1, '2023-12-17 16:40:33', '2023-12-17 19:08:24', 1, 1);
INSERT INTO `category` VALUES (11, 1, '酒水饮料', 10, 1, '2022-06-09 22:09:18', '2023-12-17 15:49:25', 1, 1);
INSERT INTO `category` VALUES (12, 1, '传统主食', 9, 1, '2022-06-09 22:09:32', '2022-06-09 22:18:53', 1, 1);
INSERT INTO `category` VALUES (13, 2, '人气套餐', 12, 1, '2022-06-09 22:11:38', '2022-06-10 11:04:40', 1, 1);
INSERT INTO `category` VALUES (15, 2, '商务套餐', 13, 1, '2022-06-09 22:14:10', '2022-06-10 11:04:48', 1, 1);
INSERT INTO `category` VALUES (16, 1, '蜀味烤鱼', 4, 1, '2022-06-09 22:15:37', '2022-08-31 14:27:25', 1, 1);
INSERT INTO `category` VALUES (17, 1, '蜀味牛蛙', 5, 1, '2022-06-09 22:16:14', '2022-08-31 14:39:44', 1, 1);
INSERT INTO `category` VALUES (18, 1, '特色蒸菜', 6, 1, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1);
INSERT INTO `category` VALUES (19, 1, '新鲜时蔬', 7, 1, '2022-06-09 22:18:12', '2022-06-09 22:18:28', 1, 1);
INSERT INTO `category` VALUES (20, 1, '水煮鱼', 8, 1, '2022-06-09 22:22:29', '2022-06-09 22:23:45', 1, 1);
INSERT INTO `category` VALUES (21, 1, '汤类', 11, 1, '2022-06-10 10:51:47', '2022-06-10 10:51:47', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (46, '王老吉', 11, 6.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/d8764cbc-3b28-445b-a1f4-5ffb2eac6561.jpg', '', 1, '2022-06-09 22:40:47', '2023-12-27 16:51:08', 1, 1);
INSERT INTO `dish` VALUES (47, '北冰洋', 11, 4.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/69c8f76e-66df-4ea0-83ae-2f03bb13ba2f.jpg', '还是小时候的味道', 1, '2022-06-10 09:18:49', '2023-12-27 16:45:31', 1, 1);
INSERT INTO `dish` VALUES (48, '雪花啤酒', 11, 4.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/5477faf9-928c-4f26-b323-d9de9d74e502.jpg', '', 1, '2022-06-10 09:22:54', '2023-12-27 16:44:40', 1, 1);
INSERT INTO `dish` VALUES (49, '米饭', 12, 2.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/bc3dd37d-0cd0-4bec-9ddc-03373805dd94.jpg', '精选五常大米', 1, '2022-06-10 09:30:17', '2023-12-27 16:44:30', 1, 1);
INSERT INTO `dish` VALUES (50, '馒头', 12, 1.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/d64d981a-f8f5-4fcd-a841-77bcfc6eea1e.jpg', '优质面粉', 1, '2022-06-10 09:34:28', '2023-12-27 16:44:20', 1, 1);
INSERT INTO `dish` VALUES (51, '老坛酸菜鱼', 20, 56.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/33f5f4d6-162c-4f20-a369-3111c9d139a6.jpg', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2023-12-27 16:44:10', 1, 1);
INSERT INTO `dish` VALUES (52, '经典酸菜鮰鱼', 20, 66.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/133fcf78-66a8-421e-a104-a569f4a4f49b.jpg', '原料：酸菜，江团，鮰鱼', 1, '2022-06-10 09:46:02', '2023-12-27 16:43:52', 1, 1);
INSERT INTO `dish` VALUES (53, '蜀味水煮草鱼', 20, 38.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/d077d5eb-90b3-4fb5-baf9-2ae9da5d9eba.jpg', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2023-12-27 16:43:33', 1, 1);
INSERT INTO `dish` VALUES (54, '清炒小油菜', 19, 18.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/3c7ded6d-19a6-4b4e-b418-a5e2ce6102c1.jpg', '原料：小油菜', 1, '2022-06-10 09:51:46', '2023-12-27 16:43:12', 1, 1);
INSERT INTO `dish` VALUES (55, '蒜蓉娃娃菜', 19, 18.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/7e029b18-6ecc-4b2f-a705-5f265dd573b6.jpeg', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2023-12-27 16:43:01', 1, 1);
INSERT INTO `dish` VALUES (56, '清炒西兰花', 19, 18.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/00faac4c-932f-4b6d-8565-cc161ed4e6e9.jpg', '原料：西兰花', 1, '2022-06-10 09:55:44', '2023-12-27 16:42:46', 1, 1);
INSERT INTO `dish` VALUES (57, '炝炒圆白菜', 19, 18.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/e535c8cf-9c33-44ee-b779-b66ce2165ed0.jpg', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2023-12-27 16:42:34', 1, 1);
INSERT INTO `dish` VALUES (58, '清蒸鲈鱼', 18, 98.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/fece8561-8734-49bd-ace3-17879681aef3.jpg', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2023-12-27 16:42:08', 1, 1);
INSERT INTO `dish` VALUES (59, '东坡肘子', 18, 138.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/5fdf4d2b-e23f-4b81-a4ed-0019e2c0fa77.jpg', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2023-12-27 16:38:52', 1, 1);
INSERT INTO `dish` VALUES (60, '梅菜扣肉', 18, 58.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/75e30ba6-5c39-4e77-97d2-f252d6a4d501.jpg', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2023-12-27 16:38:30', 1, 1);
INSERT INTO `dish` VALUES (61, '剁椒鱼头', 18, 66.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/ccdc1d65-4e92-414d-8e8f-5859446b7f82.jpg', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2023-12-27 16:38:21', 1, 1);
INSERT INTO `dish` VALUES (62, '金汤酸菜牛蛙', 17, 88.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/54e68b94-b5b1-4660-859e-e07c626223e0.jpg', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2023-12-27 16:38:13', 1, 1);
INSERT INTO `dish` VALUES (63, '香锅牛蛙', 17, 88.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/e9aac8cc-3aee-41ac-a3d2-0957a5c3cd23.jpg', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2023-12-27 16:37:53', 1, 1);
INSERT INTO `dish` VALUES (64, '馋嘴牛蛙', 17, 88.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/e0764583-3f50-4ae7-a948-9e27be797779.jpg', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2023-12-27 16:37:29', 1, 1);
INSERT INTO `dish` VALUES (65, '草鱼2斤', 16, 68.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/ff719c0e-d132-42cd-854b-f6b5dbc59683.jpg', '原料：草鱼，黄豆芽，莲藕', 1, '2022-06-10 10:41:08', '2023-12-27 16:37:17', 1, 1);
INSERT INTO `dish` VALUES (66, '江团鱼2斤', 16, 119.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/734ef88f-6abd-4fd5-a8d8-b2c18e5c25c5.jpg', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2023-12-27 16:37:09', 1, 1);
INSERT INTO `dish` VALUES (67, '鮰鱼2斤', 16, 72.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/7d925838-0bdb-4e0b-92f1-832a3f7d29df.jpg', '原料：鮰鱼，黄豆芽，莲藕', 1, '2022-06-10 10:43:56', '2023-12-27 16:37:00', 1, 1);
INSERT INTO `dish` VALUES (68, '鸡蛋汤', 21, 4.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/75bfc19f-3933-4c61-a28c-ecb3c76979ef.jpg', '配料：鸡蛋，紫菜', 1, '2022-06-10 10:54:25', '2023-12-27 16:36:48', 1, 1);
INSERT INTO `dish` VALUES (69, '平菇豆腐汤', 21, 26.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/ecbd5f29-1d5a-4170-a4b9-a285879fdff9.jpg', '配料：豆腐，平菇', 1, '2022-06-10 10:55:02', '2023-12-27 16:36:17', 1, 1);
INSERT INTO `dish` VALUES (72, '大白混沌', 12, 998.00, 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/b9edb04d-f828-4a55-97c6-720a70b97ab2.jpg', '好吃的混沌，只要998', 1, '2023-12-22 18:54:52', '2023-12-22 18:54:52', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (41, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (42, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (49, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (50, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (106, 72, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (107, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (108, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (109, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (110, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (111, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (112, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (113, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (114, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (115, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (116, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (117, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (118, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (119, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);
INSERT INTO `employee` VALUES (2, '王五', 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', '11122233321', '1', '111222333444555666', 1, '2023-12-10 22:32:26', '2023-12-11 20:55:56', 10, 1);
INSERT INTO `employee` VALUES (3, '李四', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '15666666666', '1', '411326200009301517', 1, '2023-12-10 22:51:56', '2023-12-10 22:51:56', 10, 10);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, '大白混沌', 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/b9edb04d-f828-4a55-97c6-720a70b97ab2.jpg', 4, 72, NULL, '不要葱', 1, 998.00);
INSERT INTO `order_detail` VALUES (6, '大白混沌', 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/b9edb04d-f828-4a55-97c6-720a70b97ab2.jpg', 6, 72, NULL, '不要葱', 1, 998.00);
INSERT INTO `order_detail` VALUES (7, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 7, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (8, '香锅牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', 8, 63, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (9, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 13, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (10, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 14, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (11, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 16, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (12, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 16, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (13, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 17, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (14, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 18, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (15, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 19, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (16, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 20, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (17, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 21, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (18, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 22, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (19, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 23, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (20, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 24, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (21, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 25, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (22, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 25, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (23, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 26, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (24, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 27, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (25, '馒头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 28, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (26, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 29, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (27, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 30, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (28, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 31, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (29, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 32, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (30, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 33, 61, NULL, NULL, 1, 66.00);
INSERT INTO `order_detail` VALUES (31, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 34, 55, NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (32, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 35, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (33, '香锅牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', 35, 63, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (34, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 36, 55, NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (35, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 37, 64, NULL, NULL, 1, 88.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, '1703504997308', 6, 4, 2, '2023-12-25 19:49:57', NULL, 1, 0, 1005.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 20:49:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (5, '1703505608214', 6, 4, 2, '2023-12-25 20:00:08', NULL, 1, 0, 184.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:00:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (6, '1703505825588', 5, 4, 2, '2023-12-25 20:03:46', NULL, 1, 0, 1005.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:03:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (7, '1703505911121', 6, 4, 2, '2023-12-25 20:05:11', NULL, 1, 0, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:04:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (8, '1703505987470', 6, 4, 2, '2023-12-25 20:06:27', NULL, 1, 0, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:06:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (9, '1703506014855', 6, 4, 2, '2023-12-25 20:06:55', NULL, 1, 0, 184.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:06:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (10, '1703506066452', 6, 4, 2, '2023-12-25 20:07:46', NULL, 1, 0, 251.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:07:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (11, '1703506083331', 6, 4, 2, '2023-12-25 20:08:03', NULL, 1, 0, 251.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:08:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (13, '1703506674724', 6, 4, 2, '2023-12-25 20:17:55', NULL, 1, 0, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:17:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (14, '1703506683419', 6, 4, 2, '2023-12-25 20:18:03', NULL, 1, 0, 184.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:18:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (16, '1703506756731', 6, 4, 2, '2023-12-25 20:19:17', NULL, 1, 0, 212.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:19:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (17, '1703509165178', 6, 4, 2, '2023-12-25 20:59:25', NULL, 1, 0, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单超时，自动取消', NULL, '2023-12-26 18:04:57', '2023-12-25 21:59:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (18, '1703512316932', 5, 4, 2, '2023-12-25 21:51:57', '2023-12-25 21:51:58', 1, 1, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-25 22:51:00', 0, '2023-12-27 14:19:41', 1, 0, 0);
INSERT INTO `orders` VALUES (19, '1703576183553', 5, 4, 2, '2023-12-26 15:36:24', '2023-12-26 15:36:27', 1, 1, 184.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 16:36:00', 0, '2023-12-27 14:19:40', 2, 0, 0);
INSERT INTO `orders` VALUES (20, '1703576205717', 5, 4, 2, '2023-12-26 15:36:46', '2023-12-26 15:36:47', 1, 1, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 16:36:00', 0, '2023-12-27 14:19:39', 1, 0, 0);
INSERT INTO `orders` VALUES (21, '1703577594569', 5, 4, 2, '2023-12-26 15:59:55', '2023-12-26 15:59:56', 1, 1, 184.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 16:59:00', 0, '2023-12-27 14:19:38', 2, 0, 0);
INSERT INTO `orders` VALUES (22, '1703577874473', 6, 4, 2, '2023-12-26 16:04:34', '2023-12-26 16:04:35', 1, 2, 184.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '用户取消', NULL, '2023-12-26 16:04:38', '2023-12-26 17:04:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (23, '1703590976934', 5, 4, 2, '2023-12-26 19:42:57', '2023-12-26 19:42:58', 1, 1, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 20:42:00', 0, '2023-12-27 14:19:37', 1, 0, 0);
INSERT INTO `orders` VALUES (24, '1703591078260', 5, 4, 2, '2023-12-26 19:44:38', '2023-12-26 19:44:39', 1, 1, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 20:44:00', 0, '2023-12-27 14:19:36', 1, 0, 0);
INSERT INTO `orders` VALUES (25, '1703591169792', 5, 4, 2, '2023-12-26 19:46:10', '2023-12-26 19:46:11', 1, 1, 212.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 20:46:00', 0, '2023-12-27 14:19:24', 2, 0, 0);
INSERT INTO `orders` VALUES (26, '1703591199707', 5, 4, 2, '2023-12-26 19:46:40', '2023-12-26 19:46:41', 1, 1, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 20:46:00', 0, '2023-12-27 14:19:23', 1, 0, 0);
INSERT INTO `orders` VALUES (27, '1703591961557', 5, 4, 2, '2023-12-26 19:59:22', '2023-12-26 19:59:22', 1, 1, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 20:59:00', 0, '2023-12-27 14:19:21', 1, 0, 0);
INSERT INTO `orders` VALUES (28, '1703591981528', 5, 4, 2, '2023-12-26 19:59:42', '2023-12-26 19:59:43', 1, 1, 8.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 20:59:00', 0, '2023-12-27 14:19:20', 1, 0, 0);
INSERT INTO `orders` VALUES (29, '1703591996022', 5, 4, 2, '2023-12-26 19:59:56', '2023-12-26 19:59:57', 1, 1, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 20:59:00', 0, '2023-12-27 14:19:20', 1, 0, 0);
INSERT INTO `orders` VALUES (30, '1703592014481', 5, 4, 2, '2023-12-26 20:00:14', '2023-12-26 20:00:15', 1, 1, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 21:00:00', 0, '2023-12-27 14:19:19', 1, 0, 0);
INSERT INTO `orders` VALUES (31, '1703592136537', 5, 4, 2, '2023-12-26 20:02:17', '2023-12-26 20:02:17', 1, 1, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 21:02:00', 0, '2023-12-27 14:19:19', 1, 0, 0);
INSERT INTO `orders` VALUES (32, '1703592337525', 5, 4, 2, '2023-12-26 20:05:38', '2023-12-26 20:05:38', 1, 1, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 21:05:00', 0, '2023-12-27 14:19:18', 1, 0, 0);
INSERT INTO `orders` VALUES (33, '1703592540987', 5, 4, 2, '2023-12-26 20:09:01', '2023-12-26 20:09:02', 1, 1, 73.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 21:08:00', 0, '2023-12-27 14:19:17', 1, 0, 0);
INSERT INTO `orders` VALUES (34, '1703592728220', 5, 4, 2, '2023-12-26 20:12:08', '2023-12-26 20:12:12', 1, 1, 25.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-26 21:12:00', 0, '2023-12-27 14:19:15', 1, 0, 0);
INSERT INTO `orders` VALUES (35, '1703663955575', 6, 4, 2, '2023-12-27 15:59:16', '2023-12-27 15:59:17', 1, 1, 184.00, '', '18438908593', '合肥工业大学', NULL, '张浩', '订单量较多，暂时无法接单', NULL, '2023-12-27 15:59:44', '2023-12-27 16:59:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (36, '1703664006041', 5, 4, 2, '2023-12-27 16:00:06', '2023-12-27 16:00:07', 1, 1, 25.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-27 17:00:00', 0, '2023-12-27 16:00:27', 1, 0, 0);
INSERT INTO `orders` VALUES (37, '1703664430208', 5, 4, 2, '2023-12-27 16:07:10', '2023-12-27 16:07:11', 1, 1, 95.00, '', '18438908593', '合肥工业大学', NULL, '张浩', NULL, NULL, NULL, '2023-12-27 17:07:00', 0, '2023-12-27 16:07:22', 1, 0, 0);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (32, 13, '好好好', 128.00, 0, '128', 'https://zh-web-00930.oss-cn-nanjing.aliyuncs.com/19e9580b-9405-4df9-9b11-c82cdd91ed86.jpg', '2023-12-20 23:02:54', '2023-12-20 23:03:18', 1, 1);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (47, 32, 64, '馋嘴牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (48, 32, 67, '鮰鱼2斤', 72.00, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'oS-PE62nt4hmk_6Kx58C82P0c4Lw', NULL, NULL, NULL, NULL, NULL, '2023-12-23 21:54:15');

SET FOREIGN_KEY_CHECKS = 1;
