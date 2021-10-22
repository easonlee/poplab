/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 127.0.0.1:3306
 Source Schema         : poplab

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 22/10/2021 16:58:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'eJ5lL7MLRx', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (2, '4Qn5M8vUwU', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (3, '4vsvSwGWl7', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (4, 'Ybc18hXEFd', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (5, 'L5xX5nJzzX', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (6, 'fvCBP9jT4m', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (7, 'HiY63vQiwg', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (8, 'w58KeWa8rP', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (9, 'WiE3flPGjZ', '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `categories` VALUES (10, 'Ogltd9WiSE', '2021-10-22 08:56:13', '2021-10-22 08:56:13');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_10_21_154833_create_product_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_10_21_154850_create_category_table', 1);
INSERT INTO `migrations` VALUES (7, '2021_10_21_154910_create_productcategory_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES (1, 1, 1, '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `product_categories` VALUES (2, 2, 1, '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `product_categories` VALUES (3, 3, 1, '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `product_categories` VALUES (4, 4, 1, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (5, 5, 1, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (6, 6, 1, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (7, 7, 1, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (8, 8, 1, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (9, 9, 1, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (10, 10, 1, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (11, 11, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (12, 12, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (13, 13, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (14, 14, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (15, 15, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (16, 16, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (17, 17, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (18, 18, 2, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `product_categories` VALUES (19, 19, 2, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (20, 20, 2, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (21, 21, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (22, 22, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (23, 23, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (24, 24, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (25, 25, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (26, 26, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (27, 27, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (28, 28, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (29, 29, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (30, 30, 3, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (31, 31, 4, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (32, 32, 4, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (33, 33, 4, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (34, 34, 4, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `product_categories` VALUES (35, 35, 4, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (36, 36, 4, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (37, 37, 4, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (38, 38, 4, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (39, 39, 4, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (40, 40, 4, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (41, 41, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (42, 42, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (43, 43, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (44, 44, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (45, 45, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (46, 46, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (47, 47, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (48, 48, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (49, 49, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (50, 50, 5, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (51, 51, 6, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `product_categories` VALUES (52, 52, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (53, 53, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (54, 54, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (55, 55, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (56, 56, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (57, 57, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (58, 58, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (59, 59, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (60, 60, 6, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (61, 61, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (62, 62, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (63, 63, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (64, 64, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (65, 65, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (66, 66, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (67, 67, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (68, 68, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (69, 69, 7, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `product_categories` VALUES (70, 70, 7, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (71, 71, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (72, 72, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (73, 73, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (74, 74, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (75, 75, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (76, 76, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (77, 77, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (78, 78, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (79, 79, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (80, 80, 8, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (81, 81, 9, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (82, 82, 9, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (83, 83, 9, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (84, 84, 9, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (85, 85, 9, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (86, 86, 9, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `product_categories` VALUES (87, 87, 9, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (88, 88, 9, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (89, 89, 9, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (90, 90, 9, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (91, 91, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (92, 92, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (93, 93, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (94, 94, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (95, 95, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (96, 96, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (97, 97, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (98, 98, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (99, 99, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `product_categories` VALUES (100, 100, 10, '2021-10-22 08:56:19', '2021-10-22 08:56:19');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '6u1LVu7UVh', 'Nisi iusto minus quo possimus enim.', 40.00, 87, '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `products` VALUES (2, 'FEGXREDkpN', 'Rerum sequi molestiae quas amet sit et iure.', 91.00, 45, '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `products` VALUES (3, 'qUo93vsKEy', 'Sapiente rerum est est et numquam dolores repellat.', 54.00, 47, '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `products` VALUES (4, 'HyDtg7BDnK', 'Dolor quas ut porro.', 30.00, 82, '2021-10-22 08:56:13', '2021-10-22 08:56:13');
INSERT INTO `products` VALUES (5, 'nAuE3GTOl5', 'Reiciendis quam porro voluptatem eaque.', 67.00, 81, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (6, '7XO5LSxgXG', 'Sit vel velit beatae debitis doloremque fugit dolorem.', 79.00, 16, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (7, 'buPK6P9t29', 'Corrupti deserunt exercitationem quia et qui.', 23.00, 36, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (8, 'Y398m1WwN6', 'Placeat animi sapiente dignissimos voluptatum cumque.', 70.00, 16, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (9, 'FrH0RLUE59', 'Perferendis quia non saepe optio nihil.', 11.00, 20, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (10, 'Lvchka0UPa', 'Eos excepturi corrupti sit vel error facere tempora aut.', 81.00, 78, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (11, '38UGeuDYXG', 'Aliquid laboriosam tempora et unde eaque.', 56.00, 84, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (12, 'VFauDDplR3', 'Quae dolor facere dolore quibusdam optio dicta.', 34.00, 60, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (13, 'hvripuycDr', 'Dolor eum modi odio quos sit fugit veritatis sunt.', 40.00, 27, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (14, 'wqWwjTpNeu', 'Dignissimos occaecati enim et sed cupiditate corporis sequi.', 15.00, 67, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (15, 'Ege50NyYoA', 'Non quisquam odio a illo soluta est quibusdam.', 52.00, 85, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (16, 'RKa6BxWJA6', 'Cumque et est libero laboriosam delectus voluptates.', 90.00, 17, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (17, 'vCO7MRZOUX', 'Quaerat enim molestias eaque incidunt pariatur.', 10.00, 37, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (18, 'pACQW9S3gP', 'Temporibus expedita esse deleniti atque.', 69.00, 81, '2021-10-22 08:56:14', '2021-10-22 08:56:14');
INSERT INTO `products` VALUES (19, 'VzQ5Mj68GU', 'Quam laboriosam quod totam occaecati sed animi.', 92.00, 55, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (20, 'rzkhOJCzJG', 'Neque fugit laborum voluptas ut sapiente quibusdam fuga quisquam.', 47.00, 25, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (21, 'Fg4iLEKJwO', 'Mollitia voluptas quis eligendi animi ipsam.', 99.00, 54, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (22, 'wUaT7K5URL', 'Quod porro ut ipsum voluptas numquam iure.', 97.00, 39, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (23, 'dfvarBc1GA', 'Eius sed nihil error.', 15.00, 82, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (24, 'VfzLRnu7fU', 'Et atque eligendi eum.', 68.00, 34, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (25, '8rRoDyVr3u', 'Quis dolorem recusandae sit consequuntur.', 62.00, 65, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (26, '694Qx1u2Mz', 'Qui sint quisquam quidem laboriosam error totam.', 76.00, 33, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (27, 'EJM6H8TJ3T', 'Odit veritatis molestiae ea tenetur molestiae.', 26.00, 40, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (28, 'p3VPnq4C5W', 'Pariatur a consequatur aut distinctio animi est.', 94.00, 61, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (29, 'QcWEnrBfcI', 'Et tempora et dolorem rerum nihil tempore et.', 49.00, 68, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (30, 'GsyuOKPoVc', 'Cum unde earum a et consequatur iusto laboriosam.', 70.00, 45, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (31, 'yonPmThNPU', 'Voluptatem et aut amet veritatis.', 55.00, 36, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (32, '8sHFTqogVM', 'Temporibus nulla perferendis reiciendis.', 35.00, 42, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (33, 'h7WTMcyyVz', 'Nam excepturi sed dolor deserunt nemo esse.', 89.00, 54, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (34, 'A2TpzIZU5H', 'Velit voluptatibus adipisci molestias suscipit eum minima.', 45.00, 14, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (35, '9Pq1qKqtb6', 'Veritatis vel beatae et et quae commodi autem.', 83.00, 73, '2021-10-22 08:56:15', '2021-10-22 08:56:15');
INSERT INTO `products` VALUES (36, 'gYVxBj5ywT', 'Ut earum est ad repellat dignissimos.', 69.00, 31, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (37, 'Zjae4gNLVI', 'Sint fuga totam nisi.', 62.00, 64, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (38, 't30s1SPsZV', 'Veritatis ipsam aspernatur ut soluta quia et voluptas.', 65.00, 37, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (39, 'Ut475J2o8h', 'Id omnis id illo ex repellat iure qui eveniet.', 91.00, 49, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (40, 'gxuWPANk5a', 'Odio quia alias repellat nesciunt atque eum.', 10.00, 38, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (41, 'Mi6ljRijvE', 'Qui aut odio id itaque quia voluptatem.', 92.00, 46, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (42, 'y2euAJBSfo', 'Blanditiis suscipit non a.', 58.00, 61, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (43, 'KshKWZKr6K', 'Dolores et odio cumque voluptatem facilis eos mollitia similique.', 35.00, 29, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (44, 'b60TlprEbS', 'Porro delectus quae quis.', 21.00, 92, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (45, 'Ni79SOSB7B', 'Dolore facere error quia quia.', 63.00, 41, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (46, '5kqAtywPse', 'Fugiat ipsa dolor alias quas.', 73.00, 20, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (47, 'I2CHxwLpwz', 'Doloremque et porro dolor quia deleniti doloremque numquam.', 94.00, 33, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (48, 'H3DamKbSNV', 'Iste voluptas magni enim ut et aperiam aut fugit.', 93.00, 81, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (49, 'RIhAlKwjav', 'Sapiente aspernatur non qui sequi enim beatae eveniet.', 56.00, 23, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (50, 'pD1mtLWUDp', 'Ut doloremque laborum quasi illo reiciendis aut.', 61.00, 42, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (51, 'JWIYR3tN96', 'Et ut quibusdam architecto quaerat non.', 72.00, 61, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (52, 'mG0cFw98ce', 'Voluptas tenetur aliquid provident dolores.', 26.00, 62, '2021-10-22 08:56:16', '2021-10-22 08:56:16');
INSERT INTO `products` VALUES (53, 'N7DP830Mq4', 'Accusantium cumque et in rem.', 95.00, 57, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (54, '0ZOfV1pNgy', 'Omnis ipsum voluptates et culpa.', 35.00, 79, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (55, 'vs4Am6Wo1j', 'Culpa voluptate quod quod eligendi.', 18.00, 10, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (56, 'osU2ZOcvtE', 'Non harum inventore deserunt possimus.', 39.00, 51, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (57, 'BTmzKzv9S5', 'Explicabo sit deleniti et et nihil ut nobis dolorem.', 36.00, 57, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (58, 'VkWLg5twYE', 'Qui recusandae soluta incidunt consequuntur perspiciatis rem qui.', 82.00, 55, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (59, 'uNFJIGvfSh', 'Optio dolor ea deserunt doloremque.', 26.00, 64, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (60, 'HGL99T4V5F', 'Sint est minus dolor aut voluptatem.', 47.00, 65, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (61, 'NL93pBhyBS', 'Quis minima velit et hic ratione explicabo.', 51.00, 53, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (62, 'Y4IjKCcdUy', 'Asperiores nobis laudantium amet omnis est voluptates.', 12.00, 60, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (63, 'HyPHBTaMeE', 'Qui molestiae et suscipit et architecto optio ut sint.', 81.00, 84, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (64, 'cc28Wr1UoD', 'Animi eum est ut est occaecati et.', 36.00, 98, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (65, 'NIesYN1lAr', 'Nobis fugiat mollitia harum numquam.', 90.00, 18, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (66, 'WU9aVsTxdM', 'Dolores qui cupiditate consequatur alias vitae optio exercitationem.', 53.00, 42, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (67, 'lKr67VXtp9', 'Et quibusdam earum atque.', 62.00, 26, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (68, '7RwjDuBsvv', 'Tenetur eum unde dolorem omnis omnis minima voluptas.', 28.00, 39, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (69, 'KNf9hfGfvY', 'Pariatur nam est ut itaque.', 92.00, 31, '2021-10-22 08:56:17', '2021-10-22 08:56:17');
INSERT INTO `products` VALUES (70, 'gjENLsjlxm', 'Et quae distinctio ipsam itaque iusto vitae minus.', 21.00, 69, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (71, 'VD0kFqqKRM', 'Cupiditate inventore dolorum et ut ut ipsam.', 45.00, 70, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (72, 'xLBuFoYRAG', 'Inventore ex aut ut dolore voluptatem veniam.', 41.00, 71, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (73, 'RqEe7kpIwE', 'Quasi est voluptatum est possimus omnis.', 92.00, 42, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (74, 'EYvuwdeSGr', 'Consectetur esse unde doloremque enim praesentium quia sequi.', 44.00, 16, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (75, '7efdfUZ15Z', 'Iure illum dignissimos eveniet dolorem fuga.', 63.00, 24, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (76, '53mYRqXi49', 'Qui eligendi voluptas adipisci dolorem velit velit.', 13.00, 50, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (77, '0fUBhzcGq4', 'Ut commodi optio non.', 53.00, 83, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (78, '92nsFav4pH', 'Enim quidem in nesciunt voluptatum ea.', 16.00, 41, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (79, 'VTg50cMNEM', 'Quo ullam molestias est fugiat odit quia eius veritatis.', 22.00, 67, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (80, 'hFee1vOhcU', 'Est aut occaecati architecto occaecati sit est.', 37.00, 90, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (81, 'nsaUsRZgQx', 'Sint perspiciatis et sit atque.', 32.00, 12, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (82, '050sRl5Svx', 'Quia illo officia sint tenetur rem corporis aliquid saepe.', 96.00, 56, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (83, 'tinbAciwHY', 'Nihil aspernatur assumenda iusto voluptate cumque.', 73.00, 77, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (84, 'A1Wj93hKDW', 'In sapiente sint illo et quaerat non.', 42.00, 43, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (85, 'k5c0R5gSM2', 'Ea eum eos quod tempora.', 91.00, 44, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (86, '2qiznI9xN8', 'Ipsum modi quibusdam eum.', 44.00, 74, '2021-10-22 08:56:18', '2021-10-22 08:56:18');
INSERT INTO `products` VALUES (87, 'An7Dfms4Qa', 'Tempore consequuntur odio minima et.', 99.00, 100, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (88, 'lRj0TPkWLm', 'Id impedit et fuga numquam voluptas voluptas.', 40.00, 62, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (89, 'fgCeLqcs3V', 'Illo repellendus quo non sed suscipit.', 65.00, 50, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (90, 'IJyAG2sx49', 'Distinctio quo aliquid minus excepturi magni.', 18.00, 33, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (91, 'Ep2RPMSONG', 'Consequatur qui sint est voluptatem.', 16.00, 81, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (92, 'zd0HwPcWIj', 'Cum cumque labore blanditiis qui quia saepe est.', 25.00, 16, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (93, 'VNnm7YXE0e', 'Et inventore voluptatum id ipsam molestias.', 53.00, 56, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (94, 'OPMYdEQ8Cv', 'Saepe consequatur rerum debitis.', 51.00, 12, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (95, 'jbk30SvA85', 'Odio sed id dignissimos iste eligendi.', 24.00, 17, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (96, '2qjHHoElYI', 'Debitis voluptatem molestiae ratione beatae eligendi.', 72.00, 58, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (97, 'tcWmHOghgl', 'Consectetur nihil magnam qui libero voluptas.', 49.00, 21, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (98, 'GF2IML5hqN', 'Beatae nulla est minus dolores assumenda ullam.', 41.00, 62, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (99, 'e4CRkxN5Qt', 'Exercitationem sunt beatae et a quis.', 79.00, 56, '2021-10-22 08:56:19', '2021-10-22 08:56:19');
INSERT INTO `products` VALUES (100, 'DUQHCYiGs3', 'Incidunt animi dolores quos vero.', 34.00, 29, '2021-10-22 08:56:19', '2021-10-22 08:56:19');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
