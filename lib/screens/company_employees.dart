import 'package:flutter/material.dart';
import 'package:rovit/screens/company_assign_cards.dart';
import 'package:rovit/widgets/company_fab.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';

class CompanyEmployeesScreen extends StatelessWidget {
  const CompanyEmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: "Mis Empleados",
      floatingActionButton: CompanyFloatingButton(
        screen: const CompanyAssignCardsScreen(),
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
                for (int i = 1; i <= 5; i++)
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("EMPLEADO $i", textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("EMAIL $i", textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("CARD $i", textAlign: TextAlign.center),
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
            ),
          ],
        ),
      ),
    );
  }
}
