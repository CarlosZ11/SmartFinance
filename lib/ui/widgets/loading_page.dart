import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171731),
      body: Center(
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
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Tu aliado financiero",
              style: GoogleFonts.saira(
                color: Colors.grey[200],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30,),
            const SpinKitFadingCube(color: Color(0xFF29E9FF), duration: Duration(seconds: 3),),
          ],
        ),
      ),
    );
  }
}