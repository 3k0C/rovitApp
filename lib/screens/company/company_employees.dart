import 'package:flutter/material.dart';
import 'package:rovit/screens/company/company_assign_cards.dart';
import 'package:rovit/widgets/company_fab.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/screens/company/company_create_employee.dart';
import 'package:rovit/models/company_employee_model.dart';

import 'dart:convert'; // Para decodificar JSON
import 'package:http/http.dart' as http;

class CompanyEmployeesScreen extends StatefulWidget {
  final Employee? employee;
  const CompanyEmployeesScreen({super.key, this.employee}); // Variable para almacenar el código de estado
  

  @override
  _CompanyEmployeesScreenState createState() => _CompanyEmployeesScreenState();
}

class _CompanyEmployeesScreenState extends State<CompanyEmployeesScreen> {
  List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    fetchEmployees();
    }


void fetchEmployees() async {
  const String apiUrl = 'https://dev-api-rovit.ecoitec.io/api/v1/peoples';
  try {
    final response = await http.get(Uri.parse(apiUrl));

    print("🟢 response.body: ${response.body}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print("🟢 jsonResponse: $jsonResponse");

      // AQUÍ pones la línea que mencionaste:
      List<Employee> loadedEmployees = (jsonResponse['data']['data'] as List)
          .map((item) => Employee.fromJson(item))
          .toList();

      setState(() {
        employees = loadedEmployees;
      });

      if (loadedEmployees.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No hay empleados')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener empleados: ${response.statusCode}')),
      );
    }
  } catch (e) {
    print("🔴 Error en fetchEmployees: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error de red: $e')),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: "Mis Empleados",
      floatingActionButton: CompanyFloatingButton(
        screen: EmployeeFormScreen(),
        ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Table(
              columnWidths: const {
                0: FractionColumnWidth(0.35),
                1: FractionColumnWidth(0.35),
                2: FractionColumnWidth(0.2),
                3: FractionColumnWidth(0.1),
              },
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Empleado", textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("E-mail", textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("ID Tarjeta", textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("", textAlign: TextAlign.center),
                  ),
                ]),
                for (var employee in employees) ...[
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${employee.user.name} ${employee.user.lastName}", textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(employee.user.email, textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(employee.jobDescription ?? '-', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CompanyAssignCardsScreen()),
                          );
                        },
                        child: const Text("+"),
                      ),
                    ),
                  ]),                   
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
