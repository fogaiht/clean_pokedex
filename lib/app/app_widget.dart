import 'package:clean_pokedex/app/shared/utils/generate_material_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.red;
    Color secondaryColor = Colors.white;
    Color errorColor = Color(0xff36e7f4);
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: secondaryColor,
          contentPadding: EdgeInsets.all(20.0),
          labelStyle: TextStyle(color: primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: secondaryColor, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 3.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 3.0),
            borderRadius: BorderRadius.circular(6.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 2.0),
            borderRadius: BorderRadius.circular(6.0),
          ),
          errorStyle: TextStyle(fontSize: 15, color: Colors.white),
          hintStyle: TextStyle(color: secondaryColor, fontSize: 20),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
