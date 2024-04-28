import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatelessWidget {
  CartItemSamples({super.key});

  @override
  Widget build(BuildContext context) {
return Column(
  children: [
    for(int i=1; i<5; i++)
    Container(

      height: 130,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
            color: Color.fromARGB(255, 248, 244, 242),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
BoxShadow(
        color: Colors.black.withOpacity(0.2), // Shadow color
        spreadRadius: 2, // Spread radius
        blurRadius: 2, // Blur radius
        offset: Offset(0, 2), // Shadow position, (x,y)
      ),
            ],



            
          ),

      child: Row(
        children: [
          Container(height: 70,
          width: 70,
          margin: EdgeInsets.only(right: 10),
          child: Image.asset("images/$i.png"),
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("Product name",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),

              Text("Rs. 5500",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),

            ],
          ),
          ),

          Spacer(),

          Padding(padding: EdgeInsets.symmetric( vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Icon(Icons.delete,
              color: Colors.red,
              size: 30,),

              Row(
                children: [Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(20),
                    
                  
                      
                      
                    

                  ),

                  child: Icon(CupertinoIcons.add,
                  size: 20,
                  color: Colors.blue,),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: Text("01",
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black ),
                  ),

                ),


                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(20),
                    
                  
                      
                      
                    

                  ),

                  child: Icon(CupertinoIcons.minus,
                  size: 20,
                  color: Colors.blue,),

                ),


                
                
                ],
              ),
              

            







        ],
      ),


    ),

  ],




),
    ),
  ]
);
 }
}