import 'package:elisoft_flutter_test/models/login/user.dart';

class UserResponse {
    int? code;
    bool? status;
    String? message;
    User? user;

    UserResponse({
        this.code,
        this.status,
        this.message,
        this.user,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
}

