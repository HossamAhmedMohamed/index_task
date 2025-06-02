// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:index_login/features/auth/data/models/sub_models/user_data.dart';

class LoginModel {
  final UserData data;
  LoginModel({required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(data: UserData.fromJson(json['data']));
  }
}
