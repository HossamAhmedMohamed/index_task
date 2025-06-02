import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:index_login/core/api/dio_consumer.dart';
import 'package:index_login/features/auth/data/data%20soutce/remote_data_source.dart';
import 'package:index_login/features/auth/data/repository/repository.dart';
import 'package:index_login/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';

import 'package:index_login/features/auth/presentation/widgets/verify_otp.dart';

class VerfiyCodeScreen extends StatefulWidget {
  const VerfiyCodeScreen({super.key, this.email});

  final String? email;

  @override
  State<VerfiyCodeScreen> createState() => _VerfiyCodeScreenState();
}

class _VerfiyCodeScreenState extends State<VerfiyCodeScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(
          AuthRepository(
            remoteDataSource: RemoteDataSource(
              apiConsumer: DioConsumer(dio: Dio()),
            ),
          ),
        ),
        child: VerifyOtp(
          email: widget.email,
          pinController: pinController,
          focusNode: focusNode,
        ),
      ),
    );
  }
}
