import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:index_login/features/home/presentation/widgets/doctors.dart';
import 'package:index_login/features/home/presentation/widgets/top_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 208, 50, 2),
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
            opacity: 0.7,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'عيادات',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                   
                   const ScrollableNavBar(),

                   SizedBox(
                    height: 10.h,
                   ),

                   const Expanded(child: DoctorsSearchPage())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
