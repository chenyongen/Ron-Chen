

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `clock_group`;
CREATE TABLE `clock_group` (
  `group_id` bigint(19) unsigned NOT NULL COMMENT '考勤组编号',
  `name` varchar(24) NOT NULL COMMENT '考勤组名称',
  `tenant_id` bigint(19)  unsigned NOT NULL COMMENT '租户企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `begin_time` VARCHAR(64)  COMMENT '考勤开始时间 24小时 HH:mm',
  `end_time`   VARCHAR(64)  COMMENT '考勤结束时间 24小时HH:mm',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) unsigned DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考勤组表';
SET FOREIGN_KEY_CHECKS = 1;





SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `clock_group_staff`;
CREATE TABLE `clock_group_staff` (
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '用户编号',
  `staff_name` varchar(64) NOT NULL COMMENT '用户名称',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `group_id` bigint(19) unsigned NOT NULL COMMENT '考勤组编号',
  `dept_id`  bigint(19)  unsigned NOT NULL COMMENT '部门编号',
  `dept_name` varchar(64) NOT NULL COMMENT '部门名称',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
   PRIMARY KEY (`staff_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考勤组人员表';
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `clock_group_staff` ADD INDEX grou_id_index (group_id);





SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `clock_day_record`;
CREATE TABLE `clock_day_record`(
  `record_id`  bigint(19) unsigned NOT NULL COMMENT '日记录编号',
  `staff_id` bigint(19) unsigned  NOT NULL COMMENT '用户编号',
  `staff_name` varchar(64) NOT NULL COMMENT '用户名称',
  `tenat_id` bigint(19) unsigned NOT NULL COMMENT '用户企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `group_id` bigint(19) unsigned NOT NULL COMMENT '考勤组编号',
  `group_name` varchar(64) NOT NULL COMMENT '考勤组名称',
  `dept_id`  bigint(19) unsigned NOT NULL COMMENT '部门编号',
  `dept_name` varchar(64) NOT NULL COMMENT '部门名称',
  `record_day` varchar(64) NOT NULL  COMMENT '考勤日期,存储YYYY-MM-dd 格式的日期',
  `am_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '上午打卡时间',
  `pm_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '下午打卡时间',
  `am_late_minutes` int(4) unsigned DEFAULT NULL COMMENT '上午迟到时间',
  `pm_early_minutes` int(4) unsigned DEFAULT NULL COMMENT '下午早退时间',
  `status` int NOT NULL COMMENT '0 正常 1 异常(迟到,早退) 2 旷工 ',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`record_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考勤日记录表';
SET FOREIGN_KEY_CHECKS = 1;






SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `clock_month_record`;
CREATE TABLE `clock_month_record`(
  `record_id`  bigint(19) unsigned NOT NULL COMMENT '月记录编号',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '用户编号',
  `staff_name` varchar(64) NOT NULL COMMENT '用户名称',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '用户企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `group_id` bigint(19) unsigned NOT NULL COMMENT '考勤组编号',
  `group_name` varchar(64) NOT NULL COMMENT '考勤组名称',
  `dept_id`  bigint(19) unsigned NOT NULL COMMENT '部门编号',
  `dept_name` varchar(64) NOT NULL COMMENT '部门名称',
  `record_year` int(4) unsigned COMMENT '考勤年份',
  `record_monthd` int(4) unsigned COMMENT '考勤月份',
  `need_clock_days` tinyint(2) unsigned  COMMENT '需要考勤天数',
  `abnormal_days`  tinyint(2) unsigned DEFAULT NULL COMMENT '异常天数',
  `count_days` tinyint(2) unsigned COMMENT '当月总天数',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`record_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考勤月度记录表';
SET FOREIGN_KEY_CHECKS = 1;




SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `goku_event`;
CREATE TABLE `goku_event`(
  `event_id` bigint(19) unsigned NOT NULL COMMENT '事件编号',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '用户企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '用户编号',
  `staff_name` varchar(64) NOT NULL COMMENT '用户名称',
  `dept_id`  bigint(19) unsigned NOT NULL COMMENT '部门编号',
  `dept_name` varchar(64) NOT NULL COMMENT '部门名称',
  `event_type` varchar(64) NOT NULL   COMMENT '1.请假 2.假期批量变更',
  `remark` varchar(256) NOT NULL COMMENT '内容 [管理员aa 给所有人分配了1天, 请假_年假_1天]',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
   PRIMARY KEY (`event_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='事件表';
SET FOREIGN_KEY_CHECKS = 1;




SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `holiday_item`;
CREATE TABLE `holiday_item`(
  `holiday_id` bigint(19) unsigned NOT NULL COMMENT '假期编号',
  `tenant_id` bigint(19)unsigned  NOT NULL COMMENT '所属于企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `holiday_name` varchar(64) NOT NULL   COMMENT '假期名称',
  `holiday_quota` tinyint(4) unsigned NOT NULL COMMENT '假期配额 单位:天数的10倍',
  `holiday_status` tinyint(1) unsigned NOT NULL  COMMENT '0 初始状态 1生效 2停用 ',
  `holiday_can_adjust` tinyint(1) unsigned  NOT NULL COMMENT '能否调整 0 不能调整 1能调整',
  `holiday_has_limit` tinyint(1) unsigned NOT NULL COMMENT '是否限制配额 0 无限制 1有限制 ',
  `effect_type` tinyint(1) unsigned NOT NULL  COMMENT '0 自然日 1工作日 ',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) unsigned DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
   PRIMARY KEY (`holiday_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='假期类型表';
SET FOREIGN_KEY_CHECKS = 1;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `holiday_change_record`;
CREATE TABLE `holiday_change_record`(
  `record_id`  bigint(19) unsigned NOT NULL COMMENT '记录编号',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '所属于企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `dept_id`  bigint(19) unsigned NOT NULL COMMENT '部门编号',
  `dept_name` varchar(64) NOT NULL COMMENT '部门名称',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '所属用户编号',
  `staff_name` varchar(64) NOT NULL COMMENT '用户名称',
  `holiday_id` bigint(19) unsigned  NOT NULL COMMENT '假期编号',
  `holiday_name` varchar(64)  COMMENT '假期名称',
  `holiday_affetc_days` tinyint(4)  unsigned NOT NULL COMMENT '假期影响天数',
  `change_type` tinyint(1) DEFAULT '0' COMMENT '0 请假 1被调整',
  `remark` varchar(64) DEFAULT '' COMMENT '日志备注 管理员新增1天',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`record_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='假期变更明细表';
SET FOREIGN_KEY_CHECKS = 1;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `holiday_use_record`;
CREATE TABLE `holiday_use_record`(
  `record_id`  bigint(19) unsigned NOT NULL COMMENT '记录编号',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '所属用户编号',
  `staff_name` varchar(64) NOT NULL COMMENT '用户名称',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '所属于企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `dept_id`  bigint(19) unsigned NOT NULL COMMENT '部门编号',
  `dept_name` varchar(64) NOT NULL COMMENT '部门名称',
  `holiday_id` bigint(19) unsigned NOT NULL COMMENT '假期编号',
  `holiday_name` varchar(64)  COMMENT '假期名称',
  `holiday_begin_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '假期开始时间',
  `holiday_end_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '假期结束时间',
  `holiday_duration_days` tinyint(4) unsigned  NOT NULL COMMENT '假期持续天数',
  `effect_type` tinyint(1) NOT NULL  COMMENT '0 自然日 1工作日 ',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`record_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='假期使用记录表';
SET FOREIGN_KEY_CHECKS = 1;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `holiday_item_balance`;
CREATE TABLE `holiday_item_balance`(
  `balance_id`  bigint(19) unsigned NOT NULL COMMENT '余额记录编号',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '所属用户编号',
  `staff_name` varchar(64) NOT NULL COMMENT '用户名称',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '所属于企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `dept_id`  bigint(19) unsigned NOT NULL COMMENT '部门编号',
  `dept_name` varchar(64) NOT NULL COMMENT '部门名称',
  `holiday_id` bigint(19) unsigned NOT NULL COMMENT '假期编号',
  `holiday_name` varchar(64)  COMMENT '假期名称',
  `holiday_balance` tinyint(4) unsigned NOT NULL COMMENT '假期配额 单位:天数的10倍',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`balance_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='假期余额表';
SET FOREIGN_KEY_CHECKS = 1;


ALTER TABLE `holiday_item_balance` ADD INDEX holiday_id_index (holiday_id);
ALTER TABLE `holiday_item_balance` ADD INDEX tenant_id_staff_id_index (tenant_id, staff_id);


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `approval_template`;
CREATE TABLE `approval_template`(
  `approval_id` bigint(19) unsigned NOT NULL COMMENT '审批流编号',
  `approval_template_name` varchar(64) NOT NULL  COMMENT '审批流名称',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '租户企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `approval_template_type`  tinyint(2) unsigned NOT NULL COMMENT '模版类型 0 假期审批 1 财务审批 ',
  `approval_template_sub_type`  bigint(19) unsigned NOT NULL COMMENT '模版子类型 对应编号',
  `approval_template_status`  tinyint(1) unsigned NOT NULL COMMENT '0停用 1启用',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) unsigned DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`approval_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批流模版';
SET FOREIGN_KEY_CHECKS = 1;




SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `approval_template_step`;
CREATE TABLE `approval_template_step`(
  `template_step_id`  bigint(19) unsigned NOT NULL COMMENT '审批流节点编号',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '用户企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `approval_id`  bigint(19) unsigned NOT NULL COMMENT '审批流编号',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '用户编号',
  `staff_name` varchar(64) DEFAULT '' COMMENT '用户名称',
  `order_number` tinyint(2) unsigned NOT NULL COMMENT '审批顺序 从0 开始',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`template_step_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批流模版节点表';
SET FOREIGN_KEY_CHECKS = 1;






SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `approval_instance`;
CREATE TABLE `approval_instance`(
  `instance_id`  bigint(19) unsigned NOT NULL COMMENT '审批实例编号',
  `approval_id` bigint(19) unsigned COMMENT '审批流编号',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '所属用户编号',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '所属于企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `approval_type` tinyint(2) unsigned NOT NULL COMMENT '0 假期审批 1 离职审批',
  `status` tinyint(2) unsigned NOT NULL COMMENT '0 审批中 1 通过 2失败',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) unsigned DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`instance_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批流实例表';
SET FOREIGN_KEY_CHECKS = 1;





SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `approval_instance_step`;
CREATE TABLE `approval_instance_step`(
  `step_id`  bigint(19) unsigned  NOT NULL COMMENT '审批实例节点编号',
  `instance_id`  bigint(19) unsigned NOT NULL COMMENT '审批实例编号',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '用户编号',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '用户企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `staff_name` varchar(64) DEFAULT '' COMMENT '用户名称',
  `order_number` tinyint(2)  unsigned NOT NULL COMMENT '审批顺序 从0 开始',
  `status` tinyint(2) unsigned NOT NULL COMMENT '0 未开始 1 等待审批 2 通过 3拒绝',
  `remark` varchar(256) COMMENT '审批意见',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`step_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批流实例节点表';
SET FOREIGN_KEY_CHECKS = 1;



SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `holiday_approval_instance_content`;
CREATE TABLE `holiday_approval_instance_content`(
  `instance_id`  bigint(19) unsigned NOT NULL COMMENT '审批实例编号',
  `staff_id` bigint(19) unsigned NOT NULL COMMENT '所属用户编号',
  `tenant_id` bigint(19) unsigned NOT NULL COMMENT '所属于企业编号',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `holiday_id`  bigint(19) unsigned NOT NULL COMMENT '假期编号',
  `holiday_begin_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '假期开始时间',
  `holiday_end_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '假期结束时间',
  `holiday_duration_days` tinyint(4) unsigned  NOT NULL COMMENT '假期持续天数 天数倍数',
  `apply_reason_content` varchar(1024) DEFAULT '' COMMENT '申请理由',
  `file_id_list` varchar(256)  DEFAULT '[]' COMMENT '附件列表',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) unsigned DEFAULT '0' COMMENT '删除标记（0:未删除，1:已删除）',
  PRIMARY KEY (`instance_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='假期审批实例内容';
SET FOREIGN_KEY_CHECKS = 1;
