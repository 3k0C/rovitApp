import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rovit/screens/company/company_employees.dart';
import 'package:rovit/screens/company/company_cards.dart';

class CompanySearchBarHome extends StatefulWidget {
  final String hintText;

  const CompanySearchBarHome({
    super.key,
    required this.hintText,
  });

  @override
  _CompanySearchBarHomeState createState() => _CompanySearchBarHomeState();
}

class _CompanySearchBarHomeState extends State<CompanySearchBarHome> {
  final TextEditingController _searchController = TextEditingController();
  final Map<String, Widget> _allItems = {
    "Empleados": CompanyEmployeesScreen(),
    "Tarjetas": const CompanyCardsScreen(),
    "Armen": const CompanyCardsScreen(),
  };
  List<String> _filteredItems = [];
  bool _showClearIcon = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _filteredItems = [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _filterItems(query);
    });
  }

  void _filterItems(String query) {
    final shouldShowClearIcon = query.isNotEmpty;
    final filteredResults = query.length >= 2
        ? _allItems.keys
            .where((item) => item.toLowerCase().contains(query.trim().toLowerCase()))
            .toList()
        : [];

    // Solo actualiza el estado si hay cambios
    if (_showClearIcon != shouldShowClearIcon || _filteredItems != filteredResults) {
      setState(() {
        _showClearIcon = shouldShowClearIcon;
        _filteredItems = filteredResults as List<String>;
      });
    }
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _filteredItems = [];
      _showClearIcon = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _showClearIcon
                      ? IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: _clearSearch,
                        )
                      : null,
                ),
                onChanged: _onSearchChanged,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus(); // Cierra el teclado al tocar fuera
                },
              ),
            ),
          ],
        ),
        if (_filteredItems.isNotEmpty)
          Positioned(
            top: 70,
            left: 8,
            right: 8,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = _filteredItems[index];
                    return ListTile(
                      title: Text(
                        item,
                        style: const TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        _onItemSelected(item);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _onItemSelected(String selectedItem) {
    setState(() {
      _searchController.text = selectedItem;
      _filteredItems.clear();
      _showClearIcon = true;
    });
    print("Elemento seleccionado: $selectedItem");

    final selectedScreen = _allItems[selectedItem];
    if (selectedScreen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => selectedScreen),
      );
    }
  }
}