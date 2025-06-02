// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildInfoItem(String image, String text, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    decoration: BoxDecoration(
      color: color.withOpacity(0.05),
      borderRadius: BorderRadius.circular(50.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min, // هذا يجعل الـ Row يأخذ أقل مساحة ممكنة
      children: [
        Image.asset(image, width: 16, height: 16, color: color),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.right,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    ),
  );
}