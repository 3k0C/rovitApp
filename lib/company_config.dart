import 'package:flutter/material.dart';

class CompanyConfigurationScreen extends StatelessWidget {
  const CompanyConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configurar Empresa")),
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
