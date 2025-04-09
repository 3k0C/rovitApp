import 'package:rovit/models/user_model.dart';

class Employee {
  final User user;
  final String? jobDescription;
  final String? jobDepartment;

  Employee({
    required this.user,
    this.jobDescription,
    this.jobDepartment,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      user: User.fromJson(json['user']),
      jobDescription: json['job_description'],
      jobDepartment: json['job_department'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'job_description': jobDescription,
      'job_department': jobDepartment,
    };
  }
}
