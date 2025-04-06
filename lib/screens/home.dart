import 'package:flutter/material.dart';
import 'package:rovit/screens/company_assign_cards.dart';
import 'package:rovit/screens/company_cards.dart';
import 'package:rovit/screens/company_config.dart';
import 'package:rovit/screens/company_employees.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/widgets/company_button_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: "Inicio",
      body: Center(
        child: IntrinsicWidth( 
          child: SizedBox(
            width: 300,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CompanyButtonHome(
              screen: const CompanyCardsScreen(), 
              label: "Tarjetas",
              icon: Icons.credit_card,
              ),
            const SizedBox(height: 10),
            CompanyButtonHome(
              screen: const CompanyEmployeesScreen(), 
              label: "Empleados",
              icon: Icons.people,
              ),
            const SizedBox(height: 10),
            CompanyButtonHome(
              screen: const CompanyAssignCardsScreen(), 
              label: "Asignar Tarjetas",
              icon: Icons.add_card,
              ),
            const SizedBox(height: 10),
            CompanyButtonHome(
              screen: const CompanyConfigurationScreen(), 
              label: "Configuración",
              icon: Icons.settings,
              ),
          ],
        ),
      ),
      ),
      ),
    );
  }
}

