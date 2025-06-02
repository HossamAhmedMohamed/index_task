import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:index_login/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:index_login/features/auth/presentation/screens/verfiy_code_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

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
                'مرحباً بك مرة أخرى',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                'أهلاً بك مرة أخرى. لقد افتقدناك!',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xFF4B5766),
                  fontWeight: FontWeight.w500,
                ),
              ),
    
              const SizedBox(height: 30),
    
              Column(
                children: [
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => VerfiyCodeScreen(
                                  email: emailController.text,
                                ),
                          ),
                        );
                      } else if (state is LoginFailure) {
                        Fluttertoast.showToast(msg: state.error);
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: const Color(0xFF4B5766),
                                  fontSize: 16.sp,
                                ),
                                labelText: 'البريد الإلكتروني',
                                floatingLabelStyle: TextStyle(
                                  color: const Color(0xFF4B5766),
                                  fontSize: 20.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    50.r,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF4B5766),
                                    width: 0.8,
                                  ),
                                ),
    
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    50.r,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF4B5766),
                                    width: 0.8,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                              ),
                            ),
    
                            const SizedBox(height: 30),
    
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (emailController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                      msg:
                                          'الرجاء إدخال البريد الإلكتروني',
                                    );
                                  } else {
                                    BlocProvider.of<AuthCubit>(
                                      context,
                                    ).loginWithEmail(
                                      emailController.text,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF6B35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      50.r,
                                    ),
                                  ),
                                  elevation: 0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child:
                                      state is LoginLoading
                                          ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                          : Text(
                                            'تسجيل الدخول',
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
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'ليس لديك حساب؟ ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontFamily: 'Ping AR + LT',
                      ),
                      children: const [
                        TextSpan(
                          text: 'إنشاء حساب',
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
      ),
    );
  }
}