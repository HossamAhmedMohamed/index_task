import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:index_login/features/auth/presentation/widgets/login_header.dart';
import 'package:index_login/features/auth/presentation/widgets/verify_otp_body.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({
    super.key,
    required this.email,
    required this.pinController,
    required this.focusNode,
  });

  final String? email;
  final TextEditingController pinController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF6B7280),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: const Color(0xFFE85A3A), width: 2.w),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color(0xFFE85A3A),
        border: Border.all(color: const Color(0xFFE85A3A), width: 2.w),
      ),
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red, width: 2),
      ),
    );
    return Container(
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
        children: [
         const LoginHeader(),

          const Spacer(),
          VerifyOtpBody(email: email, pinController: pinController, focusNode: focusNode, defaultPinTheme: defaultPinTheme, focusedPinTheme: focusedPinTheme, submittedPinTheme: submittedPinTheme, errorPinTheme: errorPinTheme),
        ],
      ),
    );
  }
}