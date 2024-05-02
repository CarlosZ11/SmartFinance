import 'dart:math';

import 'package:calculator_app/ui/widgets/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class AnualidadesPage extends StatefulWidget {
  const AnualidadesPage({Key? key});

  @override
  _AnualidadesPageState createState() => _AnualidadesPageState();
}

class _AnualidadesPageState extends State<AnualidadesPage> {
  TextEditingController montoController = TextEditingController();
  TextEditingController tasaController = TextEditingController();
  TextEditingController periodosController = TextEditingController();
  TextEditingController rentaController = TextEditingController();

  double monto = 0;
  double tasa = 0;
  int periodos = 0;
  double renta = 0;

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
            padding: const EdgeInsets.only(
              top: 25,
              right: 30,
              left: 30,
              bottom: 12,
            ),
            child: Text(
              "Las anualidades son una serie de pagos o depósitos iguales que se realizan o reciben a intervalos regulares durante un período específico de tiempo. \n\n\ni = Tasa de la anualidad\nn = Número de periodos de capitalización o de pago de la anualidad.\nValor presente= Valor de la anualidad.\nValor final = El Monto final de la Anualidad\n​Renta: pago o depósito que se realiza de manera regular",
              style: GoogleFonts.saira(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF171731),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedOption = 'Valor Futuro';
                    updateFormula();
                  });
                },
                child: Text(
                  ' Valor Futuro ',
                  style: GoogleFonts.saira(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF171731),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedOption = 'Valor Presente';
                    updateFormula();
                  });
                },
                child: Text(
                  'Valor Presente',
                  style: GoogleFonts.saira(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InputTextFormField(
            labelText: "Tasa de Interés(i)",
            prefixIcon: Remix.discount_percent_fill,
            valueText: '',
            controller: tasaController,
          ),
          InputTextFormField(
            labelText: "Número de Períodos(n)",
            prefixIcon: Remix.time_fill,
            valueText: '',
            controller: periodosController,
          ),
          InputTextFormField(
            labelText: "Renta",
            prefixIcon: Remix.coins_fill,
            valueText: '',
            controller: rentaController,
          ),
          if (selectedOption == 'Valor Futuro') ...[
            InputTextFormField(
              labelText: "Monto de la Anualidad",
              prefixIcon: Remix.coins_fill,
              valueText: '',
              controller: montoController,
            ),
          ],
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color(0xFF171731),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                setState(() {
                  try {
                    tasa = double.parse(tasaController.text) / 100;
                    periodos = int.parse(periodosController.text);
                    renta = rentaController.text.isEmpty
                        ? 0
                        : double.parse(rentaController.text);

                    if (selectedOption == 'Valor Futuro') {
                      if (montoController.text.isEmpty) {
                        resultado = calcularRenta(0, tasa, periodos, renta);
                        formula =
                            'VF = R / (((pow(1 + i, n) - 1) / i))';
                      } else {
                        monto = double.parse(montoController.text);
                        resultado = calcularRenta(monto, tasa, periodos, renta);
                        formula =
                            'VF = R * (((pow(1 + i, n) - 1) / i))';
                      }
                    } else {
                      resultado =
                          calcularValorPresente(renta, tasa, periodos);
                      formula =
                          'VA = R * ((1 - pow(1 + i, -n)) / i)';
                    }

                    // Vaciar los campos después de calcular
                    tasaController.clear();
                    periodosController.clear();
                    rentaController.clear();
                    if (selectedOption == 'Valor Futuro') {
                      montoController.clear();
                    }

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
                          content: Text(
                            'Resultado: \$${resultado.toStringAsFixed(2)}',
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
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } catch (e) {
                    // Manejar errores al parsear los campos
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              'Por favor, ingrese valores válidos en todos los campos.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateFormula() {
    setState(() {
      if (selectedOption == 'Valor Futuro') {
        formula = 'VF = R / (((pow(1 + i, n) - 1) / i))';
      } else {
        formula = 'VA = R * ((1 - pow(1 + i, -n)) / i)';
      }
    });
  }

  double calcularRenta(double monto, double i, int n, double renta) {
    if (monto == 0) {
      return renta * (((pow(1 + i, n) - 1) / i));
    } else {
      return monto / (((pow(1 + i, n) - 1) / i));
    }
  }

  double calcularValorFuturo(double A, double i, int n) {
    if (A == 0) {
      return A / (((pow(1 + i, n) - 1) / i));
    } else {
      return monto * (((pow(1 + i, n) - 1) / i));
    }
  }

  double calcularValorPresente(double R, double i, int n) {
    return R * ((1 - pow(1 + i, -n)) / i);
  }
}
