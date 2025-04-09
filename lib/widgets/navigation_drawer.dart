import 'package:flutter/material.dart';
import 'package:rovit/models/drawer_item.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MyNavigationDrawer extends StatelessWidget {
  
  final Map<String, String> _user = {
    'name': 'John Doe',
    'role': 'Admin',
  };
  final List<DrawerItem> screens;

  MyNavigationDrawer({super.key, required this.screens});

    void fetchCompanyDetails() async {
      const String apiUrl = 'https://dev-api-rovit.ecoitec.io/api/v1/companies/1/detail';
      try {
        final response = await http.get(Uri.parse(apiUrl));
        // _user['name'] = response.body['data']['name'];

        }
      catch (e) {}
      }
    void OnInit() {
    fetchCompanyDetails();
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
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
            for (var item in screens)
              ListTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item.screen),
                  );
                },
              ),

            const Divider(),

            // Cerrar sesión como ítem fijo
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