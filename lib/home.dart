import 'package:flutter/material.dart';
import 'package:rovit/company_assign_cards.dart';
import 'package:rovit/company_cards.dart';
import 'package:rovit/company_config.dart';
import 'package:rovit/company_employees.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CompanyCardsScreen()),
                );
              },
              child: const Text("Mis Tarjetas"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CompanyEmployeesScreen()),
                );
              },
              child: const Text("Empleados"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CompanyAsignCardsScreen()),
                );
              },
              child: const Text("Asignar Tarjetas"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CompanyConfigurationScreen()),
                );
              },
              child: const Text("Configuración"),
            ),
          ],
        ),
      ),
    );
  }
}
