import 'package:calculator_app/ui/home/pages/amortizacion/amortizacion.dart';
import 'package:calculator_app/ui/home/pages/gradientes/gradientes.dart';
import 'package:calculator_app/ui/home/pages/interes_compuesto/interes_compuesto.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/interes_simple.dart';
import 'package:calculator_app/ui/home/pages/anualidades/anualidades.dart';
import 'package:calculator_app/ui/home/pages/my_drawer_header.dart';
import 'package:calculator_app/ui/widgets/home_page.dart';
import 'package:calculator_app/ui/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.homeApp;
  bool isLoading = true;
  String currentTitle = "inicio";

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.homeApp) {
      container = const HomeAppPage();
    } else if (currentPage == DrawerSections.interes_simple) {
      container = InteresSimplePage();
    } else if (currentPage == DrawerSections.interes_compuesto) {
      container = InteresCompuestoPage();
    } else if (currentPage == DrawerSections.anualidades) {
      container = const AnualidadesPage();
    }else if (currentPage == DrawerSections.gradientes) {
      container = GradientesPage();
    }else if (currentPage == DrawerSections.amortizacion) {
      container = AmortizacionPage();
    }
    return isLoading
      ? const LoadingPage()
      : Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171731),
        title: Text(
          currentTitle.toUpperCase(),
          style: GoogleFonts.saira(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF29E9FF)),
      ),
      body: container,
      drawer: Drawer(
        backgroundColor: const Color(0xFF171731),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Column(
      // shows the list of menu drawer
      children: [
        menuItem(0, "Inicio", Remix.home_7_fill, currentPage == DrawerSections.homeApp ? true : false),
        menuItem(1, "Interés Simple", Remix.funds_fill, currentPage == DrawerSections.interes_simple ? true : false),
        menuItem(2, "Interés Compuesto", Remix.exchange_funds_line,currentPage == DrawerSections.interes_compuesto ? true : false),
        menuItem(3, "Anualidades", Remix.calendar_todo_fill, currentPage == DrawerSections.anualidades ? true : false),
        menuItem(4, "Gradientes", Remix.line_chart_line, currentPage == DrawerSections.gradientes ? true : false),
        menuItem(5, "Amortización", Remix.line_chart_line, currentPage == DrawerSections.amortizacion ? true : false),
      ],
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[100] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 0) {
              currentPage = DrawerSections.homeApp;
              currentTitle = 'Inicio';
            } else if (id == 1) {
              currentPage = DrawerSections.interes_simple;
              currentTitle = 'Interés Simple';
            } else if (id == 2) {
              currentPage = DrawerSections.interes_compuesto;
              currentTitle = 'Interés Compuesto';
            } else if (id == 3) {
              currentPage = DrawerSections.anualidades;
              currentTitle = 'Anualidades';
            } else if (id == 4) {
              currentPage = DrawerSections.gradientes;
              currentTitle = 'Gradientes';
            } else if (id == 5) {
              currentPage = DrawerSections.amortizacion;
              currentTitle = 'Amortización';
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 25,
                  color: const Color(0xFF29E9FF),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: GoogleFonts.saira(
                    color: selected ? const Color(0xFF171731) : Colors.white,
                    fontSize: 16,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal 
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

enum DrawerSections {
  homeApp,
  interes_simple,
  interes_compuesto,
  anualidades,
  gradientes,
  amortizacion
}