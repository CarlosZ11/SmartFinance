import 'dart:math';

import 'package:calculator_app/ui/widgets/custom_alert.dart';
import 'package:calculator_app/ui/widgets/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class TiempoCalculator {
  static double calcularTime(double interes, double montofinal, double capital) {
    // final tiempoEnAnios = calcularTiempo(valorTiempo, unidadTiempo);
    return log( montofinal / capital ) / log( 1 + interes);
  }
}

class TiempoPage2 extends StatefulWidget {
  const TiempoPage2({super.key});

  @override
  State<TiempoPage2> createState() => _TiempoPageState();
}

class _TiempoPageState extends State<TiempoPage2> {

  TextEditingController interesController = TextEditingController();
  TextEditingController valorfinalController = TextEditingController();
  TextEditingController capitalController = TextEditingController();
  bool tasaInteresMensual = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171731),
        title: Text(
          "SmartFinance",
          style: GoogleFonts.saira(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        titleSpacing: 73,
        iconTheme: const IconThemeData(color: Color(0xFF29E9FF)),
      ),
      body: SingleChildScrollView(
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
                          Remix.time_fill,
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
                  "Para hallar el Tiempo se utiliza la siguiente formula: Tiempo (N) = log(VF / C) / log(1 + i)\nDonde VF Valor futuro o Monto final, C es capital e i es tasa de interés",
                  style: GoogleFonts.saira(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30,),
              InputTextFormField(labelText: "Interés", prefixIcon: Remix.exchange_funds_line, valueText: '', controller: interesController,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tasa de Interés Mensual',
                        style: GoogleFonts.saira(
                          fontSize: 15
                        ),
                      ),
                      Radio(
                        value: true,
                        groupValue: tasaInteresMensual,
                        onChanged: (value) {
                          setState(() {
                            tasaInteresMensual = value as bool;
                          });
                        },
                      ),
                      
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tasa de Interés Anual',
                        style: GoogleFonts.saira(
                          fontSize: 15
                        ),
                      ),
                      Radio(
                        value: false,
                        groupValue: tasaInteresMensual,
                        onChanged: (value) {
                          setState(() {
                            tasaInteresMensual = value as bool;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              InputTextFormField(labelText: "Capital", prefixIcon: Remix.coins_fill, valueText: '', controller: capitalController,),
              InputTextFormField(labelText: "Monto Final", prefixIcon: Remix.discount_percent_fill, valueText: '', controller:valorfinalController,),
              
              const SizedBox(height: 50,),
              Container(
                height: 50,
                width: 400,
                margin: const EdgeInsets.symmetric(horizontal: 30,),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF29E9FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color(0xFF171731),
                  ),
                  onPressed: () {
                    if(interesController.text.isEmpty || valorfinalController.text.isEmpty || capitalController.text.isEmpty){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(title: '¡Alerta!', content: 'No pueden quedar campos vacíos',);
                        },
                      );
                      return;
                    }

                    double interes = double.parse(interesController.text)/100;
                    double montofinal = double.parse(valorfinalController.text);
                    double capital = double.parse(capitalController.text);
                
                      double tiempo = TiempoCalculator.calcularTime(interes, montofinal, capital);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(title: 'Resultado', content: 'Tiempo: ${tiempo.toStringAsFixed(2)} ${tasaInteresMensual ? "meses" : "años"}', capitalController: capitalController, tasaInteresController:valorfinalController, tiempoController: interesController,);
                        },
                      );

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
      ),
    );
  }
}

