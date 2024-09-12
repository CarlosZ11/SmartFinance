import 'package:calculator_app/models/user.dart';
import 'package:calculator_app/ui/home/pages/nequi/nequi_home.dart';
import 'package:flutter/material.dart';
import '../Auth/login_page.dart';
import 'package:calculator_app/ui/home/pages/ahorro_a_la_mano/ahorro_a_la_mano_home.dart';
import 'package:calculator_app/ui/home/pages/tarjeta/tarjeta_home.dart';
import 'package:calculator_app/ui/home/pages/my_drawer_header.dart';
import 'package:calculator_app/ui/widgets/home_page.dart';
import 'package:calculator_app/ui/widgets/loading_page.dart';
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
  bool isLoggedIn = false; // Nueva variable para controlar el login
  String currentTitle = "inicio";

  // Usuario actual simulado
  final Usuario usuarioActual = Usuario(
    nombre: 'Juan Perez',
    cedula: '1003242813',
    clave: '1967',
    numeroTelefono: '3197015408',
    numeroTarjeta: 'XXXX-XXXX-XXXX-7626',
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Controlar lo que se muestra según el estado de isLoading y isLoggedIn
    if (isLoading) {
      return const LoadingPage();
    } else if (!isLoggedIn) {
      return LoginPage(onLoginSuccess: () {
        setState(() {
          isLoggedIn = true;
        });
      });
    } else {
      return buildHomeScaffold();
    }
  }

  Scaffold buildHomeScaffold() {
    // El home original que ya tienes implementado
    var container;
    if (currentPage == DrawerSections.homeApp) {
      container =  HomeAppPage(usuarioActual: usuarioActual);
    } else if (currentPage == DrawerSections.nequi) {
      container = AmountSelectionNequiPage(usuarioActual: usuarioActual,);
    } else if (currentPage == DrawerSections.ahorro_a_la_mano) {
      container = AmountSelectionAhorroPage(usuarioActual: usuarioActual,);
    } else if (currentPage == DrawerSections.tarjeta) {
      container = AmountSelectionTarjetaPage(usuarioActual: usuarioActual,);
    }

    return Scaffold(
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
        menuItem(1, "Nequi", Remix.wallet_fill, currentPage == DrawerSections.nequi ? true : false),
        menuItem(2, "Ahorro a la Mano", Remix.coins_fill, currentPage == DrawerSections.ahorro_a_la_mano ? true : false),
        menuItem(3, "Tarjeta", Remix.visa_fill, currentPage == DrawerSections.tarjeta ? true : false),
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
              currentPage = DrawerSections.nequi;
              currentTitle = 'Nequi';
            } else if (id == 2) {
              currentPage = DrawerSections.ahorro_a_la_mano;
              currentTitle = 'Ahorro a la Mano';
            } else if (id == 3) {
              currentPage = DrawerSections.tarjeta;
              currentTitle = 'Tarjeta';
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
  nequi,
  ahorro_a_la_mano,
  tarjeta,
}
