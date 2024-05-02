import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final TextEditingController? capitalController;
  final TextEditingController? tasaInteresController;
  final TextEditingController? tiempoController;

  CustomAlertDialog({super.key, required this.title, required this.content, this.capitalController, this.tasaInteresController, this.tiempoController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.saira(
          color: const Color(0xFF29E9FF),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content,
        style: GoogleFonts.saira(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            capitalController?.clear();
            tasaInteresController?.clear();
            tiempoController?.clear();
          },
          child: Text(
            'OK',
            style: GoogleFonts.saira(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF29E9FF),
            ),
          ),
        ),
      ],
    );
  }
}