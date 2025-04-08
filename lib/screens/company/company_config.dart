import 'package:flutter/material.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';

class CompanyConfigurationScreen extends StatelessWidget {
  const CompanyConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: "Configuración",
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Inicio"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
