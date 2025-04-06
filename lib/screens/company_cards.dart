import 'package:flutter/material.dart';
import 'package:rovit/screens/company_assign_cards.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/widgets/company_fab.dart';

class CompanyCardsScreen extends StatelessWidget {
  const CompanyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: "Mis Tarjetas",
      floatingActionButton: CompanyFloatingButton(
        screen: const CompanyAssignCardsScreen(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Table(
              columnWidths: const {
                0: FractionColumnWidth(0.2),
                1: FractionColumnWidth(0.6),
                2: FractionColumnWidth(0.1),
                3: FractionColumnWidth(0.1),
              },
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("ID Tarjeta", textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Empleado", textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("", textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("", textAlign: TextAlign.center),
                  ),
                ]),
                for (int i = 1; i <= 3; i++)
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("CARD-$i", textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("EMPLEADO $i", textAlign: TextAlign.center),
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
                          child: const Text("-"),
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
