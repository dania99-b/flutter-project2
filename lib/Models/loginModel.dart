class loginModel {
  late String email;

  late String password;
  late var token;

  loginModel(this.email, this.password);

  loginModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        token = json['token'];
  // Map<String, dynamic> toJson() => {
  //   "Email": email,
  //   "password": password,
  // };
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
