import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
        title: 'Neumorphic App',
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
          baseColor: Color(0xFFEAF0F8),
          accentColor: Color(0xFFD62828),
          lightSource: LightSource.top,
          depth: 6,
        ),
        darkTheme: NeumorphicThemeData(
          baseColor: Color(0xFF3E3E3E),
          lightSource: LightSource.topLeft,
          depth: 6,
        ),
        initialRoute: '/',
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute);
  }
}
