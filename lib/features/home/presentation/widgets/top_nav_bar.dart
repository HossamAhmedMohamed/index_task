import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollableNavBar extends StatefulWidget {
  const ScrollableNavBar({super.key});

  @override
  State<ScrollableNavBar> createState() => _ScrollableNavBarState();
}

class _ScrollableNavBarState extends State<ScrollableNavBar> {
  int selectedIndex = 4;

  final List<NavItem> navItems = [
    NavItem(title: 'مخ وأعصاب', icon: Icons.psychology),
    NavItem(title: 'الأسنان', icon: Icons.medical_services),
    NavItem(title: 'قلب', icon: Icons.favorite),
    NavItem(title: 'رئة باطنة', icon: Icons.air),
    NavItem(title: 'عظام', icon: Icons.accessibility_new),
    NavItem(title: 'جلدية', icon: Icons.face),
    NavItem(title: 'عيون', icon: Icons.visibility),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              navItems.asMap().entries.map((entry) {
                int index = entry.key;
                NavItem item = entry.value;
                bool isSelected = selectedIndex == index;
    
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 12,
                      left: index == navItems.length-1  ? 12 : 0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? const Color(0xFFFF6B35)
                              : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color:
                            isSelected
                                ? const Color(0xFFFF6B35)
                                : Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.icon,
                          size: 22,
                          color:
                              isSelected
                                  ? Colors.white
                                  : Colors.grey.shade600,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color:
                                isSelected
                                    ? Colors.white
                                    : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class NavItem {
  final String title;
  final IconData icon;

  NavItem({required this.title, required this.icon});
}
