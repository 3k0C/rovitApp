class Employee {
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String? department;
  final String? position;
  
//metodo constructor
  Employee({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    this.department,
    this.position,
  });
  // Método para convertir un objeto Employee a JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'department': department,
      'position': position,
    };
  }
factory Employee.fromJson(Map<String, dynamic> json) {
  return Employee(
    name: json['name'] ?? '',
    lastName: json['lastName'] ?? '',
    email: json['email'] ?? '',
    phone: json['phone'] ?? '',
    department: json['department'] ?? '',
    position: json['position'] ?? '',
  );
}
}
