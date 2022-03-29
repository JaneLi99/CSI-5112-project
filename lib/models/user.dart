class UserModel {
  String userId;
  String password;
  String userName;
  String phoneNumber;
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
      userId: json['id'],
      password: json['password'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
    );
  }

  static List<UserModel> fromListJson(List<dynamic> json) {
    List<UserModel> result = [];
    for (Map<String, dynamic> d in json) {
      UserModel userModel = UserModel.fromJson(d);
      result.add(userModel);
    }
    return result;
  }

  String toString() {
    return "${this.userId} + ${this.userName} + ${this.phoneNumber} + ${this.address}";
  }
}
