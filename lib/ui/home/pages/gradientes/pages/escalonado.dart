import 'dart:math';

import 'package:flutter/material.dart';
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

    // if (tipoGradiente == null) {
    //   // Mostrar mensaje de error si no se ha seleccionado un tipo de gradiente
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text(
    //           'Error',
    //           style: GoogleFonts.saira(
    //             color: const Color(0xFF29E9FF),
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         content: Text(
    //           'Por favor seleccione un tipo de gradiente.',
    //           style: GoogleFonts.saira(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 16,
    //           ),
    //         ),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text(
    //               'OK',
    //               style: GoogleFonts.saira(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold,
    //                 color: const Color(0xFF29E9FF),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }

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
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 1),
              child: SizedBox(
                height: 125,
                width: 125,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Remix.nft_fill,
                      size: 135,
                      color: Color(0xFF29E9FF),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 30, left: 30),
              child: Text(
                "En gradientes se pueden hallar el Valor Presente (VP) o Valor Futuro (VF)\nDonde P ó VP es valor presente, F ó VF es valor futuro, i es tasa de interés y A es primer pago, G es gradiente y N número de periodos",
                style: GoogleFonts.saira(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10,),
            InputTextFormField(labelText: "Valor cuota", prefixIcon: Remix.coins_fill, valueText: '', controller: seriePagosController,),
            InputTextFormField(labelText: "Tasa de Interés por periodo", prefixIcon: Remix.discount_percent_fill, valueText: '', controller: tasaInteresController,),
            InputTextFormField(labelText: "Número periodos", prefixIcon: Remix.numbers_line, valueText: '', controller: nPeriodosController,),
            InputTextFormField(labelText: "Tasa efectiva anual", prefixIcon: Remix.percent_line, valueText: '', controller: tasaEfectivaController,),
            InputTextFormField(labelText: "Tasa incremento", prefixIcon: Remix.swap_line, valueText: '', controller: tasaIncrementoController,),
            InputTextFormField(labelText: "Plazo obligación", prefixIcon: Remix.calendar_todo_line, valueText: '', controller: plazoObligacionController,),
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
