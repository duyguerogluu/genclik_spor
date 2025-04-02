class LoginModel {
  final bool status;
  final String message;
  final String token;

  LoginModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json["status"] == "true",
      message: json["message"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status.toString(),
      "message": message,
      "token": token,
    };
  }
}
