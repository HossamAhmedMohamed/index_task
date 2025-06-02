import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:index_login/core/api/dio_consumer.dart';
import 'package:index_login/features/auth/data/data%20soutce/remote_data_source.dart';
import 'package:index_login/features/auth/data/repository/repository.dart';
import 'package:index_login/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:index_login/features/auth/presentation/widgets/login_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => AuthCubit(
              AuthRepository(
                remoteDataSource: RemoteDataSource(
                  apiConsumer: DioConsumer(dio: Dio()),
                ),
              ),
            ),
        child: LoginScreen(emailController: emailController),
      ),
    );
  }
}
