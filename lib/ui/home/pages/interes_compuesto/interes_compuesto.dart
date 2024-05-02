import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Capital.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Monto_periodo.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Tasa_interes.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/Tiempo.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/pages/monto_final.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

// ignore: must_be_immutable
class InteresCompuestoPage extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  var height, width;

  InteresCompuestoPage({super.key});

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
                            text: "Es la acumulación de intereses que se generan en un período determinado de tiempo por un capital.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
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
                            text: "Valor presente o actual (VP): ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Es el valor actual del crédito y se llama también capital inicial.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
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
                            text: "Interés o tasa de interés (I): ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Es la tasa de interés que se cobrará o pagará dependiendo del caso.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
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
                            text: "Periodo (N): ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Es el tiempo o plazo durante el cual se pagará el crédito.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
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
                            text: "Valor futuro (VF): ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Es el valor total que se pagará al terminar el crédito y se llama también capital final.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
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
                            text: "Formula: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: "En realidad cuando buscamos el interés compuesto únicamente usamos la siguiente formula: ", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          TextSpan(
                            text: "VF = VP (1 + I).", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MontoFinal(),));
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
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const PeriodoPage(),));
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
                                    "Monto por Período",
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
                               Navigator.push(context, MaterialPageRoute(builder: (context) => const CapitalPage2(),));
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
