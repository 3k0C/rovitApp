import 'package:flutter/material.dart';
import 'package:rovit/screens/company/company_assign_cards.dart';
import 'package:rovit/screens/company/company_cards.dart';
import 'package:rovit/screens/company/company_config.dart';
import 'package:rovit/screens/company/company_employees.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/widgets/home/company_button_home.dart';

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
            SearchBar(
              hintText: "Buscar",
              elevation: WidgetStatePropertyAll(10),
              onChanged: (value) {
                // Handle search logic here
              },
            ),
            const SizedBox(height: 30),
            CompanyButtonHome(
              screen: const CompanyCardsScreen(), 
              label: "Tarjetas",
              icon: Icons.credit_card,
              ),
            const SizedBox(height: 10),
            CompanyButtonHome(
              screen: CompanyEmployeesScreen(), 
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

