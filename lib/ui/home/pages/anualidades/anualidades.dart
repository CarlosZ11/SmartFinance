import 'dart:math';

import 'package:calculator_app/ui/widgets/custom_alert.dart';
import 'package:calculator_app/ui/widgets/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class AnualidadesPage extends StatefulWidget {
  const AnualidadesPage({super.key});

  @override
  _AnualidadesPageState createState() => _AnualidadesPageState();
}

class _AnualidadesPageState extends State<AnualidadesPage> {

  TextEditingController montoController = TextEditingController();
  TextEditingController tasaController = TextEditingController();
  TextEditingController periodosController = TextEditingController();

  void updateFormula() {
    setState(() {
      if (selectedOption == 'Valor Final') {
        formula = 'VF = A * (((1 + i)^N - 1) / i)';
      } else {
        formula = 'VA = A * ((1 - (1 + i)^-N) / i)';
      }
    });
  }

  double calcularValorFuturo(double A, double i, int n) {
    return A * (((pow(1 + i, n) - 1) / i));
  }

  double calcularValorPresente(double A, double i, int n) {
    return A * ((1 - pow(1 + i, -n)) / i);
  }

  double monto = 0;
  double tasa = 0;
  int periodos = 0;

  String selectedOption = 'Valor Futuro';
  String formula = '';
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: SizedBox(
                height: 125,
                width: 125,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                        Remix.exchange_dollar_line,
                        size: 135,
                        color: Color(0xFF29E9FF),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 30, left: 30, bottom: 12),
              child: Text(
                "Las anualidades son una serie de pagos o depósitos iguales que se realizan o reciben a intervalos regulares durante un período específico de tiempo. \n\nVF = El Monto final de la Anualidad\ni = Tasa de Interés\nn = Número de Períodos\nVA = Valor Actual",
                style: GoogleFonts.saira(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF9E75FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color(0xFF171731),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Valor Final';
                      updateFormula();
                    });
                  },
                  child: Text(
                    'Monto Final',
                    style: GoogleFonts.saira(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF9E75FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color(0xFF171731),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedOption = 'Valor Presente';
                      updateFormula();
                    });
                  },
                  child: Text(
                    'Valor Actual',
                    style: GoogleFonts.saira(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            InputTextFormField(labelText: "Monto de la Anualidad", prefixIcon: Remix.coins_fill, valueText: '', controller: montoController,),
            InputTextFormField(labelText: "Tasa de Interés", prefixIcon: Remix.discount_percent_fill, valueText: '', controller: tasaController,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
              child: TextFormField(
                controller: periodosController,
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
                  prefixIcon: const Icon(
                    Remix.time_fill,
                    color: Color(0xFF29E9FF),
                    size: 33,
                  ),
                  labelText: "Número de Períodos",
                  labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              height: 50,
              width: 400,
              margin: const EdgeInsets.symmetric(horizontal: 30,),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF9E75FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFF171731),
                ),
                onPressed: () {
                  setState(() {
                    try {
                      monto = double.parse(montoController.text);
                      tasa = double.parse(tasaController.text) / 100;
                      periodos = int.parse(periodosController.text);
    
                      if (selectedOption == 'Valor Final') {
                        resultado = calcularValorFuturo(monto, tasa, periodos);
                        formula = 'VF = $monto * (((1 + $tasa)^$periodos - 1) / $tasa)';
                      } else {
                        resultado = calcularValorPresente(monto, tasa, periodos);
                        formula = 'VA = $monto * ((1 - (1 + $tasa)^-$periodos) / $tasa)';
                      }
    
                      // Vaciar los campos después de calcular
                      montoController.clear();
                      tasaController.clear();
                      periodosController.clear();
    
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return AlertDialog(
                          //   title: Text(
                          //     'Resultado',
                          //     style: GoogleFonts.saira(
                          //       color: const Color(0xFF9E75FF),
                          //       fontWeight: FontWeight.bold
                          //     ),
                          //   ),
                          //   content: Text(
                          //     'Resultado: \$${resultado.toStringAsFixed(2)}',
                          //     style: GoogleFonts.saira(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 16
                          //     ),
                          //   ),
                          //   actions: [
                          //     TextButton(
                          //       onPressed: () {
                          //         Navigator.of(context).pop();
                                  
                          //       },
                          //       child: Text(
                          //         'OK',
                          //         style: GoogleFonts.saira(
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.bold
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // );
                          return CustomAlertDialog(title: 'Resultado', content: 'Resultado: \$${resultado.toStringAsFixed(2)}', capitalController: montoController, tasaInteresController: tasaController,);
                        },
                      );
    
                    } catch (e) {
                      // Manejar errores al parsear los campos
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(title: '¡Alerta!', content: 'No pueden quedar campos vacíos',);
                        },
                      );
                    }
                  });
                },
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
    );
  }
}
