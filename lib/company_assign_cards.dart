import 'package:flutter/material.dart';
import 'package:rovit/company_cards.dart';

class CompanyAsignCardsScreen extends StatefulWidget {
  const CompanyAsignCardsScreen({super.key});

  @override
  _CompanyAsignCardsScreen createState() => _CompanyAsignCardsScreen();
}

class _CompanyAsignCardsScreen extends State<CompanyAsignCardsScreen> {
  String? selectedCardOption, selectedEmployeeOption, selectedModelOption;
  final List<String> cardOptions = ["Opción 1", "Opción 2", "Opción 3"];
  final List<String> employeeOptions = ["Empleado 1", "Empleado 2", "Empleado 3"];
  final List<String> modelOptions = ["Modelo 1", "Modelo 2", "Modelo 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Asignar Tarjetas")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedCardOption,
              hint: const Text("Seleccione una tarjeta"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCardOption = newValue;
                });
              },
              items: cardOptions.map((String cardOption) {
                return DropdownMenuItem<String>(
                  value: cardOption,
                  child: Text(cardOption),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedEmployeeOption,
              hint: const Text("Seleccione un empleado"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedEmployeeOption = newValue;
                });
              },
              items: employeeOptions.map((String employeeOption) {
                return DropdownMenuItem<String>(
                  value: employeeOption,
                  child: Text(employeeOption),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedModelOption,
              hint: const Text("Seleccione un modelo de tarjeta"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedModelOption = newValue;
                });
              },
              items: modelOptions.map((String modelOption) {
                return DropdownMenuItem<String>(
                  value: modelOption,
                  child: Text(modelOption),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CompanyCardsScreen()),
                );
              },
              child: const Text("Aña"),
            ),
          ],
        ),
      ),
    );
  }
}
