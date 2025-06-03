import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:index_login/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:index_login/features/auth/presentation/screens/login.dart';
import 'package:index_login/features/home/presentation/screens/home_screen.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpBody extends StatelessWidget {
  const VerifyOtpBody({
    super.key,
    required this.email,
    required this.pinController,
    required this.focusNode,
    required this.defaultPinTheme,
    required this.focusedPinTheme,
    required this.submittedPinTheme,
    required this.errorPinTheme,
  });

  final String? email;
  final TextEditingController pinController;
  final FocusNode focusNode;
  final PinTheme defaultPinTheme;
  final PinTheme focusedPinTheme;
  final PinTheme submittedPinTheme;
  final PinTheme errorPinTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'تاكيد الهوية',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.sp),

              RichText(
                text: TextSpan(
                  text: 'أرسلنا رمز تحقق مكون من 4 أرقام إلى',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF4B5766),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Ping AR + LT',
                  ),
                  children: [
                    TextSpan(
                      text: ' $email',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ping AR + LT',
                      ),
                    ),
                    TextSpan(
                      text: ' أدخل الرمز الموجود في المربع أدناه للمتابعة',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xFF4B5766),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Ping AR + LT',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Text(
                  'تعديل البريد الإلكتروني',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFEF3F23),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Column(
                children: [
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is VerifyOtpSuccess) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                      if (state is VerifyOtpFailure) {
                        Fluttertoast.showToast(msg: state.error);
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        child: Column(
                          textDirection: TextDirection.rtl,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                keyboardType: TextInputType.number,
                                controller: pinController,
                                focusNode: focusNode,
                                length: 4,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                defaultPinTheme: defaultPinTheme,
                                focusedPinTheme: focusedPinTheme,
                                submittedPinTheme: submittedPinTheme,
                                errorPinTheme: errorPinTheme,
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                showCursor: true,
                                cursor: Container(
                                  width: 2,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE85A3A),
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (pinController.text.isEmpty ||
                                      pinController.text.length < 4) {
                                    Fluttertoast.showToast(
                                      msg: 'الرجاء إدخال رمز مكون من 4 أرقام',
                                    );
                                  } else {
                                    BlocProvider.of<AuthCubit>(
                                      context,
                                    ).verifyOtp(email!, pinController.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF6B35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  elevation: 0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child:
                                      state is VerifyOtpLoading
                                          ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                          : Text(
                                            'تحقق',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Center(
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).loginWithEmail(email!);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'لم تستلم الكود؟',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontFamily: 'Ping AR + LT',
                      ),
                      children: const [
                        TextSpan(
                          text: ' إعادة إرسال',
                          style: TextStyle(
                            color: Color(0xFFFF6B35),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ping AR + LT',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ).animate()
        .slideY(
          begin: 1.0,
          end: 0.0,    
          duration: 1200.ms,  
          curve: Curves.easeOutCubic,  
        )
        .fadeIn(duration: 1200.ms));
  }
}
