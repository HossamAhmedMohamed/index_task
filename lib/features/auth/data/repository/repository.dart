// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:index_login/core/error_handling/exceptions.dart';
import 'package:index_login/core/error_handling/failure.dart';
import 'package:index_login/features/auth/data/data%20soutce/remote_data_source.dart';
import 'package:index_login/features/auth/data/models/login_model.dart';

class AuthRepository {
  final RemoteDataSource remoteDataSource;
  AuthRepository({required this.remoteDataSource});

  Future<Either<Failure, void>> loginWithEmail(String email) async {
    try {
      await remoteDataSource.loginWithEmail(email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  Future<Either<Failure, LoginModel>> verifyOtp(
    String email,
    String otp,
  ) async {
    try {
      final res = await remoteDataSource.verifyOtp(email, otp);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
