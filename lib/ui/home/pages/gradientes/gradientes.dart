import 'package:calculator_app/ui/home/pages/gradientes/pages/aritmetico.dart';
import 'package:calculator_app/ui/home/pages/gradientes/pages/geometrico.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/capital.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

// ignore: must_be_immutable
class GradientesPage extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  var height, width;

  GradientesPage({super.key});

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
                            text: "Gradientes o Series Variables", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: " consisten en una serie de pagos periodicos que aumentan o disminuyen en cada periodo," 
                                  " con relación al pago anterior, es decir es una forma de pago en el que las cuotas varían.", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ]
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "\nCondiciones", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: " para considerar una serie de pagos como gradiente, deben ser las siguentes:\n", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          TextSpan(
                            text: "\n- Deben tener una ley de conformación \n- Los pagos deben ser periodicos \n- Misma tasa de interés a todos los pagos"
                                  "\n- Número de periodos debe ser igual al número de pagos", style: GoogleFonts.saira(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
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
                      "Seleccione el tipo de gradiente a \nresolver",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AritmeticoPage(),));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Remix.percent_line,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Aritmético o Lineal",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const GeometricoPage(),));
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Remix.nft_fill,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Geométrico",
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
                                  Remix.funds_line,
                                  color: Color(0xFF29E9FF),
                                  size: 29,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    "Escalonado",
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