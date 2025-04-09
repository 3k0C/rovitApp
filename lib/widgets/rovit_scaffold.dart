import 'package:flutter/material.dart';
import 'package:rovit/screens/company/company_assign_cards.dart';
import 'package:rovit/screens/company/company_employees.dart';
import 'package:rovit/screens/company/company_cards.dart';
import 'package:rovit/screens/company/company_config.dart';
import 'package:rovit/models/drawer_item.dart';
import 'package:rovit/widgets/navigation_drawer.dart';



class MyScaffold extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final Widget? floatingActionButton;

  MyScaffold({super.key, required this.body, required this.appBarTitle, this.floatingActionButton});

  final List<DrawerItem> screens = [
    DrawerItem(title: 'Tarjetas', icon: Icons.credit_card, screen: CompanyCardsScreen()),
    DrawerItem(title: 'Empleados', icon: Icons.people, screen: CompanyEmployeesScreen()),
    DrawerItem(title: 'Asignar Tarjetas', icon: Icons.add_card, screen: CompanyAssignCardsScreen()),
    DrawerItem(title: 'Configuración', icon: Icons.settings, screen: CompanyConfigurationScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
            appBarTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
          ),
            leading: Navigator.canPop(context) ? _buildBackArrow(context) : null, // Muestra el botón de retroceso solo si se puede volver atrás
        ),
      body: body,
      drawer: MyNavigationDrawer(screens: screens), // Agrega el NavigationDrawer al Scaffold
      floatingActionButton: floatingActionButton, // Agrega el FAB al Scaffold
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Centra el FAB
    );
  }
}

Widget _buildBackArrow(context){
           return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Vuelve a la pantalla anterior
                },
              );
}