class Employee {
  final String name;
  final String last_name;
  final String password;
  final String email;
  final String mobile_phone;
  final String? job_description;
  final String? job_department;
  
//metodo constructor
  Employee({
    required this.name,
    required this.last_name,
    required this.password,
    required this.email,
    required this.mobile_phone,
    required this.job_description,
    required this.job_department,
  });
  // Método para convertir un objeto Employee a JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': last_name,
      'password': password,
      'email': email,
      'phone': mobile_phone,
      'job_description': job_description,
      'job_department': job_department,
    };
  }
factory Employee.fromJson(Map<String, dynamic> json) {
  return Employee(
    name: json['name'] ?? '',
    last_name: json['lastName'] ?? '',
    password: json['password'] ?? '',
    email: json['email'] ?? '',
    mobile_phone: json['phone'] ?? '',
    job_department: json['job_department'] ?? '',
    job_description: json['job_description'] ?? '',
  );
}
}
