import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snkr_flutter/Cart/CartPage.dart';
import 'package:snkr_flutter/CustomerDashboard/Homepage.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(Object context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        
      ),
      routes: {
       // "/" : (context) => Homepage()
       "/" : (context) => CartPage()
      },
      //home: Homepage(),
    );
    


  }
}