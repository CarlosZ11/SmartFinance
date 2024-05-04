import 'package:calculator_app/ui/widgets/custom_alert.dart';
import 'package:calculator_app/ui/widgets/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';


class AmericanoCalculator {
  static double calcularTiempo(double valor, String unidadTiempo) {
    switch (unidadTiempo.toLowerCase()) {
      
      case 'años':
        return valor;
      case 'meses':
        return valor;
      case 'días':
        return valor / 365;
      case 'semanas':
        return valor / 52.1775; // Asumiendo 52.1775 semanas en un año
      case 'compuesto':
        return valor;
      case 'dos fechas':
        return valor/365;
      default:
        return 0.0;
    }
  }
  static Map<String, double> calcularSistemaAmericano(double principal, double tasaInteres, double valorTiempo, String unidadTiempo) {
    final tiempo = calcularTiempo(valorTiempo, unidadTiempo);
    final totalDevolver = principal * (1 + tasaInteres * tiempo);
    final interes = totalDevolver - principal;

    return {'totalDevolver': totalDevolver, 'interes': interes};
  }
}
  


class SistemaAmericano extends StatefulWidget {
  const SistemaAmericano({super.key});

  @override
  State<SistemaAmericano> createState() => _SistemaAmericanoState();
}

class _SistemaAmericanoState extends State<SistemaAmericano> {

  TextEditingController capitalController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();
  TextEditingController valorTiempoController = TextEditingController();
  TextEditingController aniosController = TextEditingController();
  TextEditingController mesesController = TextEditingController();
  TextEditingController diasController = TextEditingController();
  DateTimeRange selectedDates = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  String unidadTiempo = 'Días';
  bool tiempoCompuesto = false;
  bool tiempoDosFechas = false;

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
                          Remix.coins_fill,
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
                  "Para hallar el Sistema americano se utiliza la siguientes formulas: Pago anual = C * (1 + i * N)  \nDonde C es capital, i es tasa de interés, N es tiempo y Pago anual corresponde a la cantidad que debe",
                  style: GoogleFonts.saira(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30,),
              InputTextFormField(labelText: "Capital", prefixIcon: Remix.exchange_funds_line, valueText: '', controller: capitalController,),
              InputTextFormField(labelText: "Tasa de interes", prefixIcon: Remix.discount_percent_fill, valueText: '', controller: tasaInteresController,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
                child: Row(
                  children: [
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: valorTiempoController,
                        keyboardType: TextInputType.number,
                        enabled: !tiempoCompuesto && !tiempoDosFechas,
                        style: GoogleFonts.saira(fontSize: 15),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF171731)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF29E9FF)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: const Icon(
                            Remix.calendar_todo_fill,
                            color:  Color(0xFF29E9FF),
                            size: 20,
                          ),
                          labelText: "Tiempo",
                          labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextFormField(
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
                          prefixIcon: PopupMenuButton<String>(
                            shadowColor: const Color(0xFF171731),
                            color: const Color(0xFF171731),
                            initialValue: unidadTiempo,
                            onSelected: (String newValue) {
                              setState(() {
                                unidadTiempo = newValue.toLowerCase();
                                tiempoCompuesto = newValue == 'compuesto';
                                tiempoDosFechas = newValue == 'dos fechas';
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return ['Días', 'Semanas', 'Meses', 'Años', 'Compuesto', 'Dos Fechas'].map((String value) {
                                return PopupMenuItem<String>(
                                  value: value.toLowerCase(),
                                  child: Text(
                                    value,
                                    style: GoogleFonts.saira(
                                      color: Colors.white
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (tiempoCompuesto)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: aniosController,
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
                          prefixIcon: const Icon(
                            Remix.calendar_todo_fill,
                            color:  Color(0xFF29E9FF),
                            size: 20,
                          ),
                          labelText: "Años",
                          labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextFormField(
                        controller: mesesController,
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
                          prefixIcon: const Icon(
                            Remix.calendar_2_fill,
                            color:  Color(0xFF29E9FF),
                            size: 20,
                          ),
                          labelText: "Meses",
                          labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextFormField(
                        controller: diasController,
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
                          prefixIcon: const Icon(
                            Remix.q24_hours_fill,
                            color:  Color(0xFF29E9FF),
                            size: 20,
                          ),
                          labelText: "Días",
                          labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              if(tiempoDosFechas)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF171731), 
                    )
                  ),
                  height: 54,
                  width: 49,
                  margin: const EdgeInsets.symmetric(horizontal: 28,),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF29E9FF), shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      final DateTimeRange? dateTimeRange = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(1999),
                        lastDate: DateTime(3000),
                      );
                      if (dateTimeRange != null) {
                        setState(() {
                          selectedDates = dateTimeRange;
                        });
                      }
                    },
                    child: const Icon(
                      Remix.calendar_todo_fill
                    )
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
                    foregroundColor: const Color(0xFF29E9FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color(0xFF171731),
                  ),
                  onPressed: () {
                    if(capitalController.text.isEmpty || tasaInteresController.text.isEmpty){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(title: '¡Alerta!', content: 'No pueden quedar campos vacíos',);
                        },
                      );
                      return;
                    }

                    if(!tiempoCompuesto && valorTiempoController.text.isEmpty && !tiempoDosFechas){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(title: '¡Alerta!', content: 'No pueden quedar campos vacíos',);
                        },
                      );
                      return;
                    }

                    double capital= double.parse(capitalController.text);
                    double tasaInteres = double.parse(tasaInteresController.text)/100;
                    double valorTiempo;

                    if(tiempoCompuesto){
                      double anios = double.parse(aniosController.text.isEmpty ? '0' : aniosController.text);
                      double meses = double.parse(mesesController.text.isEmpty ? '0' : mesesController.text);
                      double dias = double.parse(diasController.text.isEmpty ? '0' : diasController.text);
                      valorTiempo = anios + (meses / 12) + (dias / 360);
                    }else if(tiempoDosFechas){
                      valorTiempo = double.parse(selectedDates.duration.inDays.toString());
                    }else{
                      valorTiempo = double.parse(valorTiempoController.text);
                    }
    
                      final resultado = AmericanoCalculator.calcularSistemaAmericano(capital, tasaInteres, valorTiempo, unidadTiempo);
                      
                      showDialog(context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: 'Resultado',
                          content: 'Total a Devolver: \$${resultado['totalDevolver']?.toStringAsFixed(2)}\nInterés: \$${resultado['interes']?.toStringAsFixed(2)}',
                          capitalController: capitalController,
                          tasaInteresController: tasaInteresController,
                        );
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

