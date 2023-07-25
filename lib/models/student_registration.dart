class StudentRegistration {
  String? email_address;
  String? full_name;
  String? phone_number;
  String? username;
  String? password;
  String? confirm_password;

  StudentRegistration(
      {required this.email_address,
      required this.full_name,
      required this.phone_number,
      required this.username,
      required this.password,
      required this.confirm_password});

  Map toJson() {
    final map = {};
    map['email_address'] = email_address;
    map['full_name'] = full_name;
    map['phone_number'] = phone_number;
    map['username'] = username;
    map['password'] = password;
    map['confirm_password'] = confirm_password;
    return map;
  }

  StudentRegistration.fromJson(dynamic json) {
    email_address = json['email_address'];
    full_name = json['full_name'];
    phone_number = json['phone_number'];
    username = json['username'];
    password = json['password'];
    confirm_password = json['confirm_password'];
  }
}
