import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';
import 'package:refuge_next/src/widgets/game_logs/log_card_factory.dart';

/// 日志过滤器数据类
class LogFilter {
  final String? searchKeyword;
  final String? logType;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? playerId;
  final String? result;

  const LogFilter({
    this.searchKeyword,
    this.logType,
    this.startDate,
    this.endDate,
    this.playerId,
    this.result,
  });

  LogFilter copyWith({
    String? searchKeyword,
    String? logType,
    DateTime? startDate,
    DateTime? endDate,
    String? playerId,
    String? result,
    bool clearSearchKeyword = false,
    bool clearLogType = false,
    bool clearStartDate = false,
    bool clearEndDate = false,
    bool clearPlayerId = false,
    bool clearResult = false,
  }) {
    return LogFilter(
      searchKeyword: clearSearchKeyword ? null : (searchKeyword ?? this.searchKeyword),
      logType: clearLogType ? null : (logType ?? this.logType),
      startDate: clearStartDate ? null : (startDate ?? this.startDate),
      endDate: clearEndDate ? null : (endDate ?? this.endDate),
      playerId: clearPlayerId ? null : (playerId ?? this.playerId),
      result: clearResult ? null : (result ?? this.result),
    );
  }

  bool get hasActiveFilters =>
      searchKeyword != null ||
      logType != null ||
      startDate != null ||
      endDate != null ||
      playerId != null ||
      result != null;

  int get activeFilterCount {
    int count = 0;
    if (searchKeyword != null && searchKeyword!.isNotEmpty) count++;
    if (logType != null) count++;
    if (startDate != null || endDate != null) count++;
    if (playerId != null) count++;
    if (result != null) count++;
    return count;
  }
}

/// 日志搜索和过滤组件
class LogFilters extends StatefulWidget {
  final LogFilter filter;
  final ValueChanged<LogFilter> onFilterChanged;

