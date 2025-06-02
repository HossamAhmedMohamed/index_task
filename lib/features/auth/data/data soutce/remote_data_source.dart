import 'package:index_login/core/api/api_consumer.dart';
import 'package:index_login/features/auth/data/models/login_model.dart';

class RemoteDataSource {
  final ApiConsumer apiConsumer;

  RemoteDataSource({required this.apiConsumer});

  Future<void> loginWithEmail(String email) async {
    await apiConsumer.post('otp', data: {'email': email});
  }

  Future<LoginModel> verifyOtp(String email, String otp) async {
    final res =  await apiConsumer.post(
      'verify',
      data: {'email': email, 'otp': otp},
    );
    return LoginModel.fromJson(res);
  }
}
