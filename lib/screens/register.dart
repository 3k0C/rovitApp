import 'package:flutter/material.dart';
import 'package:rovit/screens/home.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';

class RegisterFormScreen extends StatefulWidget {
  _RegisterFormScreen createState() => _RegisterFormScreen();
}

class _RegisterFormScreen extends State<RegisterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _userType = 'Empleado'; // Valor por defecto

 void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí puedes manejar el registro del usuario, como llamar a una API o guardar en una base de datos local.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario $_name registrado')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro', style: TextStyle(fontSize: 15),),
        backgroundColor: const Color(0xFF0582CA),
      ),
      body: Center(
        child:
        Form(
          key: _formKey,
          child: 
        IntrinsicWidth(
          child: SizedBox(
            width: 300,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre usuario'),
                  validator: (value) => value!.isEmpty ? 'Introduce un nombre' : null,
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty ? 'Introduce un email' : null,
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  validator: (value) => value!.isEmpty ? 'Introduce una contraseña' : null,
                  onSaved: (value) => _password = value!,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                const Spacer(),
                ElevatedButton(
                  // Cambia el color de fondo y el color del texto
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0582CA), // Color de fondo
                    foregroundColor: Colors.white, // Color de texto e ícono
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}