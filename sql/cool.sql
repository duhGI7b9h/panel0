ALTER TABLE `coupon` ADD COLUMN `status` int(2) NOT NULL DEFAULT 1 AFTER `credit`;

ALTER TABLE `paylist` ADD COLUMN `shopid` int(11) NOT NULL DEFAULT 0 AFTER `datetime`;

ALTER TABLE `paylist` ADD COLUMN `coupon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `shopid`;

ALTER TABLE `paylist` ADD COLUMN `autorenew` int(1) NULL DEFAULT 0 AFTER `coupon`;

ALTER TABLE `paylist` ADD COLUMN `closerenew` int(1) NULL DEFAULT 1 AFTER `autorenew`;

ALTER TABLE `paylist` ADD COLUMN `traffic` int(11) NULL DEFAULT 1 AFTER `closerenew`;

ALTER TABLE `ss_invite_code` MODIFY COLUMN `updated_at` timestamp(0) NOT NULL DEFAULT '2016-06-01 08:00:00' AFTER `created_at`;

ALTER TABLE `ss_node` COLLATE = utf8mb4_general_ci, ROW_FORMAT = COMPACT;

ALTER TABLE `ss_node` MODIFY COLUMN `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL AFTER `id`;

ALTER TABLE `ss_node` MODIFY COLUMN `server` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL AFTER `type`;

ALTER TABLE `ss_node` MODIFY COLUMN `method` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL AFTER `server`;

ALTER TABLE `ss_node` MODIFY COLUMN `info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL AFTER `method`;

ALTER TABLE `ss_node` MODIFY COLUMN `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL AFTER `info`;

ALTER TABLE `ss_node` MODIFY COLUMN `node_ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `node_heartbeat`;

ALTER TABLE `ss_node` ADD COLUMN `sort2` int(32) NULL DEFAULT NULL AFTER `mu_only`;

ALTER TABLE `user` MODIFY COLUMN `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL AFTER `id`;

ALTER TABLE `user` MODIFY COLUMN `plan` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'A' AFTER `d`;

ALTER TABLE `user` ADD COLUMN `quantitypay` int(11) NULL DEFAULT 0 AFTER `node_connector`;

ALTER TABLE `user` ADD COLUMN `ref_accid` int(1) NULL DEFAULT 0 AFTER `telegram_id`;

ALTER TABLE `user` ADD COLUMN `ref_acc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `ref_accid`;

ALTER TABLE `user` ADD COLUMN `ref_money` decimal(12, 2) NOT NULL DEFAULT 0.00 AFTER `ref_acc`;

ALTER TABLE `user` ADD COLUMN `agent_id` int(11) NOT NULL DEFAULT 0 AFTER `ref_money`;

ALTER TABLE `user` ADD COLUMN `is_agent` int(11) NULL DEFAULT 0 AFTER `agent_id`;

ALTER TABLE `user` ADD COLUMN `c_rebate` int(11) NOT NULL DEFAULT 0 AFTER `is_agent`;

ALTER TABLE `user` ADD COLUMN `rebate` int(11) NOT NULL DEFAULT -1 AFTER `c_rebate`;

ALTER TABLE `user` ADD COLUMN `back_money` decimal(12, 2) NOT NULL DEFAULT 0.00 AFTER `rebate`;

ALTER TABLE `user` ADD COLUMN `creta` int(2) NULL DEFAULT 0 AFTER `back_money`;

ALTER TABLE `user` ADD COLUMN `ssrlink` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `creta`;

ALTER TABLE `user_subscribe_log` MODIFY COLUMN `subscribe_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '获取的订阅类型' AFTER `email`;

ALTER TABLE `user_subscribe_log` MODIFY COLUMN `request_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求 IP' AFTER `subscribe_type`;

ALTER TABLE `user_subscribe_log` MODIFY COLUMN `request_time` datetime(0) NULL DEFAULT NULL COMMENT '请求时间' AFTER `request_ip`;

ALTER TABLE user ADD COLUMN uuid TEXT NULL DEFAULT NULL COMMENT 'uuid' AFTER passwd;

ALTER TABLE bought ADD is_notified BOOLEAN NOT NULL DEFAULT FALSE AFTER price;

ALTER TABLE user ADD expire_notified BOOLEAN NOT NULL DEFAULT FALSE AFTER telegram_id, ADD traffic_notified BOOLEAN NULL DEFAULT FALSE AFTER expire_notified;

ALTER TABLE ss_node ADD online BOOLEAN NOT NULL DEFAULT TRUE AFTER mu_only, ADD gfw_block BOOLEAN NOT NULL DEFAULT FALSE AFTER online;

CREATE TABLE `ss_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;