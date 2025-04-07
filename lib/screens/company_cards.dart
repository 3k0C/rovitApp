import 'package:flutter/material.dart';
import 'package:rovit/screens/company_assign_cards.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/widgets/company_fab.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class CompanyCardsScreen extends StatefulWidget {
  const CompanyCardsScreen({super.key});

  @override
  State<CompanyCardsScreen> createState() => _CompanyCardsScreenState();
}

class _CompanyCardsScreenState extends State<CompanyCardsScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: "Mis Tarjetas",
      floatingActionButton: ElevatedButton(
              onPressed: () async {
                String? res = await SimpleBarcodeScanner.scanBarcode(
                  context,
                  barcodeAppBar: const BarcodeAppBar(
                    appBarTitle: 'Test',
                    centerTitle: false,
                    enableBackButton: true,
                    backButtonIcon: Icon(Icons.arrow_back_ios),
                  ),
                  isShowFlashIcon: true,
                  delayMillis: 500,
                  cameraFace: CameraFace.back,
                  scanFormat: ScanFormat.ONLY_QR_CODE,
                );
                setState(() {
                  result = res as String;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Resultado: $result'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                });
              },
              child: const Text('+'),
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
