import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppPage extends StatelessWidget {
  const HomeAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "La calculadora financiera para tus cálculos de Interés simple, Compuesto, Anualidades, Gradientes, Sistemas de amortización y Tasa interna de retorno.",
            style: GoogleFonts.saira(
              color: const Color(0xFF171731),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Finanzas.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}