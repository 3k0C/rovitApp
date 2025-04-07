import 'package:flutter/material.dart';

final myRoundedBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  side: const BorderSide(
    color: Color(0xFF616161), // Color del borde
    width: 1, // Grosor del borde
  ),
);

class CompanyButtonHome extends StatelessWidget {
  final Widget screen;
  final String label;
  final IconData icon;
  final VoidCallback? onPressedCallback;

  const CompanyButtonHome({
    Key? key,
    required this.screen,
    required this.label,
    required this.icon,
    this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onPressedCallback ??
        () {
          // Comportamiento predeterminado si no se proporciona un callback
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Color de texto e ícono
        shape: myRoundedBorder,
        elevation: 0,
        alignment: Alignment.centerLeft,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ícono con borde
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF616161)),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(6),
            child: Icon(
              icon,
              color: Color(0xFF0582CA), // Color del ícono
              size: 25,
            ),
          ),
          const SizedBox(width: 10),
          // Texto
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
