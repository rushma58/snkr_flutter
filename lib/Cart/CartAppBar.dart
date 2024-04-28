import 'package:flutter/material.dart';

class CartAppBar extends StatefulWidget {
  const CartAppBar({super.key});

  @override
  State<CartAppBar> createState() => _CartAppBarState();
}

class _CartAppBarState extends State<CartAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: (){
           Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
            size: 30,
            color: Colors.black,),
          ),

          Padding(padding: EdgeInsets.only(left: 20),
          child: Text("Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
          ),

          Spacer(),
          Icon(Icons.more_vert,
          size: 30,
          color: Colors.black,
          )


        ],
      ),





    );
  }
}