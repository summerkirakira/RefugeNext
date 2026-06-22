import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart';

/// 量子引擎详情测试页:复用通用 [GameItemDetailPage],仅注入量子引擎专属的「参数」页。
///
/// 头部与 总览/系统/购买 三页由通用页提供;参数页展示量子引擎独有的跃迁参数
/// (普通 vs 超频 双栏对比表)。仅作开发调试用。
class QuantumDriveDetailPage extends StatelessWidget {
  const QuantumDriveDetailPage({
    super.key,
    this.initialItem,
    this.allowSwitch = true,
  });

  /// 指定展示的量子引擎;为 null 时取本地第一条。
  final GameItem? initialItem;

  /// 是否显示「切换」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  Widget build(BuildContext context) {
    return GameItemDetailPage(
      title: '量子引擎详情',
      loadItems: () => QuantumDriveRepo().getQuantumDrives(),
      initialItem: initialItem,
      allowSwitch: allowSwitch,
      fallbackIcon: Icons.rocket_launch_outlined,
      paramSpec: quantumDriveParamSpec,
    );
  }
}

/// 量子引擎「参数」页:跃迁参数(普通 standardJump vs 超频 splineJump 双栏表)。
final quantumDriveParamSpec = GameItemParamSpec(
  tabTitle: '参数',
  buildCards: (item) {
    final q = item.quantumDrive;
    final n = q?.standardJump; // Normal / 普通
    final s = q?.splineJump; // Spline / 超频

    String? secs(double? v) => v == null ? null : '${fmtNum(v)} s';
    String? rng(double? a, double? b, {String? unit}) {
      if (a == null && b == null) return null;
      final u = unit != null ? ' $unit' : '';
      if (a != null && b != null && a != b) {
        final lo = a < b ? a : b;
        final hi = a < b ? b : a;
        return '${fmtNum(lo)} - ${fmtNum(hi)}$u';
      }
      return '${fmtNum(a ?? b)}$u';
    }

    return [
      itemTwoColCard('跃迁参数', '普通', '超频', [
        ('驱动速度', n?.driveSpeedFormatted, s?.driveSpeedFormatted),
        ('冷却时间', secs(n?.cooldownTime), secs(s?.cooldownTime)),
        ('一级加速', n?.stageOneAccelRateFormatted, s?.stageOneAccelRateFormatted),
        ('二级加速', n?.stageTwoAccelRateFormatted, s?.stageTwoAccelRateFormatted),
        ('启动速度', n?.engageSpeedFormatted, s?.engageSpeedFormatted),
        ('拦截影响时间', secs(n?.interdictionEffectTime),
            secs(s?.interdictionEffectTime)),
        ('校准速率', fmtNum(n?.calibrationRate), fmtNum(s?.calibrationRate)),
        (
          '校准需求',
          rng(n?.minCalibrationRequirement, n?.maxCalibrationRequirement),
          rng(s?.minCalibrationRequirement, s?.maxCalibrationRequirement)
        ),
        (
          '校准角度',
          rng(n?.calibrationProcessAngleLimit, n?.calibrationWarningAngleLimit,
              unit: 'deg'),
          rng(s?.calibrationProcessAngleLimit, s?.calibrationWarningAngleLimit,
              unit: 'deg')
        ),
        ('校准延迟', secs(n?.calibrationDelayInSeconds),
            secs(s?.calibrationDelayInSeconds)),
        ('充能时间', secs(n?.spoolUpTime), secs(s?.spoolUpTime)),
      ]),
    ];
  },
);
