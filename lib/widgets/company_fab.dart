import 'package:flutter/material.dart';

class CompanyFloatingButton extends StatelessWidget {
  final Widget? screen;
  final VoidCallback? onPressedCallback;

  const CompanyFloatingButton({
    super.key,
    required this.screen,
    this.onPressedCallback,
  });

  const CompanyFloatingButton.scannerInstance({
    super.key,
    required this.onPressedCallback
  }) : screen = null;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
            onPressed: onPressedCallback ?? 
                      () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => screen!),
                          );
                        },
            backgroundColor: const Color(0xFF0582CA),
            child: const Icon(Icons.add),
          );
  }
  
}