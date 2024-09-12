import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginPage({super.key, required this.onLoginSuccess});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();
  bool _obscureText = true; // Variable para controlar la visibilidad de la clave

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Logo.png'),
                ),
              ),
            ),
            Text(
              "SmartFinance",
              style: GoogleFonts.saira(
                color: const Color(0xFF171731),
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Tu aliado financiero",
              style: GoogleFonts.saira(
                color: const Color(0xFF171731),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              textAlign: TextAlign.center,
              "Cajero multiservicios para el retiro seguro de tu dinero.",
              style: GoogleFonts.saira(
                color: const Color(0xFF171731),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _cedulaController,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.saira(fontSize: 15),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF171731)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF171731)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(
                        Remix.id_card_fill,
                        color: Color(0xFF171731),
                        size: 30,
                      ),
                      labelText: "Cédula",
                      labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _claveController,
                    obscureText: _obscureText, // Usar la variable para controlar la visibilidad
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.saira(fontSize: 15),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF171731)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF171731)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(
                        Remix.key_2_fill,
                        color: Color(0xFF171731),
                        size: 33,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Remix.eye_close_fill : Remix.eye_fill,
                          color: const Color(0xFF171731),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText; // Alternar visibilidad
                          });
                        },
                      ),
                      labelText: "Clave",
                      labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     _validateLogin();
                  //   },
                  //   child: const Text('Iniciar Sesión'),
                  // ),
                  Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 30,),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF29E9FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color(0xFF171731),
                      ),
                      onPressed: () {
                        _validateLogin();
                      },
                      child: Text(
                        'Iniciar Sesión',
                        style: GoogleFonts.saira(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  void _validateLogin() {
    // Simular la validación de las credenciales
    if (_cedulaController.text == "1003242813" && _claveController.text == "1967") {
      widget.onLoginSuccess();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Credenciales incorrectas',
              style: GoogleFonts.saira(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          backgroundColor: const Color(0xFF171731),
        ),
      );
    }
  }
}
