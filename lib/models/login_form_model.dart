class LoginFormModel {
  final String email;
  final String password;

  LoginFormModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}