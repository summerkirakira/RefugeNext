import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';

/// 历史折线图的时间范围。
enum _Range { d30, y1, all }

extension _RangeX on _Range {
  String get label => switch (this) {
        _Range.d30 => '近30天',
        _Range.y1 => '近1年',
        _Range.all => '全部',
      };

  /// 需要保留的数据条数(每日一条);[all] 取全量。
  int get maxRecords => switch (this) {
        _Range.d30 => 30,
        _Range.y1 => 365,
        _Range.all => 1 << 30,
      };
}

/// 众筹查询:展示 Star Citizen 最新众筹统计快照(已筹资金 / 舰队规模 / 统计时间),
/// 并提供「已筹资金」历史折线图(可切换 近30天/近1年/全部)。
/// 数据取自 `/api/stats/latest` 与 `/api/stats`。
class CrowdfundingStatsPage extends StatefulWidget {
  const CrowdfundingStatsPage({super.key});

  @override
  State<CrowdfundingStatsPage> createState() => _CrowdfundingStatsPageState();
}

class _CrowdfundingStatsPageState extends State<CrowdfundingStatsPage> {
  // —— 最新快照 ——
  Stat? _stat;
  bool _loading = true;
  Object? _error;

  // —— 历史走势 ——
  List<Stat> _history = []; // 按时间正序(旧 → 新)
  bool _historyLoading = true;
  Object? _historyError;
  _Range _range = _Range.y1;

  // —— 近30天每日增量 ——
  List<(DateTime, double)> _deltas = []; // (当日时间, 当日增量),时间正序,最多30项
  bool _deltaLoading = true;
  Object? _deltaError;

  @override
  void initState() {
    super.initState();
    _load();
    _loadHistory();
    _loadRecent();
  }

