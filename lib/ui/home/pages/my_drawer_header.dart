import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF171731),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
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
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Retiros",
            style: GoogleFonts.saira(
              color: Colors.grey[200],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
