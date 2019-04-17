#数据库初始化脚本

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知通告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_notify
-- ----------------------------
INSERT INTO `oa_notify` VALUES (41, '3', '十九大召开了', '十九大召开了，竟然没邀请我', '', '1', 1, NULL, NULL, '2017-10-10 17:21:11', '', NULL);
INSERT INTO `oa_notify` VALUES (42, '3', '苹果发布新手机了', '有全面屏的iphoneX', '', '1', 1, NULL, NULL, '2017-10-10 18:51:14', '', NULL);
INSERT INTO `oa_notify` VALUES (43, '3', '十九大要消灭贫困人口', '我还只有两三年的活头了', '', '1', 1, NULL, NULL, '2017-10-11 09:56:35', '', NULL);
INSERT INTO `oa_notify` VALUES (44, '3', '骑士又输了', '捉急', '', '1', 1, NULL, NULL, '2017-10-26 13:59:34', '', NULL);
INSERT INTO `oa_notify` VALUES (45, '3', '火箭5连败', '没有保罗不行呀', '', '1', 1, NULL, NULL, '2017-12-30 12:10:20', '', NULL);
INSERT INTO `oa_notify` VALUES (46, '3', 'asdasd', 'asdasdsad', NULL, '1', 1, NULL, NULL, '2019-04-17 17:32:54', '', NULL);

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notify_id` bigint(20) NULL DEFAULT NULL COMMENT '通知通告ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '接受人',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '阅读标记',
  `read_date` date NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_record_notify_id`(`notify_id`) USING BTREE,
  INDEX `oa_notify_record_user_id`(`user_id`) USING BTREE,
  INDEX `oa_notify_record_read_flag`(`is_read`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知通告发送记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_notify_record
-- ----------------------------
INSERT INTO `oa_notify_record` VALUES (18, 41, 1, 1, '2017-10-26');
INSERT INTO `oa_notify_record` VALUES (19, 42, 1, 1, '2017-10-26');
INSERT INTO `oa_notify_record` VALUES (20, 43, 136, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (21, 43, 133, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (22, 43, 130, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (23, 43, 1, 1, '2017-10-26');
INSERT INTO `oa_notify_record` VALUES (24, 44, 1, 1, '2017-12-29');
INSERT INTO `oa_notify_record` VALUES (25, 45, 1, 1, '2018-01-07');
INSERT INTO `oa_notify_record` VALUES (26, 45, 135, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (27, 46, 132, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (28, 46, 136, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (29, 46, 130, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (30, 46, 134, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (31, 46, 36, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (32, 46, 135, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (33, 46, 131, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (34, 46, 124, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (35, 46, 123, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (36, 46, 2, 0, NULL);
INSERT INTO `oa_notify_record` VALUES (37, 46, 1, 1, '2019-04-17');
INSERT INTO `oa_notify_record` VALUES (38, 46, 11, 0, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (6, 0, '研发部', 1, 1);
INSERT INTO `sys_dept` VALUES (7, 6, '研發一部', 1, 1);
INSERT INTO `sys_dept` VALUES (8, 6, '研发二部', 2, 1);
INSERT INTO `sys_dept` VALUES (9, 0, '销售部', 2, 1);
INSERT INTO `sys_dept` VALUES (10, 9, '销售一部', 1, 1);
INSERT INTO `sys_dept` VALUES (11, 0, '产品部', 3, 1);
INSERT INTO `sys_dept` VALUES (12, 11, '产品一部', 1, 1);
INSERT INTO `sys_dept` VALUES (13, 0, '测试部', 5, 1);
INSERT INTO `sys_dept` VALUES (14, 13, '测试一部', 1, 1);
INSERT INTO `sys_dept` VALUES (15, 13, '测试二部', 2, 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '父级编号',
  `create_by` int(64) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '正常', '0', 'del_flag', '删除标记', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (3, '显示', '1', 'show_hide', '显示/隐藏', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (4, '隐藏', '0', 'show_hide', '显示/隐藏', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (5, '是', '1', 'yes_no', '是/否', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (6, '否', '0', 'yes_no', '是/否', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (7, '红色', 'red', 'color', '颜色值', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (8, '绿色', 'green', 'color', '颜色值', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (9, '蓝色', 'blue', 'color', '颜色值', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (10, '黄色', 'yellow', 'color', '颜色值', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (11, '橙色', 'orange', 'color', '颜色值', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (12, '默认主题', 'default', 'theme', '主题方案', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (13, '天蓝主题', 'cerulean', 'theme', '主题方案', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (14, '橙色主题', 'readable', 'theme', '主题方案', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (15, '红色主题', 'united', 'theme', '主题方案', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (16, 'Flat主题', 'flat', 'theme', '主题方案', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (21, '公司', '1', 'sys_office_type', '机构类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (22, '部门', '2', 'sys_office_type', '机构类型', 70, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (23, '小组', '3', 'sys_office_type', '机构类型', 80, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (24, '其它', '4', 'sys_office_type', '机构类型', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (25, '综合部', '1', 'sys_office_common', '快捷通用部门', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (26, '开发部', '2', 'sys_office_common', '快捷通用部门', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (27, '人力部', '3', 'sys_office_common', '快捷通用部门', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (28, '一级', '1', 'sys_office_grade', '机构等级', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (29, '二级', '2', 'sys_office_grade', '机构等级', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (30, '三级', '3', 'sys_office_grade', '机构等级', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (31, '四级', '4', 'sys_office_grade', '机构等级', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (32, '所有数据', '1', 'sys_data_scope', '数据范围', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (33, '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (34, '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (35, '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (36, '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (37, '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (38, '按明细设置', '9', 'sys_data_scope', '数据范围', 100, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (42, '基础主题', 'basic', 'cms_theme', '站点主题', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (43, '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (44, '红色主题', 'red', 'cms_theme', '站点主题', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (45, '文章模型', 'article', 'cms_module', '栏目模型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (46, '图片模型', 'picture', 'cms_module', '栏目模型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (47, '下载模型', 'download', 'cms_module', '栏目模型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (48, '链接模型', 'link', 'cms_module', '栏目模型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (49, '专题模型', 'special', 'cms_module', '栏目模型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (50, '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (51, '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (52, '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (53, '发布', '0', 'cms_del_flag', '内容状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (54, '删除', '1', 'cms_del_flag', '内容状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (55, '审核', '2', 'cms_del_flag', '内容状态', 15, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (56, '首页焦点图', '1', 'cms_posid', '推荐位', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (57, '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (58, '咨询', '1', 'cms_guestbook', '留言板分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (59, '建议', '2', 'cms_guestbook', '留言板分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (60, '投诉', '3', 'cms_guestbook', '留言板分类', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (61, '其它', '4', 'cms_guestbook', '留言板分类', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (62, '公休', '1', 'oa_leave_type', '请假类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (63, '病假', '2', 'oa_leave_type', '请假类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (64, '事假', '3', 'oa_leave_type', '请假类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (65, '调休', '4', 'oa_leave_type', '请假类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (66, '婚假', '5', 'oa_leave_type', '请假类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (67, '接入日志', '1', 'sys_log_type', '日志类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (68, '异常日志', '2', 'sys_log_type', '日志类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (69, '请假流程', 'leave', 'act_type', '流程类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (70, '审批测试流程', 'test_audit', 'act_type', '流程类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (71, '分类1', '1', 'act_category', '流程分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (72, '分类2', '2', 'act_category', '流程分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (73, '增删改查', 'crud', 'gen_category', '代码生成分类', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (74, '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (75, '树结构', 'tree', 'gen_category', '代码生成分类', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (76, '=', '=', 'gen_query_type', '查询方式', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (77, '!=', '!=', 'gen_query_type', '查询方式', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (78, '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (79, '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (80, 'Between', 'between', 'gen_query_type', '查询方式', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (81, 'Like', 'like', 'gen_query_type', '查询方式', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (82, 'Left Like', 'left_like', 'gen_query_type', '查询方式', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (83, 'Right Like', 'right_like', 'gen_query_type', '查询方式', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (84, '文本框', 'input', 'gen_show_type', '字段生成方案', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (85, '文本域', 'textarea', 'gen_show_type', '字段生成方案', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (86, '下拉框', 'select', 'gen_show_type', '字段生成方案', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (87, '复选框', 'checkbox', 'gen_show_type', '字段生成方案', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (88, '单选框', 'radiobox', 'gen_show_type', '字段生成方案', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (89, '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (90, '人员选择', 'userselect', 'gen_show_type', '字段生成方案', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (91, '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (92, '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (95, '仅持久层', 'dao', 'gen_category', '代码生成分类', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (96, '男', '1', 'sex', '性别', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (97, '女', '2', 'sex', '性别', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (105, '会议通告', '1', 'oa_notify_type', '通知通告类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (106, '奖惩通告', '2', 'oa_notify_type', '通知通告类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (107, '活动通告', '3', 'oa_notify_type', '通知通告类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (108, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (109, '发布', '1', 'oa_notify_status', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (110, '未读', '0', 'oa_notify_read', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (111, '已读', '1', 'oa_notify_read', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (112, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (113, '删除', '0', 'del_flag', '删除标记', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (118, '关于', 'about', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES (119, '交流', 'communication', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (120, '文章', 'article', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (121, '编码', 'code', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (122, '绘画', 'painting', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (110, 0, '/files/d64a62e3-6821-48f1-bac6-a1b9945f4afb.jpg', '2017-10-14 16:20:17');
INSERT INTO `sys_file` VALUES (111, 0, '/files/aa2c3dc6-495f-48cc-8e12-446eceb2535e.jpg', '2017-10-14 16:20:21');
INSERT INTO `sys_file` VALUES (118, 0, '/files/a973499e-3ec7-4d43-8a52-b6f6517c77e3.jpg', '2017-10-20 11:53:52');
INSERT INTO `sys_file` VALUES (132, 0, '/files/e6f13526-e31c-4ebe-a3cf-5fd88dd10be6.jpg', '2017-12-18 20:19:51');
INSERT INTO `sys_file` VALUES (134, 0, '/files/cd016e72-77f7-4425-afe2-b79dfbdc3ae9.jpeg', '2017-12-18 22:44:07');
INSERT INTO `sys_file` VALUES (138, 0, '/files/9ec12ee7-65b5-4cc5-9900-d2ec6185b336.jpg', '2017-12-19 19:55:27');
INSERT INTO `sys_file` VALUES (139, 0, '/files/f6aab9d4-00a1-4bc8-a695-40fc472d4ea9.jpg', '2018-01-02 19:53:24');
INSERT INTO `sys_file` VALUES (141, 0, '/files/445c5d98-b3b6-4226-a5af-249d1b2a6a34.jpg', '2018-01-09 19:28:53');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 730 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (609, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-07 17:01:17');
INSERT INTO `sys_log` VALUES (610, -1, '获取用户信息为空', '登录', 17, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-07 17:01:26');
INSERT INTO `sys_log` VALUES (611, -1, '获取用户信息为空', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-07 17:01:31');
INSERT INTO `sys_log` VALUES (612, 1, 'admin', '登录', 8, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-07 17:01:33');
INSERT INTO `sys_log` VALUES (613, 1, 'admin', '请求访问主页', 33, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-07 17:01:34');
INSERT INTO `sys_log` VALUES (614, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 10:58:52');
INSERT INTO `sys_log` VALUES (615, -1, '获取用户信息为空', '登录', 13, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 10:58:57');
INSERT INTO `sys_log` VALUES (616, 1, 'admin', '登录', 8, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 10:59:02');
INSERT INTO `sys_log` VALUES (617, 1, 'admin', '请求访问主页', 36, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 10:59:02');
INSERT INTO `sys_log` VALUES (618, 1, 'admin', '登录', 20, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 11:33:47');
INSERT INTO `sys_log` VALUES (619, 1, 'admin', '请求访问主页', 31, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 11:33:47');
INSERT INTO `sys_log` VALUES (620, -1, '获取用户信息为空', '登录', 15, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 13:06:07');
INSERT INTO `sys_log` VALUES (621, 1, 'admin', '登录', 8, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 13:06:15');
INSERT INTO `sys_log` VALUES (622, 1, 'admin', '请求访问主页', 32, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 13:06:15');
INSERT INTO `sys_log` VALUES (623, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 13:59:44');
INSERT INTO `sys_log` VALUES (624, 1, 'admin', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 13:59:50');
INSERT INTO `sys_log` VALUES (625, 1, 'admin', '请求访问主页', 10, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 13:59:50');
INSERT INTO `sys_log` VALUES (626, 1, 'admin', '登录', 30, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 14:01:39');
INSERT INTO `sys_log` VALUES (627, 1, 'admin', '请求访问主页', 106, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 14:01:39');
INSERT INTO `sys_log` VALUES (628, 1, 'admin', '登录', 28, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 14:47:48');
INSERT INTO `sys_log` VALUES (629, 1, 'admin', '请求访问主页', 53, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 14:47:48');
INSERT INTO `sys_log` VALUES (630, 1, 'admin', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 15:32:23');
INSERT INTO `sys_log` VALUES (631, 1, 'admin', '请求访问主页', 13, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 15:32:23');
INSERT INTO `sys_log` VALUES (632, -1, '获取用户信息为空', '登录', 10, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:32:57');
INSERT INTO `sys_log` VALUES (633, -1, '获取用户信息为空', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:33:01');
INSERT INTO `sys_log` VALUES (634, -1, '获取用户信息为空', '登录', 4, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:33:07');
INSERT INTO `sys_log` VALUES (635, -1, '获取用户信息为空', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:33:20');
INSERT INTO `sys_log` VALUES (636, -1, '获取用户信息为空', '登录', 53362, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:34:45');
INSERT INTO `sys_log` VALUES (637, -1, '获取用户信息为空', '登录', 47821, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:35:37');
INSERT INTO `sys_log` VALUES (638, 1, 'admin', '登录', 4118, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:35:45');
INSERT INTO `sys_log` VALUES (639, 1, 'admin', '请求访问主页', 61, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 16:35:45');
INSERT INTO `sys_log` VALUES (640, 1, 'admin', '登录', 5396, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:36:08');
INSERT INTO `sys_log` VALUES (641, 1, 'admin', '请求访问主页', 16, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 16:36:08');
INSERT INTO `sys_log` VALUES (642, 1, 'admin', '登录', 27, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-08 16:37:23');
INSERT INTO `sys_log` VALUES (643, 1, 'admin', '请求访问主页', 83, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-08 16:37:23');
INSERT INTO `sys_log` VALUES (644, 1, 'admin', '登录', 53, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-09 11:45:58');
INSERT INTO `sys_log` VALUES (645, 1, 'admin', '请求访问主页', 114, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-09 11:45:59');
INSERT INTO `sys_log` VALUES (646, 1, 'admin', '登录', 9, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-09 13:53:29');
INSERT INTO `sys_log` VALUES (647, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-09 13:53:29');
INSERT INTO `sys_log` VALUES (648, 1, 'admin', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-09 14:02:49');
INSERT INTO `sys_log` VALUES (649, 1, 'admin', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-09 14:02:49');
INSERT INTO `sys_log` VALUES (650, 1, 'admin', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-09 14:05:34');
INSERT INTO `sys_log` VALUES (651, 1, 'admin', '登录', 28, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-09 15:05:45');
INSERT INTO `sys_log` VALUES (652, 1, 'admin', '请求访问主页', 122, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-09 15:05:46');
INSERT INTO `sys_log` VALUES (653, -1, '获取用户信息为空', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:14');
INSERT INTO `sys_log` VALUES (654, -1, '获取用户信息为空', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:15');
INSERT INTO `sys_log` VALUES (655, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:16');
INSERT INTO `sys_log` VALUES (656, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:17');
INSERT INTO `sys_log` VALUES (657, -1, '获取用户信息为空', '登录', 1, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:17');
INSERT INTO `sys_log` VALUES (658, -1, '获取用户信息为空', '登录', 0, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:17');
INSERT INTO `sys_log` VALUES (659, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:17');
INSERT INTO `sys_log` VALUES (660, -1, '获取用户信息为空', '登录', 1, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:18');
INSERT INTO `sys_log` VALUES (661, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:54:26');
INSERT INTO `sys_log` VALUES (662, -1, '获取用户信息为空', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:55:06');
INSERT INTO `sys_log` VALUES (663, 1, 'admin', '登录', 30844, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:56:29');
INSERT INTO `sys_log` VALUES (664, -1, '获取用户信息为空', '登录', 11683, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:56:54');
INSERT INTO `sys_log` VALUES (665, -1, '获取用户信息为空', '登录', 5620, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:57:05');
INSERT INTO `sys_log` VALUES (666, 1, 'admin', '登录', 6, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:57:16');
INSERT INTO `sys_log` VALUES (667, 1, 'admin', '请求访问主页', 90, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 08:57:16');
INSERT INTO `sys_log` VALUES (668, -1, '获取用户信息为空', '登录', 1, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 08:57:45');
INSERT INTO `sys_log` VALUES (669, 1, 'admin', '登录', 29, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 09:03:45');
INSERT INTO `sys_log` VALUES (670, 1, 'admin', '请求访问主页', 65, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 09:03:45');
INSERT INTO `sys_log` VALUES (671, 1, 'admin', '登录', 30, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 09:17:00');
INSERT INTO `sys_log` VALUES (672, 1, 'admin', '请求访问主页', 54, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 09:17:00');
INSERT INTO `sys_log` VALUES (673, 1, 'admin', '登录', 27, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 09:39:07');
INSERT INTO `sys_log` VALUES (674, 1, 'admin', '请求访问主页', 65, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 09:39:07');
INSERT INTO `sys_log` VALUES (675, 1, 'admin', '登录', 26, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 09:58:48');
INSERT INTO `sys_log` VALUES (676, 1, 'admin', '请求访问主页', 73, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 09:58:48');
INSERT INTO `sys_log` VALUES (677, 1, 'admin', '登录', 23, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 10:04:06');
INSERT INTO `sys_log` VALUES (678, 1, 'admin', '请求访问主页', 55, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 10:04:06');
INSERT INTO `sys_log` VALUES (679, 1, 'admin', '登录', 25, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 10:26:49');
INSERT INTO `sys_log` VALUES (680, 1, 'admin', '请求访问主页', 57, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 10:26:49');
INSERT INTO `sys_log` VALUES (681, 1, 'admin', '登录', 7349, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-11 10:39:46');
INSERT INTO `sys_log` VALUES (682, 1, 'admin', '请求访问主页', 84, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-11 10:39:47');
INSERT INTO `sys_log` VALUES (683, 1, 'admin', '登录', 32, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-14 11:02:31');
INSERT INTO `sys_log` VALUES (684, 1, 'admin', '请求访问主页', 89, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-14 11:02:31');
INSERT INTO `sys_log` VALUES (685, -1, '获取用户信息为空', '登录', 24, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-04-17 10:32:48');
INSERT INTO `sys_log` VALUES (686, -1, '获取用户信息为空', '登录', 4, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-04-17 10:32:50');
INSERT INTO `sys_log` VALUES (687, 1, 'admin', '登录', 5, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-04-17 10:32:53');
INSERT INTO `sys_log` VALUES (688, 1, 'admin', '请求访问主页', 61, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 10:32:53');
INSERT INTO `sys_log` VALUES (689, 1, 'admin', '请求访问主页', 14, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 10:39:29');
INSERT INTO `sys_log` VALUES (690, 1, 'admin', '登录', 22, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-04-17 17:32:01');
INSERT INTO `sys_log` VALUES (691, 1, 'admin', '请求访问主页', 62, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 17:32:01');
INSERT INTO `sys_log` VALUES (692, 1, 'admin', '删除菜单', 6, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:34:59');
INSERT INTO `sys_log` VALUES (693, 1, 'admin', '删除菜单', 7, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:35:03');
INSERT INTO `sys_log` VALUES (694, 1, 'admin', '删除菜单', 6, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:35:29');
INSERT INTO `sys_log` VALUES (695, 1, 'admin', '删除菜单', 6, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:35:36');
INSERT INTO `sys_log` VALUES (696, 1, 'admin', '删除菜单', 4, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:35:41');
INSERT INTO `sys_log` VALUES (697, 1, 'admin', '删除菜单', 5, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:35:44');
INSERT INTO `sys_log` VALUES (698, 1, 'admin', '删除菜单', 5, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:35:47');
INSERT INTO `sys_log` VALUES (699, 1, 'admin', '删除菜单', 8, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:35:49');
INSERT INTO `sys_log` VALUES (700, 1, 'admin', '请求访问主页', 13, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 17:35:54');
INSERT INTO `sys_log` VALUES (701, 1, 'admin', 'error', NULL, 'http://localhost/index', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-04-17 17:38:06');
INSERT INTO `sys_log` VALUES (702, 1, 'admin', '请求访问主页', 8, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 17:38:08');
INSERT INTO `sys_log` VALUES (703, NULL, NULL, 'error', NULL, 'http://localhost/', 'java.lang.NullPointerException', NULL, '2019-04-17 17:43:20');
INSERT INTO `sys_log` VALUES (704, NULL, NULL, 'error', NULL, 'http://localhost/', 'java.lang.NullPointerException', NULL, '2019-04-17 17:43:34');
INSERT INTO `sys_log` VALUES (705, NULL, NULL, 'error', NULL, 'http://localhost/', 'java.lang.NullPointerException', NULL, '2019-04-17 17:44:58');
INSERT INTO `sys_log` VALUES (706, -1, '获取用户信息为空', '请求访问主页', 4, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 17:48:12');
INSERT INTO `sys_log` VALUES (707, 1, 'admin', '登录', 49, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-04-17 17:52:34');
INSERT INTO `sys_log` VALUES (708, 1, 'admin', '请求访问主页', 74, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 17:52:35');
INSERT INTO `sys_log` VALUES (709, 1, 'admin', '删除菜单', 7, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:55:48');
INSERT INTO `sys_log` VALUES (710, 1, 'admin', '删除菜单', 7, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:55:56');
INSERT INTO `sys_log` VALUES (711, 1, 'admin', '删除菜单', 6, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:55:59');
INSERT INTO `sys_log` VALUES (712, 1, 'admin', '删除菜单', 5, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:56:01');
INSERT INTO `sys_log` VALUES (713, 1, 'admin', '删除菜单', 7, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:56:03');
INSERT INTO `sys_log` VALUES (714, 1, 'admin', '删除菜单', 5, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:56:05');
INSERT INTO `sys_log` VALUES (715, 1, 'admin', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 17:56:10');
INSERT INTO `sys_log` VALUES (716, 1, 'admin', '请求访问主页', 6, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 17:56:13');
INSERT INTO `sys_log` VALUES (717, 1, 'admin', '删除菜单', 4, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-04-17 17:56:24');
INSERT INTO `sys_log` VALUES (718, 1, 'admin', '请求访问主页', 14, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:05:39');
INSERT INTO `sys_log` VALUES (719, 1, 'admin', '登录', 57, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-04-17 18:10:10');
INSERT INTO `sys_log` VALUES (720, 1, 'admin', '请求访问主页', 74, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:10:10');
INSERT INTO `sys_log` VALUES (721, 1, 'admin', '编辑用户', 21, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2019-04-17 18:10:34');
INSERT INTO `sys_log` VALUES (722, 1, 'admin', '编辑用户', 16, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2019-04-17 18:10:55');
INSERT INTO `sys_log` VALUES (723, 1, 'admin', '请求访问主页', 15, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:14:11');
INSERT INTO `sys_log` VALUES (724, -1, '获取用户信息为空', '请求访问主页', 0, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:14:15');
INSERT INTO `sys_log` VALUES (725, 1, 'admin', '登录', 5, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-04-17 18:14:20');
INSERT INTO `sys_log` VALUES (726, 1, 'admin', '请求访问主页', 8, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:14:20');
INSERT INTO `sys_log` VALUES (727, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:14:34');
INSERT INTO `sys_log` VALUES (728, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:16:20');
INSERT INTO `sys_log` VALUES (729, 1, 'admin', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-04-17 18:16:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '基础管理', '', '', 0, 'fa fa-bars', 0, '2017-08-09 22:49:47', NULL);
INSERT INTO `sys_menu` VALUES (2, 3, '系统菜单', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 0, '系统管理', NULL, NULL, 0, 'fa fa-desktop', 1, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES (6, 3, '用户管理', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 0, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, '角色管理', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 1, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` VALUES (12, 6, '新增', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu` VALUES (13, 6, '编辑', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu` VALUES (14, 6, '删除', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu` VALUES (15, 7, '新增', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu` VALUES (20, 2, '新增', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu` VALUES (21, 2, '编辑', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu` VALUES (22, 2, '删除', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu` VALUES (24, 6, '批量删除', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu` VALUES (25, 6, '停用', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL);
INSERT INTO `sys_menu` VALUES (26, 6, '重置密码', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu` VALUES (27, 91, '系统日志', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` VALUES (28, 27, '刷新', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu` VALUES (29, 27, '删除', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu` VALUES (30, 27, '清空', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu` VALUES (48, 77, '代码生成', 'common/generator', 'common:generator', 1, 'fa fa-code', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (55, 7, '编辑', '', 'sys:role:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (56, 7, '删除', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (57, 91, '运行监控', '/druid/index.html', '', 1, 'fa fa-caret-square-o-right', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (61, 2, '批量删除', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (62, 7, '批量删除', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (71, 1, '文件管理', '/common/sysFile', 'common:sysFile:sysFile', 1, 'fa fa-folder-open', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (72, 77, '计划任务', 'common/job', 'common:taskScheduleJob', 1, 'fa fa-hourglass-1', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, 3, '部门管理', '/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, 73, '增加', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, 73, '刪除', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, 73, '编辑', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, 0, '系统工具', '', '', 0, 'fa fa-gear', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, 1, '数据字典', '/common/dict', 'common:dict:dict', 1, 'fa fa-book', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, 78, '增加', '/common/dict/add', 'common:dict:add', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, 78, '编辑', '/common/dict/edit', 'common:dict:edit', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (81, 78, '删除', '/common/dict/remove', 'common:dict:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, 78, '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', 2, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (84, 0, '办公管理', '', '', 0, 'fa fa-laptop', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (85, 84, '通知公告', 'oa/notify', 'oa:notify:notify', 1, 'fa fa-pencil-square', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (86, 85, '新增', 'oa/notify/add', 'oa:notify:add', 2, 'fa fa-plus', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (87, 85, '编辑', 'oa/notify/edit', 'oa:notify:edit', 2, 'fa fa-pencil-square-o', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (88, 85, '删除', 'oa/notify/remove', 'oa:notify:remove', 2, 'fa fa-minus', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (89, 85, '批量删除', 'oa/notify/batchRemove', 'oa:notify:batchRemove', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (90, 84, '我的通知', 'oa/notify/selfNotify', '', 1, 'fa fa-envelope-square', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, 0, '系统监控', '', '', 0, 'fa fa-video-camera', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, 91, '在线用户', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, 77, 'swagger', '/swagger-ui.html', '', 1, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级用户角色', 'admin', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES (59, '普通用户', NULL, '基本用户权限', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3284 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (367, 44, 1);
INSERT INTO `sys_role_menu` VALUES (368, 44, 32);
INSERT INTO `sys_role_menu` VALUES (369, 44, 33);
INSERT INTO `sys_role_menu` VALUES (370, 44, 34);
INSERT INTO `sys_role_menu` VALUES (371, 44, 35);
INSERT INTO `sys_role_menu` VALUES (372, 44, 28);
INSERT INTO `sys_role_menu` VALUES (373, 44, 29);
INSERT INTO `sys_role_menu` VALUES (374, 44, 30);
INSERT INTO `sys_role_menu` VALUES (375, 44, 38);
INSERT INTO `sys_role_menu` VALUES (376, 44, 4);
INSERT INTO `sys_role_menu` VALUES (377, 44, 27);
INSERT INTO `sys_role_menu` VALUES (378, 45, 38);
INSERT INTO `sys_role_menu` VALUES (379, 46, 3);
INSERT INTO `sys_role_menu` VALUES (380, 46, 20);
INSERT INTO `sys_role_menu` VALUES (381, 46, 21);
INSERT INTO `sys_role_menu` VALUES (382, 46, 22);
INSERT INTO `sys_role_menu` VALUES (383, 46, 23);
INSERT INTO `sys_role_menu` VALUES (384, 46, 11);
INSERT INTO `sys_role_menu` VALUES (385, 46, 12);
INSERT INTO `sys_role_menu` VALUES (386, 46, 13);
INSERT INTO `sys_role_menu` VALUES (387, 46, 14);
INSERT INTO `sys_role_menu` VALUES (388, 46, 24);
INSERT INTO `sys_role_menu` VALUES (389, 46, 25);
INSERT INTO `sys_role_menu` VALUES (390, 46, 26);
INSERT INTO `sys_role_menu` VALUES (391, 46, 15);
INSERT INTO `sys_role_menu` VALUES (392, 46, 2);
INSERT INTO `sys_role_menu` VALUES (393, 46, 6);
INSERT INTO `sys_role_menu` VALUES (394, 46, 7);
INSERT INTO `sys_role_menu` VALUES (598, 50, 38);
INSERT INTO `sys_role_menu` VALUES (632, 38, 42);
INSERT INTO `sys_role_menu` VALUES (737, 51, 38);
INSERT INTO `sys_role_menu` VALUES (738, 51, 39);
INSERT INTO `sys_role_menu` VALUES (739, 51, 40);
INSERT INTO `sys_role_menu` VALUES (740, 51, 41);
INSERT INTO `sys_role_menu` VALUES (741, 51, 4);
INSERT INTO `sys_role_menu` VALUES (742, 51, 32);
INSERT INTO `sys_role_menu` VALUES (743, 51, 33);
INSERT INTO `sys_role_menu` VALUES (744, 51, 34);
INSERT INTO `sys_role_menu` VALUES (745, 51, 35);
INSERT INTO `sys_role_menu` VALUES (746, 51, 27);
INSERT INTO `sys_role_menu` VALUES (747, 51, 28);
INSERT INTO `sys_role_menu` VALUES (748, 51, 29);
INSERT INTO `sys_role_menu` VALUES (749, 51, 30);
INSERT INTO `sys_role_menu` VALUES (750, 51, 1);
INSERT INTO `sys_role_menu` VALUES (1064, 54, 53);
INSERT INTO `sys_role_menu` VALUES (1095, 55, 2);
INSERT INTO `sys_role_menu` VALUES (1096, 55, 6);
INSERT INTO `sys_role_menu` VALUES (1097, 55, 7);
INSERT INTO `sys_role_menu` VALUES (1098, 55, 3);
INSERT INTO `sys_role_menu` VALUES (1099, 55, 50);
INSERT INTO `sys_role_menu` VALUES (1100, 55, 49);
INSERT INTO `sys_role_menu` VALUES (1101, 55, 1);
INSERT INTO `sys_role_menu` VALUES (1856, 53, 28);
INSERT INTO `sys_role_menu` VALUES (1857, 53, 29);
INSERT INTO `sys_role_menu` VALUES (1858, 53, 30);
INSERT INTO `sys_role_menu` VALUES (1859, 53, 27);
INSERT INTO `sys_role_menu` VALUES (1860, 53, 57);
INSERT INTO `sys_role_menu` VALUES (1861, 53, 71);
INSERT INTO `sys_role_menu` VALUES (1862, 53, 48);
INSERT INTO `sys_role_menu` VALUES (1863, 53, 72);
INSERT INTO `sys_role_menu` VALUES (1864, 53, 1);
INSERT INTO `sys_role_menu` VALUES (1865, 53, 7);
INSERT INTO `sys_role_menu` VALUES (1866, 53, 55);
INSERT INTO `sys_role_menu` VALUES (1867, 53, 56);
INSERT INTO `sys_role_menu` VALUES (1868, 53, 62);
INSERT INTO `sys_role_menu` VALUES (1869, 53, 15);
INSERT INTO `sys_role_menu` VALUES (1870, 53, 2);
INSERT INTO `sys_role_menu` VALUES (1871, 53, 61);
INSERT INTO `sys_role_menu` VALUES (1872, 53, 20);
INSERT INTO `sys_role_menu` VALUES (1873, 53, 21);
INSERT INTO `sys_role_menu` VALUES (1874, 53, 22);
INSERT INTO `sys_role_menu` VALUES (2084, 56, 68);
INSERT INTO `sys_role_menu` VALUES (2085, 56, 60);
INSERT INTO `sys_role_menu` VALUES (2086, 56, 59);
INSERT INTO `sys_role_menu` VALUES (2087, 56, 58);
INSERT INTO `sys_role_menu` VALUES (2088, 56, 51);
INSERT INTO `sys_role_menu` VALUES (2089, 56, 50);
INSERT INTO `sys_role_menu` VALUES (2090, 56, 49);
INSERT INTO `sys_role_menu` VALUES (2243, 48, 72);
INSERT INTO `sys_role_menu` VALUES (2247, 63, -1);
INSERT INTO `sys_role_menu` VALUES (2248, 63, 84);
INSERT INTO `sys_role_menu` VALUES (2249, 63, 85);
INSERT INTO `sys_role_menu` VALUES (2250, 63, 88);
INSERT INTO `sys_role_menu` VALUES (2251, 63, 87);
INSERT INTO `sys_role_menu` VALUES (2252, 64, 84);
INSERT INTO `sys_role_menu` VALUES (2253, 64, 89);
INSERT INTO `sys_role_menu` VALUES (2254, 64, 88);
INSERT INTO `sys_role_menu` VALUES (2255, 64, 87);
INSERT INTO `sys_role_menu` VALUES (2256, 64, 86);
INSERT INTO `sys_role_menu` VALUES (2257, 64, 85);
INSERT INTO `sys_role_menu` VALUES (2258, 65, 89);
INSERT INTO `sys_role_menu` VALUES (2259, 65, 88);
INSERT INTO `sys_role_menu` VALUES (2260, 65, 86);
INSERT INTO `sys_role_menu` VALUES (2262, 67, 48);
INSERT INTO `sys_role_menu` VALUES (2263, 68, 88);
INSERT INTO `sys_role_menu` VALUES (2264, 68, 87);
INSERT INTO `sys_role_menu` VALUES (2265, 69, 89);
INSERT INTO `sys_role_menu` VALUES (2266, 69, 88);
INSERT INTO `sys_role_menu` VALUES (2267, 69, 86);
INSERT INTO `sys_role_menu` VALUES (2268, 69, 87);
INSERT INTO `sys_role_menu` VALUES (2269, 69, 85);
INSERT INTO `sys_role_menu` VALUES (2270, 69, 84);
INSERT INTO `sys_role_menu` VALUES (2271, 70, 85);
INSERT INTO `sys_role_menu` VALUES (2272, 70, 89);
INSERT INTO `sys_role_menu` VALUES (2273, 70, 88);
INSERT INTO `sys_role_menu` VALUES (2274, 70, 87);
INSERT INTO `sys_role_menu` VALUES (2275, 70, 86);
INSERT INTO `sys_role_menu` VALUES (2276, 70, 84);
INSERT INTO `sys_role_menu` VALUES (2277, 71, 87);
INSERT INTO `sys_role_menu` VALUES (2278, 72, 59);
INSERT INTO `sys_role_menu` VALUES (2279, 73, 48);
INSERT INTO `sys_role_menu` VALUES (2280, 74, 88);
INSERT INTO `sys_role_menu` VALUES (2281, 74, 87);
INSERT INTO `sys_role_menu` VALUES (2282, 75, 88);
INSERT INTO `sys_role_menu` VALUES (2283, 75, 87);
INSERT INTO `sys_role_menu` VALUES (2284, 76, 85);
INSERT INTO `sys_role_menu` VALUES (2285, 76, 89);
INSERT INTO `sys_role_menu` VALUES (2286, 76, 88);
INSERT INTO `sys_role_menu` VALUES (2287, 76, 87);
INSERT INTO `sys_role_menu` VALUES (2288, 76, 86);
INSERT INTO `sys_role_menu` VALUES (2289, 76, 84);
INSERT INTO `sys_role_menu` VALUES (2292, 78, 88);
INSERT INTO `sys_role_menu` VALUES (2293, 78, 87);
INSERT INTO `sys_role_menu` VALUES (2294, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2295, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2296, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2308, 80, 87);
INSERT INTO `sys_role_menu` VALUES (2309, 80, 86);
INSERT INTO `sys_role_menu` VALUES (2310, 80, -1);
INSERT INTO `sys_role_menu` VALUES (2311, 80, 84);
INSERT INTO `sys_role_menu` VALUES (2312, 80, 85);
INSERT INTO `sys_role_menu` VALUES (2328, 79, 72);
INSERT INTO `sys_role_menu` VALUES (2329, 79, 48);
INSERT INTO `sys_role_menu` VALUES (2330, 79, 77);
INSERT INTO `sys_role_menu` VALUES (2331, 79, 84);
INSERT INTO `sys_role_menu` VALUES (2332, 79, 89);
INSERT INTO `sys_role_menu` VALUES (2333, 79, 88);
INSERT INTO `sys_role_menu` VALUES (2334, 79, 87);
INSERT INTO `sys_role_menu` VALUES (2335, 79, 86);
INSERT INTO `sys_role_menu` VALUES (2336, 79, 85);
INSERT INTO `sys_role_menu` VALUES (2337, 79, -1);
INSERT INTO `sys_role_menu` VALUES (2338, 77, 89);
INSERT INTO `sys_role_menu` VALUES (2339, 77, 88);
INSERT INTO `sys_role_menu` VALUES (2340, 77, 87);
INSERT INTO `sys_role_menu` VALUES (2341, 77, 86);
INSERT INTO `sys_role_menu` VALUES (2342, 77, 85);
INSERT INTO `sys_role_menu` VALUES (2343, 77, 84);
INSERT INTO `sys_role_menu` VALUES (2344, 77, 72);
INSERT INTO `sys_role_menu` VALUES (2345, 77, -1);
INSERT INTO `sys_role_menu` VALUES (2346, 77, 77);
INSERT INTO `sys_role_menu` VALUES (2974, 57, 93);
INSERT INTO `sys_role_menu` VALUES (2975, 57, 99);
INSERT INTO `sys_role_menu` VALUES (2976, 57, 95);
INSERT INTO `sys_role_menu` VALUES (2977, 57, 101);
INSERT INTO `sys_role_menu` VALUES (2978, 57, 96);
INSERT INTO `sys_role_menu` VALUES (2979, 57, 94);
INSERT INTO `sys_role_menu` VALUES (2980, 57, -1);
INSERT INTO `sys_role_menu` VALUES (2981, 58, 93);
INSERT INTO `sys_role_menu` VALUES (2982, 58, 99);
INSERT INTO `sys_role_menu` VALUES (2983, 58, 95);
INSERT INTO `sys_role_menu` VALUES (2984, 58, 101);
INSERT INTO `sys_role_menu` VALUES (2985, 58, 96);
INSERT INTO `sys_role_menu` VALUES (2986, 58, 94);
INSERT INTO `sys_role_menu` VALUES (2987, 58, -1);
INSERT INTO `sys_role_menu` VALUES (3115, 1, 103);
INSERT INTO `sys_role_menu` VALUES (3116, 1, 98);
INSERT INTO `sys_role_menu` VALUES (3117, 1, 101);
INSERT INTO `sys_role_menu` VALUES (3118, 1, 99);
INSERT INTO `sys_role_menu` VALUES (3119, 1, 95);
INSERT INTO `sys_role_menu` VALUES (3120, 1, 92);
INSERT INTO `sys_role_menu` VALUES (3121, 1, 57);
INSERT INTO `sys_role_menu` VALUES (3122, 1, 30);
INSERT INTO `sys_role_menu` VALUES (3123, 1, 29);
INSERT INTO `sys_role_menu` VALUES (3124, 1, 28);
INSERT INTO `sys_role_menu` VALUES (3125, 1, 90);
INSERT INTO `sys_role_menu` VALUES (3126, 1, 89);
INSERT INTO `sys_role_menu` VALUES (3127, 1, 88);
INSERT INTO `sys_role_menu` VALUES (3128, 1, 87);
INSERT INTO `sys_role_menu` VALUES (3129, 1, 86);
INSERT INTO `sys_role_menu` VALUES (3130, 1, 72);
INSERT INTO `sys_role_menu` VALUES (3131, 1, 48);
INSERT INTO `sys_role_menu` VALUES (3132, 1, 68);
INSERT INTO `sys_role_menu` VALUES (3133, 1, 60);
INSERT INTO `sys_role_menu` VALUES (3134, 1, 59);
INSERT INTO `sys_role_menu` VALUES (3135, 1, 58);
INSERT INTO `sys_role_menu` VALUES (3136, 1, 51);
INSERT INTO `sys_role_menu` VALUES (3137, 1, 76);
INSERT INTO `sys_role_menu` VALUES (3138, 1, 75);
INSERT INTO `sys_role_menu` VALUES (3139, 1, 74);
INSERT INTO `sys_role_menu` VALUES (3140, 1, 62);
INSERT INTO `sys_role_menu` VALUES (3141, 1, 56);
INSERT INTO `sys_role_menu` VALUES (3142, 1, 55);
INSERT INTO `sys_role_menu` VALUES (3143, 1, 15);
INSERT INTO `sys_role_menu` VALUES (3144, 1, 26);
INSERT INTO `sys_role_menu` VALUES (3145, 1, 25);
INSERT INTO `sys_role_menu` VALUES (3146, 1, 24);
INSERT INTO `sys_role_menu` VALUES (3147, 1, 14);
INSERT INTO `sys_role_menu` VALUES (3148, 1, 13);
INSERT INTO `sys_role_menu` VALUES (3149, 1, 12);
INSERT INTO `sys_role_menu` VALUES (3150, 1, 61);
INSERT INTO `sys_role_menu` VALUES (3151, 1, 22);
INSERT INTO `sys_role_menu` VALUES (3152, 1, 21);
INSERT INTO `sys_role_menu` VALUES (3153, 1, 20);
INSERT INTO `sys_role_menu` VALUES (3154, 1, 83);
INSERT INTO `sys_role_menu` VALUES (3155, 1, 81);
INSERT INTO `sys_role_menu` VALUES (3156, 1, 80);
INSERT INTO `sys_role_menu` VALUES (3157, 1, 79);
INSERT INTO `sys_role_menu` VALUES (3158, 1, 71);
INSERT INTO `sys_role_menu` VALUES (3159, 1, 102);
INSERT INTO `sys_role_menu` VALUES (3160, 1, 97);
INSERT INTO `sys_role_menu` VALUES (3161, 1, 96);
INSERT INTO `sys_role_menu` VALUES (3162, 1, 94);
INSERT INTO `sys_role_menu` VALUES (3163, 1, 93);
INSERT INTO `sys_role_menu` VALUES (3164, 1, 27);
INSERT INTO `sys_role_menu` VALUES (3165, 1, 91);
INSERT INTO `sys_role_menu` VALUES (3166, 1, 85);
INSERT INTO `sys_role_menu` VALUES (3167, 1, 84);
INSERT INTO `sys_role_menu` VALUES (3168, 1, 50);
INSERT INTO `sys_role_menu` VALUES (3169, 1, 49);
INSERT INTO `sys_role_menu` VALUES (3170, 1, 73);
INSERT INTO `sys_role_menu` VALUES (3171, 1, 7);
INSERT INTO `sys_role_menu` VALUES (3172, 1, 6);
INSERT INTO `sys_role_menu` VALUES (3173, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3174, 1, 3);
INSERT INTO `sys_role_menu` VALUES (3175, 1, 78);
INSERT INTO `sys_role_menu` VALUES (3176, 1, 1);
INSERT INTO `sys_role_menu` VALUES (3177, 1, 104);
INSERT INTO `sys_role_menu` VALUES (3178, 1, 77);
INSERT INTO `sys_role_menu` VALUES (3179, 1, -1);
INSERT INTO `sys_role_menu` VALUES (3232, 59, 98);
INSERT INTO `sys_role_menu` VALUES (3233, 59, 101);
INSERT INTO `sys_role_menu` VALUES (3234, 59, 99);
INSERT INTO `sys_role_menu` VALUES (3235, 59, 95);
INSERT INTO `sys_role_menu` VALUES (3236, 59, 90);
INSERT INTO `sys_role_menu` VALUES (3237, 59, 89);
INSERT INTO `sys_role_menu` VALUES (3238, 59, 88);
INSERT INTO `sys_role_menu` VALUES (3239, 59, 87);
INSERT INTO `sys_role_menu` VALUES (3240, 59, 86);
INSERT INTO `sys_role_menu` VALUES (3241, 59, 68);
INSERT INTO `sys_role_menu` VALUES (3242, 59, 60);
INSERT INTO `sys_role_menu` VALUES (3243, 59, 59);
INSERT INTO `sys_role_menu` VALUES (3244, 59, 58);
INSERT INTO `sys_role_menu` VALUES (3245, 59, 51);
INSERT INTO `sys_role_menu` VALUES (3246, 59, 76);
INSERT INTO `sys_role_menu` VALUES (3247, 59, 75);
INSERT INTO `sys_role_menu` VALUES (3248, 59, 74);
INSERT INTO `sys_role_menu` VALUES (3249, 59, 62);
INSERT INTO `sys_role_menu` VALUES (3250, 59, 56);
INSERT INTO `sys_role_menu` VALUES (3251, 59, 55);
INSERT INTO `sys_role_menu` VALUES (3252, 59, 15);
INSERT INTO `sys_role_menu` VALUES (3253, 59, 26);
INSERT INTO `sys_role_menu` VALUES (3254, 59, 25);
INSERT INTO `sys_role_menu` VALUES (3255, 59, 24);
INSERT INTO `sys_role_menu` VALUES (3256, 59, 14);
INSERT INTO `sys_role_menu` VALUES (3257, 59, 13);
INSERT INTO `sys_role_menu` VALUES (3258, 59, 12);
INSERT INTO `sys_role_menu` VALUES (3259, 59, 61);
INSERT INTO `sys_role_menu` VALUES (3260, 59, 22);
INSERT INTO `sys_role_menu` VALUES (3261, 59, 21);
INSERT INTO `sys_role_menu` VALUES (3262, 59, 20);
INSERT INTO `sys_role_menu` VALUES (3263, 59, 83);
INSERT INTO `sys_role_menu` VALUES (3264, 59, 81);
INSERT INTO `sys_role_menu` VALUES (3265, 59, 80);
INSERT INTO `sys_role_menu` VALUES (3266, 59, 79);
INSERT INTO `sys_role_menu` VALUES (3267, 59, 71);
INSERT INTO `sys_role_menu` VALUES (3268, 59, 97);
INSERT INTO `sys_role_menu` VALUES (3269, 59, 96);
INSERT INTO `sys_role_menu` VALUES (3270, 59, 94);
INSERT INTO `sys_role_menu` VALUES (3271, 59, 93);
INSERT INTO `sys_role_menu` VALUES (3272, 59, 85);
INSERT INTO `sys_role_menu` VALUES (3273, 59, 84);
INSERT INTO `sys_role_menu` VALUES (3274, 59, 50);
INSERT INTO `sys_role_menu` VALUES (3275, 59, 49);
INSERT INTO `sys_role_menu` VALUES (3276, 59, 73);
INSERT INTO `sys_role_menu` VALUES (3277, 59, 7);
INSERT INTO `sys_role_menu` VALUES (3278, 59, 6);
INSERT INTO `sys_role_menu` VALUES (3279, 59, 2);
INSERT INTO `sys_role_menu` VALUES (3280, 59, 3);
INSERT INTO `sys_role_menu` VALUES (3281, 59, 78);
INSERT INTO `sys_role_menu` VALUES (3282, 59, 1);
INSERT INTO `sys_role_menu` VALUES (3283, 59, -1);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (2, '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', NULL, '', 'welcomJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', 6, 'admin@example.com', '17699999999', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-14 00:00:00', 138, 'ccc', '122;121;', '北京市', '北京市市辖区', '东城区');
INSERT INTO `sys_user` VALUES (2, 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', 6, 'test@bootdo.com', NULL, 1, 1, '2017-08-14 13:43:05', '2017-08-14 21:15:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (36, 'ldh', '刘德华', 'bfd9394475754fbe45866eba97738c36', 7, 'ldh@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (123, 'zxy', '张学友', '35174ba93f5fe7267f1fb3c1bf903781', 6, 'zxy@bootdo', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (124, 'wyf', '吴亦凡', 'e179e6f687bbd57b9d7efc4746c8090a', 6, 'wyf@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (130, 'lh', '鹿晗', '7924710cd673f68967cde70e188bb097', 9, 'lh@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (131, 'lhc', '令狐冲', 'd515538e17ecb570ba40344b5618f5d4', 6, 'lhc@bootdo.com', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (132, 'lyf', '刘亦菲', '7fdb1d9008f45950c1620ba0864e5fbd', 13, 'lyf@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (134, 'lyh', '李彦宏', 'dc26092b3244d9d432863f2738180e19', 8, 'lyh@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (135, 'wjl', '王健林', '3967697dfced162cf6a34080259b83aa', 6, 'wjl@bootod.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (136, 'gdg', '郭德纲', '3bb1bda86bc02bf6478cd91e42135d2f', 9, 'gdg@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (73, 30, 48);
INSERT INTO `sys_user_role` VALUES (74, 30, 49);
INSERT INTO `sys_user_role` VALUES (75, 30, 50);
INSERT INTO `sys_user_role` VALUES (76, 31, 48);
INSERT INTO `sys_user_role` VALUES (77, 31, 49);
INSERT INTO `sys_user_role` VALUES (78, 31, 52);
INSERT INTO `sys_user_role` VALUES (79, 32, 48);
INSERT INTO `sys_user_role` VALUES (80, 32, 49);
INSERT INTO `sys_user_role` VALUES (81, 32, 50);
INSERT INTO `sys_user_role` VALUES (82, 32, 51);
INSERT INTO `sys_user_role` VALUES (83, 32, 52);
INSERT INTO `sys_user_role` VALUES (84, 33, 38);
INSERT INTO `sys_user_role` VALUES (85, 33, 49);
INSERT INTO `sys_user_role` VALUES (86, 33, 52);
INSERT INTO `sys_user_role` VALUES (87, 34, 50);
INSERT INTO `sys_user_role` VALUES (88, 34, 51);
INSERT INTO `sys_user_role` VALUES (89, 34, 52);
INSERT INTO `sys_user_role` VALUES (106, 124, 1);
INSERT INTO `sys_user_role` VALUES (110, 1, 1);
INSERT INTO `sys_user_role` VALUES (111, 2, 1);
INSERT INTO `sys_user_role` VALUES (113, 131, 48);
INSERT INTO `sys_user_role` VALUES (117, 135, 1);
INSERT INTO `sys_user_role` VALUES (120, 134, 1);
INSERT INTO `sys_user_role` VALUES (121, 134, 48);
INSERT INTO `sys_user_role` VALUES (123, 130, 1);
INSERT INTO `sys_user_role` VALUES (124, NULL, 48);
INSERT INTO `sys_user_role` VALUES (125, 132, 52);
INSERT INTO `sys_user_role` VALUES (126, 132, 49);
INSERT INTO `sys_user_role` VALUES (127, 123, 48);
INSERT INTO `sys_user_role` VALUES (132, 36, 48);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
