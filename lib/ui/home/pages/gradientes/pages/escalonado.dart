import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:calculator_app/ui/widgets/input_text_form_field.dart';

class EscalonadoCalculator {
  static Map<String, double> calcularValorPresente(double seriePagos, double tasaInteres, int nPeriodos, double tasaEfectiva, double tasaIncremento, int plazoObligacion) {
    double parte1 = (pow((1 + tasaInteres), nPeriodos) - 1) / tasaInteres;
    double parte2 = ((pow((1 + tasaEfectiva), plazoObligacion) - (1 + tasaIncremento)) / ((pow((1 + tasaEfectiva), plazoObligacion)) * (tasaEfectiva - tasaInteres)));
    double valorPresente = seriePagos * parte1 * parte2;
    return {'valorPresente': valorPresente};
  }
}

class EscalonadoPage extends StatefulWidget {
  const EscalonadoPage({super.key});

  @override
  State<EscalonadoPage> createState() => _EscalonadoPageState();
}

class _EscalonadoPageState extends State<EscalonadoPage> {

  TextEditingController seriePagosController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();
  TextEditingController tasaEfectivaController = TextEditingController();
  TextEditingController nPeriodosController = TextEditingController();
  TextEditingController plazoObligacionController = TextEditingController();
  TextEditingController tasaIncrementoController = TextEditingController();
  String? tipoGradiente; // Creciente, decreciente
  double? valorPresente;

  void calcularResultado() {
    double seriePagos = double.tryParse(seriePagosController.text) ?? 0;
    double tasaInteres = double.tryParse(tasaInteresController.text) ?? 0;
    double tasaEfectiva = double.tryParse(tasaEfectivaController.text) ?? 0;
    int nPeriodos = int.tryParse(nPeriodosController.text) ?? 0;
    int plazoObligacion = int.tryParse(plazoObligacionController.text) ?? 0;
    double tasaIncremento = double.tryParse(tasaIncrementoController.text) ?? 0;

    // Calcular el valor presente
    Map<String, double> resultado = EscalonadoCalculator.calcularValorPresente(seriePagos, tasaInteres/100, nPeriodos, tasaEfectiva/100, tasaIncremento/100, plazoObligacion);

    setState(() {
      valorPresente = resultado['valorPresente'];
    });

    // Mostrar el resultado en un diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Resultado',
            style: GoogleFonts.saira(
              color: const Color(0xFF29E9FF),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Valor Presente (VP): \$${valorPresente?.toStringAsFixed(2)}',
                style: GoogleFonts.saira(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171731),
        title: Text(
          "ESCALONADO",
          style: GoogleFonts.saira(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF29E9FF)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Escalonado", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: " es un tipo de gradiente el cual sus valores son constantes durante los periodos de un año," 
                                " pero que puede aumentar o disminuir en una cantidad fija de dinero o en una tasa constante.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                        TextSpan(
                          text: " Donde P ó VP es valor inicial de la obligación", 
                          style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ]
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Math.tex(
                    r'P=A_1\left[\frac{\left(1+i\right)^n-1}{i}\right]\left[\frac{\left(1+TEA\right)^E-\left(1+J\right)}{\left(1+TEA\right)^E\left(1-J\right)}\right]',
                    textStyle: GoogleFonts.saira(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            InputTextFormField(labelText: "Valor cuota (A)", prefixIcon: Remix.coins_fill, valueText: '', controller: seriePagosController,),
            InputTextFormField(labelText: "Tasa de Interés por periodo (i)", prefixIcon: Remix.discount_percent_fill, valueText: '', controller: tasaInteresController,),
            InputTextFormField(labelText: "Número periodos (n)", prefixIcon: Remix.numbers_line, valueText: '', controller: nPeriodosController,),
            InputTextFormField(labelText: "Tasa efectiva anual (TEA)", prefixIcon: Remix.percent_line, valueText: '', controller: tasaEfectivaController,),
            InputTextFormField(labelText: "Tasa incremento (J)", prefixIcon: Remix.swap_line, valueText: '', controller: tasaIncrementoController,),
            InputTextFormField(labelText: "Plazo obligación (E)", prefixIcon: Remix.calendar_todo_line, valueText: '', controller: plazoObligacionController,),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 400,
              margin: const EdgeInsets.symmetric(horizontal: 30,),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF29E9FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFF171731),
                ),
                onPressed: calcularResultado,
                child: Text(
                  'Calcular Resultado',
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
    );
  }
}
