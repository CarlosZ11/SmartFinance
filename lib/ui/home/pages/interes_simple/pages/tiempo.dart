import 'package:calculator_app/ui/widgets/custom_alert.dart';
import 'package:calculator_app/ui/widgets/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class TiempoCalculator {
  static double calcularTime(double interes, double tasaInteres, double capital) {
    // final tiempoEnAnios = calcularTiempo(valorTiempo, unidadTiempo);
    return interes / (capital * tasaInteres);
  }
}

class TiempoPage extends StatefulWidget {
  const TiempoPage({super.key});

  @override
  State<TiempoPage> createState() => _TiempoPageState();
}

class _TiempoPageState extends State<TiempoPage> {

  TextEditingController interesController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();
  TextEditingController capitalController = TextEditingController();

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
                  "Para hallar el Tiempo se utiliza la siguiente formula t = I / (Ci)\nDonde t es tiempo, I es intereses, C es capital e i es tasa de interés",
                  style: GoogleFonts.saira(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30,),
              InputTextFormField(labelText: "Interés", prefixIcon: Remix.exchange_funds_line, valueText: '', controller: interesController,),
              InputTextFormField(labelText: "Capital", prefixIcon: Remix.coins_fill, valueText: '', controller: capitalController,),
              InputTextFormField(labelText: "Tasa de Interés", prefixIcon: Remix.discount_percent_fill, valueText: '', controller: tasaInteresController,),
              
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
                    if(interesController.text.isEmpty || tasaInteresController.text.isEmpty || capitalController.text.isEmpty){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(title: '¡Alerta!', content: 'No pueden quedar campos vacíos',);
                        },
                      );
                      return;
                    }

                    double interes = double.parse(interesController.text);
                    double tasaInteres = double.parse(tasaInteresController.text)/100;
                    double capital = double.parse(capitalController.text);

    
                      double tiempo = TiempoCalculator.calcularTime(interes, tasaInteres, capital);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(title: 'Resultado', content: 'Tiempo: ${tiempo.toStringAsFixed(2)} años', capitalController: capitalController, tasaInteresController: tasaInteresController, tiempoController: interesController,);
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