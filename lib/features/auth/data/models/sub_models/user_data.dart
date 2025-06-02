// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final String email;
  final String token;
  UserData({required this.email, required this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(email: json['email'], token: json['token'] ?? '');
  }
}
