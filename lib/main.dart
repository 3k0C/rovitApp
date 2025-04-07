import 'package:flutter/material.dart';
import 'package:rovit/screens/home.dart';
import 'package:rovit/screens/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rovit/widgets/login/login_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RoViT',
      theme: ThemeData(
        textTheme:
        GoogleFonts.manropeTextTheme(ThemeData().textTheme).apply(
          bodyColor: const Color(0xFFFFFFFF),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark, 
          primary: const Color(0xFF0582CA), 
          onPrimary: const Color(0xFFFFFFFF), 
          secondary: const Color(0xFF03DAC6), 
          onSecondary: const Color(0xFF000000), 
          error: const Color(0xFFB00020), 
          onError: const Color(0xFFFFFFFF), 
          surface: const Color(0xFF1B1B1B), 
          onSurface: const Color(0xFFFFFFFF),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1C1A1B),
            foregroundColor: const Color(0xFFFFFFFF),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Simulación de autenticación
      if (_emailController.text == "test@example.com" &&
          _passwordController.text == "password123") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Inicio de sesión exitoso"), backgroundColor: Colors.green,),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciales incorrectas"), backgroundColor: Colors.red,),
        );
      }
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.qr_code_scanner, size: 100, color: Color(0xFF0582CA)),
                    const SizedBox(height: 20),
                    const Text(
                      "Acceso a RoViT",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Correo electrónico",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingrese su correo";
                        } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
                            .hasMatch(value)) {
                          return "Ingrese un correo válido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: "Contraseña",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingrese su contraseña";
                        } else if (value.length < 6) {
                          return "La contraseña debe tener al menos 6 caracteres";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("¿Olvidaste tu contraseña?"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children:[
                        Expanded(
                          child:
                            CustomButton(label: "Inicio de sesión", onPressed: _login),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "¿No tienes cuenta?",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      label: "Usuario",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterFormScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      label: "Empresa",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterFormScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}