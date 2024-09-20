class UserModel{
  String id;
  String name;
  String email;
  String password;
  String phone;
  bool isEmailVerified = false;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.isEmailVerified,
  });
  //
  // getUserData(){
  //   return {
  //     "id": id,
  //     "name": name,
  //     "email": email,
  //     "password": password,
  //     "phone": phone,
  //     "isEmailVerified": isEmailVerified
  //   };
  // }

  // UserModel.fromJson(Map<String, dynamic> json){
  //     id: json['id'];
  //     name: json['name'];
  //     email: json['email'];
  //     password: json['password'];
  //     phone: json['phone'];
  //   // return UserModel(
  //   //   id: json['id'],
  //   //   name: json['name'],
  //   //   email: json['email'],
  //   //   password: json['password'],
  //   //   phone: json['phone']
  //   // );
  // }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    password: json['password'],
    phone: json['phone'],
    isEmailVerified: json['isEmailVerified'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "isEmailVerified": isEmailVerified,
  };

}