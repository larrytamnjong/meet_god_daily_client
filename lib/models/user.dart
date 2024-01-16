class User {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? creationDate;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.phone,
      this.password,
      this.creationDate});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? "",
      fullName: json['full_name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      password: json['password'] ?? "",
      creationDate: json['creation_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? "",
      'full_name': fullName ?? "",
      'email': email ?? "",
      'phone': phone ?? "",
      'password': password ?? ""
    };
  }
}
