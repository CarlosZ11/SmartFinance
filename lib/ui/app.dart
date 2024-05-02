import 'package:calculator_app/ui/home/home.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/capital.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/interes.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/monto.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/tasa_interes.dart';
import 'package:calculator_app/ui/home/pages/interes_simple/pages/tiempo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartFinance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF29E9FF)),
        useMaterial3: true,
      ),
      initialRoute: '/Home',
      routes: {
        '/Home':(context) => const HomePage(),
        '/MontoPage':(context) => const MontoPage(),
        '/InteresPage':(context) => const InteresPage(),
        '/CapitalPage':(context) => const CapitalPage(),
        '/TasaInteresPage':(context) => const TasaInteresPage(),
        '/TiempoPage':(context) => const TiempoPage(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('es', ''),
      supportedLocales: const [
        Locale('es', ''), // Spanish
      ],
    );
  }
}