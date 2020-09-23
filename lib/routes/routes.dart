import 'package:atsign_atmosphere_app/routes/route_names.dart';
import 'package:atsign_atmosphere_app/screens/home/home.dart';
import 'package:atsign_atmosphere_app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class SetupRoutes {
  static String initialRoute = Routes.HOME;

  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.HOME: (context) => Home(),
      Routes.WELCOME_SCREEN: (context) => WelcomeScreen(),
    };
  }
}
