import 'package:flutter/material.dart';
import 'package:flutter_fruit_shop/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"FruitShop",
      home: IntroScreen(),
      theme: Theme.of(context).copyWith(
        
      ),
    );
  }
}
