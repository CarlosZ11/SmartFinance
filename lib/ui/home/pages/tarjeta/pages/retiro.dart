import 'dart:async';
import 'dart:math';

import 'package:calculator_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class TarjetaPage extends StatefulWidget {
  final int monto;
  final Usuario usuarioActual;

  const TarjetaPage({super.key, required this.monto, required this.usuarioActual});

  @override
  _TarjetaPageState createState() => _TarjetaPageState();
}

class _TarjetaPageState extends State<TarjetaPage> {
  final TextEditingController _codigoController = TextEditingController();
  String? codigo;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _generateDynamicCode();
  }

  void _generateDynamicCode() {
    setState(() {
      codigo = widget.usuarioActual.clave;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _retirar() {
    final inputCode = _codigoController.text;
    if (inputCode == codigo) {
      Cajero cajero = Cajero();
      final monto = widget.monto;

      cajero.retirar(monto);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Comprobante',
            style: GoogleFonts.saira(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Banco: SmartFinance',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              Text(
                'Usuario: ${widget.usuarioActual.nombre}',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              Text(
                'Celular: ${widget.usuarioActual.numeroTelefono}',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              Text(
                'Tarjeta: ${widget.usuarioActual.numeroTarjeta}',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Tipo de Transacción: Retiro Tarjeta',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              Text(
                'Monto: $monto',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              Text(
                'Código: $codigo',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              Text(
                '\nBilletes entregados',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...cajero.obtenerResultado(),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    } else {
      _showErrorDialog('Código Incorrecto');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171731),
        title: const Text('RETIRO CON AHORRO A LA MANO'),
        titleTextStyle: GoogleFonts.saira(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Nombre: ${widget.usuarioActual.nombre}',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Teléfono: ${widget.usuarioActual.numeroTelefono}',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Tarjeta: ${widget.usuarioActual.numeroTarjeta}',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Monto: \$${widget.monto}',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Código: $codigo',
                style: GoogleFonts.saira(
                  fontSize: 17,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _codigoController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.saira(fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF171731)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF171731)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(
                    Remix.hashtag,
                    color: Color(0xFF171731),
                    size: 30,
                  ),
                  labelText: "Código",
                  labelStyle: GoogleFonts.saira(color: const Color(0xFF171731)),
                ),
              ),
              const SizedBox(height: 20),
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
                    _retirar();
                  },
                  child: Text(
                    'Retirar',
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
      ),
    );
  }
}

class Cajero {
  List<int> billetes = [10000, 20000, 50000, 100000];
  List<int> contadoresBilletes = [0, 0, 0, 0];
  int contador = 0;
  int cantidad = 0;

  void retirar(int retirarMonto) {
    contadoresBilletes = [0, 0, 0, 0];
    cantidad = 0;
    contador = 0;

    while (cantidad < retirarMonto) {
      for (int i = contador; i < billetes.length; i++) {
        if (cantidad + billetes[i] <= retirarMonto) {
          cantidad += billetes[i];
          contadoresBilletes[i]++;
          if (cantidad == retirarMonto) {
            break;
          }
        }
      }
      contador++;
      if (contador >= billetes.length) {
        contador = 0;
      }
    }
  }

  List<Text> obtenerResultado() {
    List<Text> resultados = [];
    for (int i = 0; i < billetes.length; i++) {
      if (contadoresBilletes[i] > 0) {
        resultados.add(
          Text(
            "\$${billetes[i]}: ${contadoresBilletes[i]}",
            style: GoogleFonts.saira(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        );
      }
    }
    return resultados;
  }
}
