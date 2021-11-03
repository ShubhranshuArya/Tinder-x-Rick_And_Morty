import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grroom_tinder_lite/helper/bindings.dart';
import 'package:grroom_tinder_lite/view/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}


