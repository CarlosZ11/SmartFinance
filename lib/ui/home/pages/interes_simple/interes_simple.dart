
import 'package:calculator_app/ui/home/pages/interes_simple/pages/capital.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/interes.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/monto.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/tasa_interes.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/tiempo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';


// ignore: must_be_immutable
class InteresSimplePage extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  var height, width;

  InteresSimplePage({super.key});

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
                height: height * 0.39,
                width: width,
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "El interés", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: " es el costo que se paga por el uso del dinero ajeno en un tiempo t, y puede expresarse en unidades monetarias I" 
                                  " (pesos, dólares, euros, etc.) o en porcentaje (%), también llamada", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          TextSpan(
                            text: " tasa interés i.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "\nEl interés simple", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: ", es el que se cobra sobre el principal,", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          TextSpan(
                            text: " capital C", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: " o Valor Presente (VP) por un tiempo t, expresado en años, así tenemos:", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          TextSpan(
                            text: "\nInterés simple I = Cit ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "\nEl", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          TextSpan(
                            text: " monto M", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: " al final del periodo o Valor Futuro (VF) se obtiene entonces con la formula:", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          TextSpan(
                            text: " M = C (1 + it) o \nVF = VP (1 + it).", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
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
                height: height * 0.57,
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MontoPage(),));
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
                                    "Monto (M) o Valor Futuro (VF)",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const InteresPage(),));
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
                                    "Interés",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CapitalPage(),));
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
                                    "Capital",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const TasaInteresPage(),));
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
                                    "Tasa de Interés",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const TiempoPage(),));
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
                                    "Tiempo",
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
