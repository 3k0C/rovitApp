import 'package:flutter/material.dart';

class CompanyFloatingButton extends StatelessWidget {
  final Widget screen;

  const CompanyFloatingButton({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
              onPressed: () {
              Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => screen),
              );
              },
              child: const Icon(Icons.add),
            );
  }
}