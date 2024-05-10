import 'dart:math';

import 'package:calculator_app/ui/widgets/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: SizedBox(
              height: 0,
              width: 0,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 30,
              left: 30,
              bottom: 12,
            ),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: " Las anualidades ",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            "son serie de pagos o depósitos iguales que se realizan o reciben a intervalos regulares durante un período específico de tiempo.\n\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "La Tasa de Interés (i) ",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Representa la tasa de interés aplicada a la anualidad, expresada como un porcentaje.\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                       TextSpan(
                        text: " El Número de Períodos (n)",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            " Indica la cantidad de períodos en los que se realizarán los pagos o depósitos.\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: " la Renta ",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Corresponde al pago o depósito que se realiza de manera regular en la anualidad.\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                       TextSpan(
                        text: "Monto de la Anualidad ",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            " Es el valor inicial de la anualidad, en caso de haberlo.\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Fórmulas:\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Valor Futuro (VF): Representa el valor acumulado de una anualidad en un momento futuro.\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Fórmula (Renta) y Formula (Monto):\n",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Math.tex(
                  r'VF=\frac{M}{\left[\frac{\left(1+i\right)^n-1}{i}\right]}',
                  textStyle: GoogleFonts.saira(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20,),
                Math.tex(
                  r'VF=R\left[\frac{\left(1+i\right)^n-1}{i}\right]',
                  textStyle: GoogleFonts.saira(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 10,),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "\nValor Presente (VP): Indica el valor actual de una anualidad, es decir, su valor en el presente.:",
                        style: GoogleFonts.saira(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 10,),
                Math.tex(
                  r'VP=R\left[\frac{1-\left(1+i\right)^{-n}}{i}\right]',
                  textStyle: GoogleFonts.saira(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
                  '  Valor Futuro  ',
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
          if (selectedOption == 'Valor Futuro') ...[
            InputTextFormField(
              labelText: "Monto de la Anualidad",
              prefixIcon: Remix.coins_fill,
              valueText: '',
              controller: montoController,
            ),
          ],
          InputTextFormField(
            labelText: "Renta",
            prefixIcon: Remix.coins_fill,
            valueText: '',
            controller: rentaController,
          ),

     Row(
  children: [
    Expanded(
      child: Stack(
        children: [
          InputTextFormField(
            labelText: "Número de Períodos(n)",
            prefixIcon: Remix.time_fill,
            valueText: '',
            controller: periodosController,
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (String value) {
                // Aquí puedes manejar la lógica cuando se selecciona una opción del menú
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Mensual',
                  child: Text('Mensual'),
                ),
                const PopupMenuItem<String>(
                  value: 'Trimestral',
                  child: Text('Trimestral'),
                ),
                const PopupMenuItem<String>(
                  value: 'Semestral',
                  child: Text('Semestral'),
                ),
                const PopupMenuItem<String>(
                  value: 'Anual',
                  child: Text('Anual'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ],
),

          InputTextFormField(
            labelText: "Tasa de Interés(i)",
            prefixIcon: Remix.discount_percent_fill,
            valueText: '',
            controller: tasaController,
          ),
          const SizedBox(height: 50),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 1000),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF171731),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
                          resultado =
                              calcularRenta(0, tasa, periodos, renta);
                          formula =
                              'VF = R / (((pow(1 + i, n) - 1) / i))';
                        } else {
                          monto = double.parse(montoController.text);
                          resultado =
                              calcularRenta(monto, tasa, periodos, renta);
                          formula =
                              'VF = R * (((pow(1 + i, n) - 1) / i))';
                        }
                      } else {
                        resultado = calcularValorPresente(renta, tasa, periodos);
                        formula = 'VA = R * ((1 - pow(1 + i, -n)) / i)';
                      }

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
