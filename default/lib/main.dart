import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'noisy.dart';
import 'coord.dart';

ThemeMode appTheme = ThemeMode.system; //dark / light

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'db Meter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('db Meter'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: NoiseApp(), // Widget de medición de ruido
            ),
            Expanded(
              flex: 1,
              child: CoordApp(), // Widget de ubicación
            ),
          ],
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
      ),
      theme: ThemeData(
        fontFamily: GoogleFonts.comfortaa().fontFamily,
      ),
      themeMode: appTheme,
    );
  }
}
