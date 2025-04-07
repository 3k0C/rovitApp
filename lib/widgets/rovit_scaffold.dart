import 'package:flutter/material.dart';
import 'package:rovit/screens/company_assign_cards.dart';
import 'package:rovit/screens/company_employees.dart';
import 'package:rovit/screens/company_cards.dart';
import 'package:rovit/screens/company_config.dart';
import 'package:rovit/screens/home.dart';


class MyScaffold extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final Widget? floatingActionButton;

  MyScaffold({Key? key, required this.body, required this.appBarTitle, this.floatingActionButton}) : super(key: key);

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
        ),
      body: body,
      drawer: NavigationDrawer(),
      floatingActionButton: floatingActionButton, // Agrega el FAB al Scaffold
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Centra el FAB
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  final Map<String, String> _user = {
    'name': 'John Doe',
    'role': 'Admin',
  };
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rovit', style: TextStyle(fontSize: 24, color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Bienvenido ${_user['name'] ?? ''}', style: TextStyle(fontSize: 16, color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Rol: ${_user['role'] ?? ''}', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Tarjetas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CompanyCardsScreen(),
                ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Empleados'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyEmployeesScreen(),
                ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_card),
              title: Text('Asignar Tarjetas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyAssignCardsScreen(),
                ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CompanyConfigurationScreen(),
                            ),
                          );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
          ],
        ),
      );
}