import 'package:flutter/material.dart';
import 'package:snkr_flutter/Cart/CartPage.dart';
import 'package:snkr_flutter/screen/splashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
    return MaterialApp(
      title: 'snkr',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
