import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';
import 'log_cards/base_log_card.dart';
import 'log_cards/inventory_log_card.dart';
import 'log_cards/attachment_log_card.dart';
import 'log_cards/login_log_card.dart';
import 'log_cards/character_login_status_log_card.dart';
import 'log_cards/vehicle_destruction_log_card.dart';
import 'log_cards/actor_death_log_card.dart';
import 'log_cards/game_version_log_card.dart';
import 'log_cards/system_quit_log_card.dart';
import 'log_cards/jump_drive_log_card.dart';
import 'log_cards/vehicle_control_log_card.dart';
import 'log_cards/spawn_flow_log_card.dart';
import 'log_cards/end_mission_log_card.dart';

/// 日志卡片工厂 - 根据日志类型创建对应的卡片组件
class LogCardFactory {
  /// 根据日志类型创建对应的卡片组件
  static Widget createCard(GameLog log, {VoidCallback? onTap}) {
    switch (log.logType) {
      case LogTypes.inventory:
        return InventoryLogCard(log: log, onTap: onTap);

      case LogTypes.attachment:
        return AttachmentLogCard(log: log, onTap: onTap);

      case LogTypes.login:
      case LogTypes.initiateLogin:
      case LogTypes.asyncLoginCallback:
        return LoginLogCard(log: log, onTap: onTap);

      case LogTypes.accountLoginCharacterStatus:
        return CharacterLoginStatusLogCard(log: log, onTap: onTap);

      case LogTypes.vehicleDestruction:
        return VehicleDestructionLogCard(log: log, onTap: onTap);

      case LogTypes.actorDeath:
        return ActorDeathLogCard(log: log, onTap: onTap);

      case LogTypes.gameVersion:
        return GameVersionLogCard(log: log, onTap: onTap);

      case LogTypes.systemQuit:
        return SystemQuitLogCard(log: log, onTap: onTap);

      case LogTypes.jumpDriveStateChanged:
        return JumpDriveLogCard(log: log, onTap: onTap);

      case LogTypes.vehicleControlFlow:
        return VehicleControlLogCard(log: log, onTap: onTap);

      case LogTypes.spawnFlow:
        return SpawnFlowLogCard(log: log, onTap: onTap);

      case LogTypes.endMission:
      case LogTypes.missionEnded:
        return EndMissionLogCard(log: log, onTap: onTap);

      default:
        return BaseLogCard(log: log, onTap: onTap);
    }
  }

  /// 获取日志类型对应的图标
  static IconData getTypeIcon(String logType) {
    switch (logType) {
      case LogTypes.inventory:
        return Icons.inventory_2;
      case LogTypes.attachment:
        return Icons.hardware;
      case LogTypes.login:
      case LogTypes.initiateLogin:
      case LogTypes.asyncLoginCallback:
        return Icons.login;
      case LogTypes.accountLoginCharacterStatus:
        return Icons.account_circle;
      case LogTypes.gameVersion:
        return Icons.info;
      case LogTypes.physics:
        return Icons.science;
      case LogTypes.error:
        return Icons.error;
      case LogTypes.warning:
        return Icons.warning;

      // 游戏流程相关
      case LogTypes.spawnFlow:
        return Icons.rocket_launch;
      case LogTypes.connectionFlow:
        return Icons.connected_tv;
      case LogTypes.vehicleControlFlow:
        return Icons.control_camera;
      case LogTypes.jumpDriveStateChanged:
        return Icons.flash_on;

      // 战斗与事件
      case LogTypes.vehicleDestruction:
        return Icons.local_fire_department;
      case LogTypes.actorDeath:
        return Icons.person_off;

      // 任务相关
      case LogTypes.objectiveUpserted:
        return Icons.flag;
      case LogTypes.missionEnded:
        return Icons.task_alt;
      case LogTypes.endMission:
        return Icons.check_circle;

      // 系统相关
      case LogTypes.authorityChanged:
        return Icons.admin_panel_settings;
      case LogTypes.systemQuit:
        return Icons.power_settings_new;

      default:
        return Icons.article;
    }
  }

  /// 获取日志类型对应的颜色
  static Color getTypeColor(String logType) {
    switch (logType) {
      case LogTypes.inventory:
        return Colors.blue;
      case LogTypes.attachment:
        return Colors.orange;
      case LogTypes.login:
      case LogTypes.initiateLogin:
      case LogTypes.asyncLoginCallback:
        return Colors.green;
      case LogTypes.accountLoginCharacterStatus:
        return Colors.purple;
      case LogTypes.gameVersion:
        return Colors.purple;
      case LogTypes.physics:
        return Colors.teal;
      case LogTypes.error:
        return Colors.red;
      case LogTypes.warning:
        return Colors.amber;

      // 游戏流程相关
      case LogTypes.spawnFlow:
        return Colors.cyan;
      case LogTypes.connectionFlow:
        return Colors.indigo;
      case LogTypes.vehicleControlFlow:
        return Colors.deepOrange;
      case LogTypes.jumpDriveStateChanged:
        return Colors.yellow;

      // 战斗与事件
      case LogTypes.vehicleDestruction:
        return Colors.red;
      case LogTypes.actorDeath:
        return Colors.grey;

      // 任务相关
      case LogTypes.objectiveUpserted:
        return Colors.lightBlue;
      case LogTypes.missionEnded:
        return Colors.green;
      case LogTypes.endMission:
        return Colors.teal;

      // 系统相关
      case LogTypes.authorityChanged:
        return Colors.brown;
      case LogTypes.systemQuit:
        return Colors.pink;

      default:
        return Colors.grey;
    }
  }

  /// 获取日志类型的显示名称
  static String getTypeDisplayName(String logType) {
    switch (logType) {
      case LogTypes.inventory:
        return '库存';
      case LogTypes.attachment:
        return '装备切换';
      case LogTypes.login:
        return '登录';
      case LogTypes.initiateLogin:
        return '发起登录';
      case LogTypes.asyncLoginCallback:
        return '登录回调';
      case LogTypes.accountLoginCharacterStatus:
        return '角色登录状态';
      case LogTypes.gameVersion:
        return '游戏版本';
      case LogTypes.physics:
        return '物理';
      case LogTypes.error:
        return '错误';
      case LogTypes.warning:
        return '警告';

      // 游戏流程相关
      case LogTypes.spawnFlow:
        return '重生状态';
      case LogTypes.connectionFlow:
        return '连接流程';
      case LogTypes.vehicleControlFlow:
        return '载具控制';
      case LogTypes.jumpDriveStateChanged:
        return '跃迁状态';

      // 战斗与事件
      case LogTypes.vehicleDestruction:
        return '载具摧毁';
      case LogTypes.actorDeath:
        return '角色死亡';

      // 任务相关
      case LogTypes.objectiveUpserted:
        return '目标更新';
      case LogTypes.missionEnded:
        return '任务结束';
      case LogTypes.endMission:
        return '任务结束';

      // 系统相关
      case LogTypes.authorityChanged:
        return '权限变更';
      case LogTypes.systemQuit:
        return '退出游戏';

      default:
        return logType;
    }
  }
}
