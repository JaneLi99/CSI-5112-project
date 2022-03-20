class UserModel {
  String userId;
  String password;
  String userName;
<<<<<<< HEAD
  double phoneNumber;
=======
  String phoneNumber;
>>>>>>> a54d77b (Updated user setting)
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
<<<<<<< HEAD
=======

  static List<UserModel> fromListJson(List<dynamic> json) {
    List<UserModel> result = [];
    for (Map<String, dynamic> d in json) {
      // print(json.length);
      // print(d.toString());
      UserModel userModel = UserModel.fromJson(d);
      // print(productModel.toString());
      result.add(userModel);
    }
    return result;
  }
   String toString(){
    return "${this.userId} + ${this.userName} + ${this.phoneNumber} + ${this.address}";
  }
>>>>>>> a54d77b (Updated user setting)
}
