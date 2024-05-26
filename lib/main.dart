import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd/ui/Splash.dart';
import 'package:sd/ui/home_binding.dart';
import 'package:sd/ui/home_screen.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}