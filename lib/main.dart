import 'package:flutter/material.dart';

import 'FoodDeliveryHomePage.dart';
import 'Home_page.dart';
 void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Food_HomePage()
      );
  }
}