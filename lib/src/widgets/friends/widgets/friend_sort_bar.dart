import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';

class FriendSortBar extends StatelessWidget {
  final int count;

  const FriendSortBar({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Toggle sort type
                  final newType = dataModel.friendSortType == FriendSortType.byName
                      ? FriendSortType.byRecentActivity
                      : FriendSortType.byName;
                  dataModel.setFriendSortType(newType);
                },
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '排序方式',
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            dataModel.friendSortType == FriendSortType.byName
                                ? '名称'
                                : '最近活跃',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.sort_sharp,
                            size: 20,
                            color: Theme.of(context).textTheme.bodyMedium!.color,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
