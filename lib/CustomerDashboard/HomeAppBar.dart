import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: const Row(
        children: [
          Icon(
            Icons.menu,
            size: 40,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 110),
          
            child: Text(
              "SNKR",
              
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
                
              ),
              
            ),
          
          
          
          ),
          Spacer(),

          InkWell(
          //           onTap: (){
          //             Navigator.pushNamed(context, "cartPage");
          //           },
            child: Icon(Icons.toggle_off,
            size: 50,
            color: Colors.black,),
          ),
        ],
      ),
    );
  }
}
