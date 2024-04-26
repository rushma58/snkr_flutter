import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snkr_flutter/dashboard/homepage.dart';
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
        "/" : (context) => Homepage()
       // "cartPage" : (context) => CartPage()
      },
      //home: Homepage(),
    );
    


  }
}