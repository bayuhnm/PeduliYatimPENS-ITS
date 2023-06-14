class UserModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? profilePicture;
  String? birthDate;
  String? phone;
  String? bio;
  String? accessToken;
  String? tokenType;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.phone,
      this.birthDate,
      this.bio,
      this.profilePicture,
      this.accessToken,
      this.tokenType,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    phone = json['phone'];
    birthDate = json['birth_date'];
    bio = json['bio'];
    profilePicture = json['photo'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['phone'] = phone;
    data['birth_date'] = birthDate;
    data['bio'] = bio;
    data['photo'] = profilePicture;
    data['api_token'] = accessToken;
    data['token_type'] = tokenType;
    data['created_at'] = createdAt;
    data['update_at'] = updatedAt;
    return data;
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        emailVerifiedAt: emailVerifiedAt,
        phone: phone,
        birthDate: birthDate,
        bio: bio,
        profilePicture: profilePicture,
        accessToken: accessToken,
        tokenType: tokenType,
      );
}