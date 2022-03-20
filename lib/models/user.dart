class UserModel {
  String userId;
  String password;
  String userName;
  double phoneNumber;
  String address;

  UserModel({
    required this.userId,
    required this.password,
    required this.userName,
    required this.phoneNumber,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      password: json['password'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
    );
  }
}
