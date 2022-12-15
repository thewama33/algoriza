import 'package:algoriza/main.dart';
import 'package:algoriza/presentation/Home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AlgorizaDemoApp.routeName: ((context) => const AlgorizaDemoApp()),
    HomePage.routeName: ((context) =>  HomePage()),
    
  };
}