  const LogFilters({
    Key? key,
    required this.filter,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  State<LogFilters> createState() => _LogFiltersState();
}

class _LogFiltersState extends State<LogFilters> {
  final TextEditingController _searchController = TextEditingController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.filter.searchKeyword ?? '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 搜索栏
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: '搜索日志内容、玩家、实体...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              widget.onFilterChanged(
                                widget.filter.copyWith(clearSearchKeyword: true),
                              );
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                  ),
                  onChanged: (value) {
                    widget.onFilterChanged(
                      widget.filter.copyWith(searchKeyword: value.isEmpty ? null : value),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              // 过滤器按钮
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      _showFilters ? Icons.filter_list_off : Icons.filter_list,
                      color: widget.filter.hasActiveFilters
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                    onPressed: () {
                      setState(() {
                        _showFilters = !_showFilters;
                      });
                    },
                  ),
                  if (widget.filter.activeFilterCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${widget.filter.activeFilterCount}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        // 过滤器面板
        if (_showFilters) _buildFilterPanel(),
      ],
    );
  }

  Widget _buildFilterPanel() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 日志类型过滤
          _buildLogTypeFilter(),
          const SizedBox(height: 12),

          // 结果过滤
          _buildResultFilter(),
          const SizedBox(height: 12),

          // 日期范围选择
          _buildDateRangeFilter(),
          const SizedBox(height: 12),

          // 清空过滤器按钮
          if (widget.filter.hasActiveFilters)
            Center(
              child: TextButton.icon(
                onPressed: () {
                  _searchController.clear();
                  widget.onFilterChanged(const LogFilter());
                },
                icon: const Icon(Icons.clear_all),
                label: const Text('清空所有过滤器'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLogTypeFilter() {
    final logTypes = [
      // 库存与装备
      LogTypes.inventory,
      LogTypes.attachment,

      // 登录相关
      LogTypes.initiateLogin,
      LogTypes.asyncLoginCallback,

      // 游戏流程
      LogTypes.spawnFlow,
      LogTypes.connectionFlow,
      LogTypes.vehicleControlFlow,
      LogTypes.jumpDriveStateChanged,

      // 战斗与事件
      LogTypes.vehicleDestruction,
      LogTypes.actorDeath,

      // 任务相关
      LogTypes.objectiveUpserted,
      LogTypes.missionEnded,
      LogTypes.endMission,

      // 系统相关
      LogTypes.gameVersion,
      LogTypes.authorityChanged,
      LogTypes.systemQuit,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '日志类型',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: logTypes.map((type) {
            final isSelected = widget.filter.logType == type;
            return FilterChip(
              label: Text(LogCardFactory.getTypeDisplayName(type)),
              avatar: Icon(
                LogCardFactory.getTypeIcon(type),
                size: 18,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : LogCardFactory.getTypeColor(type),
              ),
              selected: isSelected,
              onSelected: (selected) {
                widget.onFilterChanged(
                  widget.filter.copyWith(
                    logType: selected ? type : null,
                    clearLogType: !selected,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildResultFilter() {
    final results = ['Success', 'Failed', 'Error'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '结果状态',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: results.map((result) {
            final isSelected = widget.filter.result == result;
            return FilterChip(
              label: Text(result),
              avatar: Icon(
                result == 'Success' ? Icons.check_circle : Icons.error,
                size: 18,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : (result == 'Success' ? Colors.green : Colors.red),
              ),
              selected: isSelected,
              onSelected: (selected) {
                widget.onFilterChanged(
                  widget.filter.copyWith(
                    result: selected ? result : null,
                    clearResult: !selected,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateRangeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '时间范围',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilterChip(
              label: const Text('今天'),
              selected: _isToday(),
              onSelected: (selected) {
                if (selected) {
                  final now = DateTime.now();
                  final startOfDay = DateTime(now.year, now.month, now.day);
                  final endOfDay = startOfDay.add(const Duration(days: 1));
                  widget.onFilterChanged(
                    widget.filter.copyWith(
                      startDate: startOfDay,
                      endDate: endOfDay,
                    ),
                  );
                } else {
                  widget.onFilterChanged(
                    widget.filter.copyWith(
                      clearStartDate: true,
                      clearEndDate: true,
                    ),
                  );
                }
              },
            ),
            FilterChip(
              label: const Text('最近7天'),
              selected: _isLastNDays(7),
              onSelected: (selected) {
                if (selected) {
                  final now = DateTime.now();
                  final sevenDaysAgo = now.subtract(const Duration(days: 7));
                  widget.onFilterChanged(
                    widget.filter.copyWith(
                      startDate: sevenDaysAgo,
                      endDate: now,
                    ),
                  );
                } else {
                  widget.onFilterChanged(
                    widget.filter.copyWith(
                      clearStartDate: true,
                      clearEndDate: true,
                    ),
                  );
                }
              },
            ),
            FilterChip(
              label: const Text('最近30天'),
              selected: _isLastNDays(30),
              onSelected: (selected) {
                if (selected) {
                  final now = DateTime.now();
                  final thirtyDaysAgo = now.subtract(const Duration(days: 30));
                  widget.onFilterChanged(
                    widget.filter.copyWith(
                      startDate: thirtyDaysAgo,
                      endDate: now,
                    ),
                  );
                } else {
                  widget.onFilterChanged(
                    widget.filter.copyWith(
                      clearStartDate: true,
                      clearEndDate: true,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  bool _isToday() {
    if (widget.filter.startDate == null || widget.filter.endDate == null) {
      return false;
    }
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    return widget.filter.startDate!.year == startOfDay.year &&
        widget.filter.startDate!.month == startOfDay.month &&
        widget.filter.startDate!.day == startOfDay.day;
  }

  bool _isLastNDays(int days) {
    if (widget.filter.startDate == null || widget.filter.endDate == null) {
      return false;
    }
    final now = DateTime.now();
    final nDaysAgo = now.subtract(Duration(days: days));
    final difference = widget.filter.endDate!.difference(widget.filter.startDate!);
    return difference.inDays >= days - 1 &&
        difference.inDays <= days + 1 &&
        widget.filter.startDate!.isBefore(now) &&
        widget.filter.startDate!.isAfter(nDaysAgo.subtract(const Duration(days: 1)));
  }
}
