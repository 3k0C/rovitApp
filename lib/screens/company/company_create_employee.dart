
import 'package:flutter/material.dart';
import 'package:rovit/widgets/rovit_scaffold.dart';
import 'package:rovit/screens/company/company_employees.dart';
import 'package:rovit/models/company_employee_model.dart';
import 'package:rovit/models/user_model.dart';

class EmployeeFormScreen extends StatefulWidget {
  const EmployeeFormScreen({super.key});

  @override
  _EmployeeFormScreenState createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
final _formKey = GlobalKey<FormState>();
String? _name;
String? _lastName;
String? _email;
String? _mobilePhone;
String? _idPeople;
String? _idCompany;
String? _isActive;



User? user = null;
String? _department;
String? _position;
List<String> departmentOptions = ["Opción 1", "Opción 2", "Opción 3"];
List<String> positionOptions = ["Opción 1", "Opción 2", "Opción 3"];


void _submitForm() {
  if (_position != null && _department != null) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final user = User(
        id:0,
        name: _name!,
        lastName: _lastName!,
        email: _email!,
        mobilePhone: '722362903',
        idPeople: 0,
        idCompany: 0,
        isActive: true
      );

      final newEmployee = Employee(
        user: user,
        jobDepartment: _department!,
        jobDescription: _position!,
      );

      print("🟢 newEmployee: $newEmployee");
      print("🟢 jsonEmployee: ${newEmployee.toJson()}");

      _formKey.currentState!.reset();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CompanyEmployeesScreen(
            employee: newEmployee,
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Empleado agregado como $_position')),
      );
    }
  } else {
    (_position == null)
        ? ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Seleccione un puesto')),
          )
        : ScaffoldMessenger.of(context).showSnackBar(
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
                onSaved: (value) =>  _name = value!,
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
                    value!.isEmpty ? 'Introduce una email' : null,
                onSaved: (value) => _email = value!,
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
                onSaved: (value) => _mobilePhone = value!,
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
