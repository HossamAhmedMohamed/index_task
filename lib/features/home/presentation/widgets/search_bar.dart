// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSearchBar(
  TextEditingController searchController,
  BuildContext context,
) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset('assets/images/search_right.png'),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: searchController,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                hintText: 'بحث عن دكتور',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          const SizedBox(width: 12),
            Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEF3F23).withOpacity(0.1),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: const Icon(Icons.tune, color: Color(0xFFF26522), size: 22),
          ),
        ],
      ),
    );
  }