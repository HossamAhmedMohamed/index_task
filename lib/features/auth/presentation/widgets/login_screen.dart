import 'package:flutter/material.dart';
import 'package:index_login/features/auth/presentation/widgets/login_body.dart';
import 'package:index_login/features/auth/presentation/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
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
          LoginBody(emailController: emailController),
        ],
      ),
    );
  }
}
