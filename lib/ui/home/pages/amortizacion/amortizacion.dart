// ignore_for_file: must_be_immutable
import 'package:calculator_app/ui/home/pages/amortizacion/pages/capitalizacion_compuesta.dart';
import 'package:calculator_app/ui/home/pages/amortizacion/pages/capitalizacion_simple.dart';
import 'package:calculator_app/ui/home/pages/amortizacion/pages/sistema_americano.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Capital.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Monto_periodo.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Tasa_interes.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Tiempo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class AmortizacionPage extends StatelessWidget {

  AmortizacionPage({super.key});
   // ignore: prefer_typing_uninitialized_variables
   var height, width;

  @override
   Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                height: height * 0.45,
                width: width,
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Es una forma de reconocer el costo de un activo a lo largo del tiempo, en lugar de hacerlo en un solo período.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 12,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Capitalización: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "implica el crecimiento de una inversión o un activo através del tiempo debido a la acumulación de intereses o rendimientoscompuestos. ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 12,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: " Capitalización Simple: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Calcula los intereses únicamente sobre el capital original, sin tener en cuenta los intereses acumulados en períodos anteriores.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 12,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Capitalización Compuesta: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Calcula intereses sobre el capital inicial más los intereses acumulados.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 12,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sistema Americano: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Son Cuotas periódicas que cubren solo los intereses, mientras que el capital se paga en su totalidad al final del plazo del préstamo.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 6,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sistema Francés: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Calcula cuotas periódicas que incluyen tanto intereses como amortización del capital. ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 6,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sistema alemán: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: " Son cuotas periódicas que son fijas, pero a medida que se amortiza el capital, los intereses disminuyen.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    )
                  ],
                )
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)
                  )
                ),
                height: height * 0.55,
                width: width,
                child: Column(
                  children: [
                    Text(
                      "Seleccione la incógnita que desea \nencontrar",
                      style: GoogleFonts.saira(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: const Color(0xFF171731)
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      child: Column(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF171731), padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0xFFF5F6F9),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CapitalizacionSimple(),));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Remix.money_dollar_circle_fill,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Capitalización Simple",
                                    style: GoogleFonts.saira(
                                      fontSize: 16,
                                      color: const Color(0xFF171731),
                                      fontWeight: FontWeight.w500
                                    ),
                          
                                  )
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          const SizedBox(height: 17,),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF171731), padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0xFFF5F6F9),
                            ),
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const CapitalizacionCompuesta(),));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Remix.exchange_funds_line,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Capitalización Compuesta",
                                    style: GoogleFonts.saira(
                                      fontSize: 16,
                                      color: const Color(0xFF171731),
                                      fontWeight: FontWeight.w500
                                    ),
                          
                                  )
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          const SizedBox(height: 17,),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF171731), padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0xFFF5F6F9),
                            ),
                            onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => const SistemaAmericano(),));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Remix.coins_fill,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Sistema Americano",
                                    style: GoogleFonts.saira(
                                      fontSize: 16,
                                      color: const Color(0xFF171731),
                                      fontWeight: FontWeight.w500
                                    ),
                          
                                  )
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          const SizedBox(height: 17,),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF171731), padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0xFFF5F6F9),
                            ),
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const TasaInteresPage2(),));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Remix.discount_percent_fill,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Sistema Francés",
                                    style: GoogleFonts.saira(
                                      fontSize: 16,
                                      color: const Color(0xFF171731),
                                      fontWeight: FontWeight.w500
                                    ),
                          
                                  )
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          const SizedBox(height: 17,),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF171731), padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0xFFF5F6F9),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const TiempoPage2(),));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Remix.time_fill,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Sistema Alemán",
                                    style: GoogleFonts.saira(
                                      fontSize: 16,
                                      color: const Color(0xFF171731),
                                      fontWeight: FontWeight.w500
                                    ),
                          
                                  )
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
