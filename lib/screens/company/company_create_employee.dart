
import 'package:flutter/material.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/screens/company/company_employees.dart';
import 'package:rovit/models/company_employee_model.dart';

class EmployeeFormScreen extends StatefulWidget {
  const EmployeeFormScreen({super.key});

  @override
  _EmployeeFormScreenState createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _lastName = '';
  String _password = '';
  String _email = '';
  String _phone = '';
  String? _department;
  String? _position;
  List<String> departmentOptions = ["Opción 1", "Opción 2", "Opción 3"]; // Llamada a la API para obtener las opciones de departamento
  List<String> positionOptions = ["Opción 1", "Opción 2", "Opción 3"]; // Llamada a la API para obtener las opciones de puesto

  void _submitForm() {
      if(_position != null && _department != null){ 
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          final newEmployee = Employee( name: _name, last_name: _lastName, password: _password, email: _email, mobile_phone: _phone, job_department: _department ?? '', job_description: _position ?? '', );
          final jsonEmployee = newEmployee.toJson();
          print("🟢 jsonEmployee: $jsonEmployee"); // <- Aquí ves el JSON del nuevo empleado
          _formKey.currentState!.reset();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CompanyEmployeesScreen(
              employee: newEmployee, // Aquí pasamos el empleado
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Empleado $_name agregado como $_position')),
            );
        }
      }
      else{
          (_position == null) ? 
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Seleccione un puesto')),
            ) : 
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Seleccione un departamento')),
            );
        } 
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: "Añadir\nEmpleado",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) =>
                    value!.isEmpty ? 'Introduce un nombre' : null,
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: 'Apellido'),
                validator: (value) =>
                    value!.isEmpty ? 'Introduce un apellido' : null,
                onSaved: (value) => _lastName = value!,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Introduce una contraseña' : null,
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Introduce un email' : null,
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: 'Teléfono'),
                validator: (value) =>
                    value!.isEmpty ? 'Introduce un telefono' : null,
                onSaved: (value) => _phone = value!,
              ),
            const SizedBox(height: 30),
            IntrinsicWidth(
              child:
                SizedBox(
                  width: 300,
                  child: 
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                      value: _department,
                      hint: const Text("Seleccione un departamento"),
                      onChanged: (String? newValue) {
                      setState(() {
                          _department = newValue;
                      });
                      },
                      items: departmentOptions.map((String department) {
                        return DropdownMenuItem<String>(
                          value: department,
                          child: Text(department),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                    DropdownButton<String>(
                      value: _position,
                      hint: const Text("Seleccione un puesto"),
                      onChanged: (String? newValue) {
                        setState(() {
                          _position = newValue;
                        });
                      },
                      items: positionOptions.map((String position) {
                        return DropdownMenuItem<String>(
                          value: position,
                          alignment: Alignment.centerLeft,
                          child: Text(position),
                        );
                      }).toList(),
                    ),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Agregar Empleado'),
                      ),
            ],
            ),
          ),
        ),
            ],
          ),
        ),
      ),
    );  
  }
}
