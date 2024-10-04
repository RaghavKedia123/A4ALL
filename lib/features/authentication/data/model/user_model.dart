class UserModel {
  final String token_type;
  final String access_token;
  final int expires_in;

  UserModel({
    required this.token_type,
    required this.access_token,
    required this.expires_in,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        token_type: json['token_type'],
        access_token: json['access_token'],
        expires_in: json['expires_in']);
  }

  Map<String, dynamic> toJson() {
    return {
      'token_type': token_type,
      'access_token': access_token,
      'expires_in': expires_in
    };
  }
}
