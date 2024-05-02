import 'dart:math';

import 'package:calculator_app/ui/widgets/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class GeometricoCalculator {
  static Map<String, double> calcularCreciente(double seriePagos, double tasaInteres, double variacion, int nPeriodos) {
    double valorPresente = (seriePagos * ((pow((1 - variacion), nPeriodos) * pow((1 + tasaInteres), -nPeriodos) - 1)) / (variacion - tasaInteres));
    double valorFuturo = (seriePagos * ((pow((1 + variacion), nPeriodos) - pow((1 + tasaInteres), nPeriodos))) / (variacion - tasaInteres));
    return {'valorPresente': valorPresente, 'valorFuturo': valorFuturo};
  }

  static Map<String, double> calcularDecreciente(double seriePagos, double tasaInteres, double variacion, int nPeriodos) {
    double valorPresente = (seriePagos * (1 - (pow((1 - variacion), nPeriodos) * pow((1 + tasaInteres), -nPeriodos)))) / (variacion + tasaInteres);
    double valorFuturo = (seriePagos * ((pow((1 + tasaInteres), nPeriodos) - pow((1 - variacion), nPeriodos))) / (variacion + tasaInteres));
    return {'valorPresente': valorPresente, 'valorFuturo': valorFuturo};
  }
}

class GeometricoPage extends StatefulWidget {
  const GeometricoPage({super.key});

  @override
  State<GeometricoPage> createState() => _GeometricoPageState();
}

class _GeometricoPageState extends State<GeometricoPage> {

  TextEditingController seriePagosController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();
  TextEditingController variacionController = TextEditingController();
  TextEditingController nPeriodosController = TextEditingController();
  String? tipoGradiente; // Creciente, decreciente
  double? valorPresente;
  double? valorFuturo;

  void calcularResultado() {
    double seriePagos = double.tryParse(seriePagosController.text) ?? 0;
    double tasaInteres = double.tryParse(tasaInteresController.text) ?? 0;
    double variacion = double.tryParse(variacionController.text) ?? 0;
    int nPeriodos = int.tryParse(nPeriodosController.text) ?? 0;

    if (tipoGradiente == null) {
      // Mostrar mensaje de error si no se ha seleccionado un tipo de gradiente
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Error',
              style: GoogleFonts.saira(
                color: const Color(0xFF29E9FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Por favor seleccione un tipo de gradiente.',
              style: GoogleFonts.saira(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
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
      return;
    }

    // Calcular el valor presente y el valor futuro según el tipo de gradiente seleccionado
    switch (tipoGradiente) {
      case 'Creciente':
        final resultCreciente = GeometricoCalculator.calcularCreciente(seriePagos, tasaInteres/100, variacion, nPeriodos);
        valorPresente = resultCreciente['valorPresente'];
        valorFuturo = resultCreciente['valorFuturo'];
        break;
      case 'Decreciente':
        final resultDecreciente = GeometricoCalculator.calcularDecreciente(seriePagos, tasaInteres/100, variacion, nPeriodos);
        valorPresente = resultDecreciente['valorPresente'];
        valorFuturo = resultDecreciente['valorFuturo'];
        break;
      default:
        // Esto no debería ocurrir, pero por si acaso
        valorPresente = 0;
        valorFuturo = 0;
        break;
    }

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
              Text(
                'Valor Futuro (VF): \$${valorFuturo?.toStringAsFixed(2)}',
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
          "GEOMÉTRICO",
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
            const SizedBox(height: 20,),
            Container(
              height: 60,
              width: 400,
              margin: const EdgeInsets.symmetric(horizontal: 30,),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Tipo de Gradiente',
                  prefixIcon: const Icon(
                    Remix.line_chart_fill,
                    color: Color(0xFF29E9FF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF29E9FF))
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black), // Color del borde cuando no está seleccionado
                  ),
                  labelStyle: GoogleFonts.saira(
                    fontSize: 15,
                    color: Colors.black
                  )
                ),
                style: GoogleFonts.saira(
                  fontSize: 15,
                  color: Colors.black
                ),
                value: tipoGradiente,
                onChanged: (String? newValue) {
                  setState(() {
                    tipoGradiente = newValue;
                  });
                },
                items: ['Creciente', 'Decreciente'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10,),
            InputTextFormField(labelText: "Valor cuota", prefixIcon: Remix.coins_fill, valueText: '', controller: seriePagosController,),
            InputTextFormField(labelText: "Tasa de Interés", prefixIcon: Remix.discount_percent_fill, valueText: '', controller: tasaInteresController,),
            InputTextFormField(labelText: "Variación", prefixIcon: Remix.line_chart_fill, valueText: '', controller: variacionController,),
            InputTextFormField(labelText: "Número periodos", prefixIcon: Remix.numbers_line, valueText: '', controller: nPeriodosController,),
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