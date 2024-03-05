import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromMap(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toMap());

class UserModel {
    final int? userId;
    final String userName;
    final String userPassword;
    final String? userEmail;
    final String? userNumber;

    UserModel({
        this.userId,
        required this.userName,
        required this.userPassword,
        this.userEmail,
        this.userNumber,
    });

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json["userID"],
        userName: json["userName"],
        userPassword: json["userPassword"],
        userEmail: json["userEmail"],
        userNumber: json["userNumber"],
    );

    Map<String, dynamic> toMap() => {
        "userID": userId,
        "userName": userName,
        "userPassword": userPassword,
        "userEmail": userEmail,
        "userNumber": userNumber,
    };
}
