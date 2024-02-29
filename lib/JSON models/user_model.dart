import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final int? userId;
    final String userName;
    final String userPassword;
    final String userEmail;
    final String userNumber;

    UserModel({
        this.userId,
        required this.userName,
        required this.userPassword,
        required this.userEmail,
        required this.userNumber,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userID"],
        userName: json["userName"],
        userPassword: json["userPassword"],
        userEmail: json["userEmail"],
        userNumber: json["userNumber"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "userName": userName,
        "userPassword": userPassword,
        "userEmail": userEmail,
        "userNumber": userNumber,
    };
}
