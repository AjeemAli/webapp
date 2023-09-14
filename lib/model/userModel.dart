class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({this.id, this.email, this.avatar, this.firstName, this.lastName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['frist_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}
