class RegisterFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? profilePicture;

  RegisterFormModel({
    this.name,
    this.email,
    this.password,
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'photo': profilePicture,
    };
  }

  RegisterFormModel copyWith({
    String? name,
    String? email,
    String? password,
    String? profilePicture,
  }) =>
      RegisterFormModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        profilePicture: profilePicture ?? this.profilePicture,
      );
}
