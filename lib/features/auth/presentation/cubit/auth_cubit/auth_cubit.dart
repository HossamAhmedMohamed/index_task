import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:index_login/core/cache/secure_cache_storage.dart';
import 'package:index_login/features/auth/data/repository/repository.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> loginWithEmail(String email) async {
    emit(LoginLoading());
    final res = await authRepository.loginWithEmail(email);
    res.fold(
      (l) {
        emit(LoginFailure(error: l.errMessage));
      },
      (r) async {
        await SecureCacheHelper().saveData(key: 'userEmail', value: email);
        emit(LoginSuccess());
      },
    );
  }

  Future<void> verifyOtp(String email, String otp) async {
    emit(VerifyOtpLoading());
    final res = await authRepository.verifyOtp(email, otp);
    res.fold(
      (l) {
        emit(VerifyOtpFailure(error: l.errMessage));
      },
      (r) async{
        await SecureCacheHelper().saveData(key: 'userToken', value: r.data.token);
        log('User Token: ${r.data.token}');
        emit(VerifyOtpSuccess());
      },
    );
  }
}
