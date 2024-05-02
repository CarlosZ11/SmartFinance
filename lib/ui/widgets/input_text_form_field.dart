import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextFormField extends StatelessWidget {

  final String labelText;
  final IconData prefixIcon;
  final TextEditingController? controller; // Agrega el controlador aquí
  final String? valueText;
  

  const InputTextFormField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.controller,
    this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: GoogleFonts.saira(fontSize: 15),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF171731)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF29E9FF)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xFF29E9FF),
            size: 33,
          ),
          labelText: labelText,
          labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
        ),
      ),
    );
  }
}