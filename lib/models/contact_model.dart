class ContactModel {
  String? first_name;
  String? last_name;
  String? phone;
  String? email;
  String? message;

  ContactModel(
      {required this.first_name,
      required this.last_name,
      required this.phone,
      required this.email,
      required this.message});

  Map toMap() {
    final Map map = {};
    map['first_name'] = first_name;
    map['last_name'] = last_name;
    map['phone'] = phone;
    map['email'] = email;
    map['message'] = message;
    return map;
  }
}
