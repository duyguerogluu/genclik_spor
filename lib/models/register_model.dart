class RegisterModel {
  final bool status;
  final String message;
  final String token;

  RegisterModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json["status"] == "true",
      message: json["message"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "token": token,
    };
  }
}
