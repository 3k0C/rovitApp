import 'package:flutter/material.dart';
import 'package:rovit/screens/company_assign_cards.dart';
import 'package:rovit/widgets/company_fab.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/screens/company_create_employee.dart';
import 'package:rovit/models/companyEmployee.dart';

class CompanyEmployeesScreen extends StatefulWidget {
  final Employee? employee;
  const CompanyEmployeesScreen({super.key, this.employee});
  

  @override
  _CompanyEmployeesScreenState createState() => _CompanyEmployeesScreenState();
}

class _CompanyEmployeesScreenState extends State<CompanyEmployeesScreen> {
  late List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    fetchEmployees();
    }

  void fetchEmployees() async {
    // Aquí harías la llamada a la API y actualizarías la lista.
    setState(() {
        if (widget.employee != null) {
            employees.add(widget.employee!);
        }
    });
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
                      child: Text(employee.name, textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(employee.email, textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(employee.position, textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                        ElevatedButton(
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
