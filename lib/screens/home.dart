import 'package:flutter/material.dart';
import 'package:rovit/screens/company/company_assign_cards.dart';
import 'package:rovit/screens/company/company_cards.dart';
import 'package:rovit/screens/company/company_config.dart';
import 'package:rovit/screens/company/company_employees.dart';
import 'package:rovit/widgets/home/company_searchbar_home.dart';
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
          child: Stack(
            children: [
              // Botones principales
              Padding(
                padding: const EdgeInsets.only(top: 80), // Deja espacio para la barra de búsqueda
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CompanyButtonHome(
                            screen: const CompanyCardsScreen(),
                            label: "Tarjetas",
                            icon: Icons.credit_card,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CompanyButtonHome(
                            screen: CompanyEmployeesScreen(),
                            label: "Empleados",
                            icon: Icons.people,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CompanyButtonHome(
                            screen: const CompanyAssignCardsScreen(),
                            label: "Asignar Tarjetas",
                            icon: Icons.add_card,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CompanyButtonHome(
                            screen: const CompanyConfigurationScreen(),
                            label: "Configuración",
                            icon: Icons.settings,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Barra de búsqueda
              Positioned(
                height: 300, //Altura del lista de búsqueda
                top: 0,
                left: 0,
                right: 0,
                child: CompanySearchBarHome(
                  hintText: "Buscar",
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}

