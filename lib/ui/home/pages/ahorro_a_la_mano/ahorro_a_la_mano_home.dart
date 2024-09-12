import 'package:calculator_app/models/user.dart';
import 'package:calculator_app/ui/home/pages/ahorro_a_la_mano/pages/retiro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class AmountSelectionAhorroPage extends StatefulWidget {
  final Usuario usuarioActual;

  const AmountSelectionAhorroPage({super.key, required this.usuarioActual});

  @override
  _AmountSelectionAhorroPageState createState() => _AmountSelectionAhorroPageState();
}

class _AmountSelectionAhorroPageState extends State<AmountSelectionAhorroPage> {
  final TextEditingController _customAmountController = TextEditingController();
  final List<int> _predefinedAmounts = [10000, 20000, 50000, 100000];

  void _navigateToAhorroPage(int amount, Usuario usuarioActual) {
    if (amount > 9999 && amount % 10000 == 0 && amount <= 1800000) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AhorroPage(monto: amount, usuarioActual: usuarioActual),
        ),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('El monto debe ser mayor a 9999, ser un múltiplo de 10.000 y menor a 1.800.000.'),
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
        title: Text('Seleccionar Monto'),
        titleTextStyle: GoogleFonts.saira(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ..._predefinedAmounts.map((amount) => ListTile(
                  title: Text(
                    '\$${amount}',
                    style: GoogleFonts.saira(
                      fontSize: 17,
                      color: Colors.black
                    ),
                  ),
                  onTap: () => _navigateToAhorroPage(amount, widget.usuarioActual),
                )),
            const SizedBox(height: 20),
            TextFormField(
              controller: _customAmountController,
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
                  Remix.money_dollar_circle_fill,
                  color: Color(0xFF171731),
                  size: 30,
                ),
                labelText: "Monto Personalizado",
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
                  final customAmount = int.tryParse(_customAmountController.text) ?? 0;
                  _navigateToAhorroPage(customAmount, widget.usuarioActual);
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
    );
  }
}
