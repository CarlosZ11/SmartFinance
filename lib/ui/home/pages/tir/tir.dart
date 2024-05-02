import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TirPage extends StatefulWidget {
  const TirPage({Key? key}) : super(key: key);

  @override
  _TirPageState createState() => _TirPageState();
}

class _TirPageState extends State<TirPage> {
  TextEditingController controllerInversion = TextEditingController();
  List<TextEditingController> controllersFlujosDeCaja = [TextEditingController()];

  double tir = 0.0;
  String mensajeError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "La Tasa Interna de Retorno (TIR) es una medida financiera utilizada para evaluar la rentabilidad de una inversión. Representa la tasa de rendimiento esperada de un proyecto o inversión.\n\n"
                "Inversión: es el monto de dinero que se coloca en un proyecto o negocio al comienzo del mismo.\n\n"
                "Flujo de caja: es un movimiento de dinero que ingresa o sale, en este caso ingresan de una empresa durante un período de tiempo específico.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.saira(fontSize: 15,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: controllerInversion,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Inversión',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.monetization_on, color: Color(0xFF29E9FF)),
                ),
                style: GoogleFonts.saira(fontSize: 15, color: Color(0xFF171731)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un valor';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor ingresa un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Flujos de Caja',
                style: GoogleFonts.saira(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Column(
                children: _crearCamposFlujosDeCaja(),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF171731),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  if (_validarEntradas()) {
                    calcularTIR();
                  } else {
                    setState(() {
                      mensajeError = 'Se ingresaron valores incorrectos';
                      tir = 0.0;
                    });
                    mostrarAlertaError();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Calcular Resultados',
                    style: GoogleFonts.saira(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _crearCamposFlujosDeCaja() {
    List<Widget> campos = [];
    for (int i = 0; i < controllersFlujosDeCaja.length; i++) {
      campos.add(
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controllersFlujosDeCaja[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Flujo ${i + 1}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.monetization_on, color: Color(0xFF29E9FF)),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            controllersFlujosDeCaja.removeAt(i);
                          });
                        },
                      ),
                    ),
                    style: GoogleFonts.saira(fontSize: 15, color: Color(0xFF171731)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un valor';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingresa un número válido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      );
    }
    campos.add(
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                controllersFlujosDeCaja.add(TextEditingController());
              });
            },
          ),
        ],
      ),
    );
    return campos;
  }

  bool _validarEntradas() {
    if (controllerInversion.text.isEmpty || controllersFlujosDeCaja.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
      return false;
    }
    return true;
  }

  void calcularTIR() {
    double inversion = double.parse(controllerInversion.text);
    List<double> flujosDeCaja = controllersFlujosDeCaja.map((controller) => double.parse(controller.text)).toList();
    flujosDeCaja.insert(0, -inversion);
    tir = tasaInternaDeRetorno(flujosDeCaja);
    setState(() {
      mensajeError = '';
    });
    mostrarAlertaResultado();
  }

  double tasaInternaDeRetorno(List<double> flujosDeCaja) {
    double tasaMin = -1.0;
    double tasaMax = 1.0;
    double tasaAprox = (tasaMin + tasaMax) / 2.0;
    double vpn;

    while (tasaMax - tasaMin > 0.0001) {
      vpn = 0.0;
      for (int i = 0; i < flujosDeCaja.length; i++) {
        vpn += flujosDeCaja[i] / pow(1 + tasaAprox, i);
      }

      if (vpn > 0) {
        tasaMin = tasaAprox;
      } else {
        tasaMax = tasaAprox;
      }
      tasaAprox = (tasaMin + tasaMax) / 2.0;
    }

    return tasaAprox * 100.0;
  }

  void mostrarAlertaResultado() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Resultado TIR',
            style: GoogleFonts.saira(
              color: const Color(0xFF29E9FF),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '${tir.toStringAsFixed(2)}%',
            style: GoogleFonts.saira(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                limpiarCampos();
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
  }

  void mostrarAlertaError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Error',
            style: GoogleFonts.saira(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            mensajeError,
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
  }

  void limpiarCampos() {
    setState(() {
      controllerInversion.clear();
      controllersFlujosDeCaja.clear();
      controllersFlujosDeCaja.add(TextEditingController());
    });
  }
}
