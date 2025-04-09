class User {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String mobilePhone;
  final bool isActive;
  final int idCompany;
  final int idPeople;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.mobilePhone,
    required this.isActive,
    required this.idCompany,
    required this.idPeople,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      email: json['email'],
      mobilePhone: json['mobile_phone'],
      isActive: json['is_active'],
      idCompany: json['id_company'],
      idPeople: json['id_people'],
    );
  }
  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'last_name': lastName,
    'email': email,
    'mobile_phone': mobilePhone,
    'is_active': isActive,
    'id_company': idCompany,
    'id_people': idPeople,
  };
}
}



