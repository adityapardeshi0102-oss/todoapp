import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final Function(int) onItemSelected;

  final Color purple = Color(0xFF5145ED);

  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.wb_sunny_outlined,
      'label': 'Today',
    },
    {
      'icon': Icons.inbox_outlined,
      'label': 'All',
    },
    {
      'icon': Icons.calendar_today_outlined,
      'label': 'Calendar',
    },
    {
      'icon': Icons.grid_view_rounded,
      'label': 'Lists',
    },
    {
      'icon': Icons.bar_chart_rounded,
      'label': 'Progress',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 6, 8, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE5E8F0),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(items.length, (index) {
            bool isSelected = selectedIndex == index;
            var item = items[index];

            return Expanded(
              child: GestureDetector(
                onTap: () => onItemSelected(index),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFFEEF0FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item['icon'],
                        size: 20,
                        color: isSelected
                            ? purple
                            : Color(0xFF7B8497),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item['label'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 9,
                          color: isSelected
                              ? purple
                              : Color(0xFF7B8497),
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}