  /// 近30天每日增量:拉 31 个最新日点,算相邻差分。
  Future<void> _loadRecent() async {
    setState(() {
      _deltaLoading = true;
      _deltaError = null;
    });
    try {
      final res = await WikiApiClient().api.getStatsApi().listStats(
            page: null,
            pageLeftSquareBracketNumberRightSquareBracket: 1,
            pageLeftSquareBracketSizeRightSquareBracket: 31,
          );
      // newest-first → 取前31 → 正序 → 过滤无效。
      final asc = (res.data?.data ?? const <Stat>[])
          .take(31)
          .where((s) => s.funds != null && s.timestamp != null)
          .toList()
          .reversed
          .toList();
      final deltas = <(DateTime, double)>[];
      for (var i = 1; i < asc.length; i++) {
        deltas.add((
          asc[i].timestamp!.toLocal(),
          asc[i].funds!.toDouble() - asc[i - 1].funds!.toDouble(),
        ));
      }
      if (!mounted) return;
      setState(() {
        _deltas = deltas;
        _deltaLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _deltaError = e;
        _deltaLoading = false;
      });
    }
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final res = await WikiApiClient().api.getStatsApi().getLatestStats();
      if (!mounted) return;
      setState(() {
        _stat = res.data?.data;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e;
        _loading = false;
      });
    }
  }

  Future<void> _loadHistory() async {
    setState(() {
      _historyLoading = true;
      _historyError = null;
    });
    try {
      final api = WikiApiClient().api.getStatsApi();
      final all = <Stat>[]; // newest-first 累积
      const size = 200;
      final want = _range.maxRecords;
      var page = 1;
      while (page <= 50) {
        final res = await api.listStats(
          page: null,
          pageLeftSquareBracketNumberRightSquareBracket: page,
          pageLeftSquareBracketSizeRightSquareBracket: size,
        );
        final data = res.data?.data ?? const <Stat>[];
        all.addAll(data);
        final lastPage = res.data?.meta?.lastPage;
        if (data.isEmpty ||
            data.length < size ||
            all.length >= want ||
            (lastPage != null && page >= lastPage)) {
          break;
        }
        page++;
      }
      // 截断到所需条数,再反转为时间正序(旧 → 新),并过滤掉无金额/无时间的点。
      final trimmed = all
          .take(want)
          .where((s) => s.funds != null && s.timestamp != null)
          .toList()
          .reversed
          .toList();
      if (!mounted) return;
      setState(() {
        _history = trimmed;
        _historyLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _historyError = e;
        _historyLoading = false;
      });
    }
  }

  void _onRangeChanged(_Range r) {
    if (r == _range) return;
    setState(() => _range = r);
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () async {
            await _load();
            await _loadHistory();
            await _loadRecent();
          },
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildHeader(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                child: Column(
                  children: [
                    _fleetRow(),
                    const SizedBox(height: 20),
                    _historySection(),
                    const SizedBox(height: 20),
                    _dailyDeltaSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============ 头部 Hero(渐变 + 已筹资金) ============

  Widget _buildHeader() {
    final primary = Theme.of(context).primaryColor;
    final busy = _loading || _historyLoading;
    return Container(
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [primary, Color.lerp(primary, Colors.white, 0.35)!],
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
                child: _headerContent(),
              ),
              Positioned(top: 8, left: 8, child: _circleBtn(Icons.arrow_back,
                  () => Navigator.of(context).pop())),
              Positioned(
                top: 8,
                right: 8,
                child: _circleBtn(
                  Icons.refresh,
                  busy
                      ? null
                      : () {
                          _load();
                          _loadHistory();
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerContent() {
    if (_loading) {
      return const Center(
        child: SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(
              strokeWidth: 2.5, color: Colors.white),
        ),
      );
    }
    if (_error != null || _stat == null) {
      return Center(
        child: TextButton(
          onPressed: _load,
          child: const Text('加载失败 · 点击重试',
              style: TextStyle(color: Colors.white)),
        ),
      );
    }
    final s = _stat!;
    final funds = s.funds == null
        ? '-'
        : '\$${NumberFormat('#,##0', 'en_US').format(s.funds)}';
    final ts = s.timestamp == null
        ? null
        : DateFormat('yyyy-MM-dd HH:mm', 'zh_CN').format(s.timestamp!.toLocal());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('众筹总额(USD)',
            style: TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            funds,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (ts != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('截至 $ts',
                style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ),
      ],
    );
  }

  /// 头部叠加的半透明黑圆按钮(返回 / 刷新)。
  Widget _circleBtn(IconData icon, VoidCallback? onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: 20,
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  // ============ 舰队规模 ============

  Widget _fleetRow() {
    final fleet = (_stat?.fleet) == null
        ? '-'
        : NumberFormat.decimalPattern().format(_stat!.fleet);
    return _statRow(Icons.rocket_launch_outlined, '舰队规模', fleet);
  }

  /// 普通统计行卡片(图标 + 标题 + 数值)。
  Widget _statRow(IconData icon, String title, String value) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontSize: 14)),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // ============ 历史走势 ============

  Widget _historySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.show_chart, size: 18),
            const SizedBox(width: 6),
            const Text('已筹资金走势',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        // 范围切换
        Wrap(
          spacing: 8,
          children: _Range.values
              .map((r) => ChoiceChip(
                    label: Text(r.label),
                    selected: _range == r,
                    onSelected: (_) => _onRangeChanged(r),
                  ))
              .toList(),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 16, 12),
            child: SizedBox(height: 240, child: _chartBody()),
          ),
        ),
      ],
    );
  }

  Widget _chartBody() {
    if (_historyLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_historyError != null) {
      return _errorBox('图表加载失败', _loadHistory);
    }
    if (_history.length < 2) {
      return const Center(
        child: Text('暂无数据', style: TextStyle(color: Colors.grey)),
      );
    }
    return LineChart(_buildChartData());
  }

  LineChartData _buildChartData() {
    final primary = Theme.of(context).primaryColor;
    final n = _history.length;
    final spots = <FlSpot>[
      for (var i = 0; i < n; i++)
        FlSpot(i.toDouble(), _history[i].funds!.toDouble()),
    ];

    var minY = spots.first.y, maxY = spots.first.y;
    for (final s in spots) {
      if (s.y < minY) minY = s.y;
      if (s.y > maxY) maxY = s.y;
    }
    final pad = (maxY - minY) * 0.08;
    if (pad == 0) {
      minY -= 1;
      maxY += 1;
    } else {
      minY -= pad;
      maxY += pad;
    }

    // 底部 ~4 个等距日期标签。
    final labelStep = (n / 4).ceil().clamp(1, n);

    return LineChartData(
      minX: 0,
      maxX: (n - 1).toDouble(),
      minY: minY,
      maxY: maxY,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: (maxY - minY) <= 0 ? null : (maxY - minY) / 4,
        getDrawingHorizontalLine: (_) =>
            FlLine(color: Colors.grey.shade200, strokeWidth: 1),
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 48,
            getTitlesWidget: (value, meta) {
              if (value == meta.min || value == meta.max) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(_fmtFundsCompact(value),
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: labelStep.toDouble(),
            getTitlesWidget: (value, meta) {
              final i = value.round();
              if (i < 0 || i >= n) return const SizedBox.shrink();
              final ts = _history[i].timestamp;
              if (ts == null) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(_fmtAxisDate(ts.toLocal()),
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              );
            },
          ),
        ),
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (spots) => spots.map((s) {
            final i = s.x.round();
            final ts = (i >= 0 && i < n) ? _history[i].timestamp : null;
            final date = ts == null
                ? ''
                : DateFormat('yyyy-MM-dd').format(ts.toLocal());
            final amount = '\$${NumberFormat('#,##0', 'en_US').format(s.y)}';
            return LineTooltipItem(
              '$date\n$amount',
              const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            );
          }).toList(),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: false,
          color: primary,
          barWidth: 2,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: primary.withValues(alpha: 0.12),
          ),
        ),
      ],
    );
  }

  /// 紧凑金额(纵轴用):≥1e9→$x.xxB、≥1e6→$x.xxM、≥1e3→$xK、否则千分位。
  String _fmtFundsCompact(double v) {
    if (v >= 1e9) return '\$${(v / 1e9).toStringAsFixed(2)}B';
    if (v >= 1e6) return '\$${(v / 1e6).toStringAsFixed(2)}M';
    if (v >= 1e3) return '\$${(v / 1e3).toStringAsFixed(0)}K';
    return '\$${NumberFormat('#,##0', 'en_US').format(v)}';
  }

  /// 横轴日期标签:按范围选粒度。
  String _fmtAxisDate(DateTime t) => switch (_range) {
        _Range.d30 => DateFormat('MM/dd').format(t),
        _Range.y1 => DateFormat('MM月').format(t),
        _Range.all => DateFormat('yyyy').format(t),
      };

  // ============ 近30天每日增量(柱状图) ============

  Widget _dailyDeltaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.bar_chart, size: 18),
            const SizedBox(width: 6),
            const Text('近30天每日增量',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 16, 12),
            child: SizedBox(height: 240, child: _deltaChartBody()),
          ),
        ),
      ],
    );
  }

  Widget _deltaChartBody() {
    if (_deltaLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_deltaError != null) {
      return _errorBox('图表加载失败', _loadRecent);
    }
    if (_deltas.isEmpty) {
      return const Center(
        child: Text('暂无数据', style: TextStyle(color: Colors.grey)),
      );
    }
    return BarChart(_buildDeltaData());
  }

  BarChartData _buildDeltaData() {
    final primary = Theme.of(context).primaryColor;
    final n = _deltas.length;

    var maxY = 0.0, minY = 0.0;
    for (final d in _deltas) {
      if (d.$2 > maxY) maxY = d.$2;
      if (d.$2 < minY) minY = d.$2;
    }
    maxY = maxY == 0 ? 1 : maxY * 1.15;

    final labelStep = (n / 5).ceil().clamp(1, n);

    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: maxY,
      minY: minY,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: (maxY - minY) <= 0 ? null : (maxY - minY) / 4,
        getDrawingHorizontalLine: (_) =>
            FlLine(color: Colors.grey.shade200, strokeWidth: 1),
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 44,
            getTitlesWidget: (value, meta) {
              if (value == meta.min || value == meta.max) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(_fmtFundsCompact(value),
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: (value, meta) {
              final i = value.round();
              if (i < 0 || i >= n || i % labelStep != 0) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(DateFormat('MM/dd').format(_deltas[i].$1),
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              );
            },
          ),
        ),
      ),
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final d = _deltas[group.x];
            final date = DateFormat('MM-dd').format(d.$1);
            final sign = d.$2 >= 0 ? '+' : '-';
            final amount =
                '$sign\$${NumberFormat('#,##0', 'en_US').format(d.$2.abs())}';
            return BarTooltipItem(
              '$date\n$amount',
              const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            );
          },
        ),
      ),
      barGroups: [
        for (var i = 0; i < n; i++)
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: _deltas[i].$2,
                color: primary,
                width: 6,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(2)),
              ),
            ],
          ),
      ],
    );
  }

  // ============ 通用 ============

  Widget _errorBox(String msg, Future<void> Function() onRetry) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off, size: 40, color: Colors.grey),
          const SizedBox(height: 10),
          Text(msg, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          OutlinedButton(onPressed: onRetry, child: const Text('重试')),
        ],
      ),
    );
  }
}
