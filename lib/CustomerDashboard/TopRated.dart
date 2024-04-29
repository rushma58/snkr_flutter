import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       
      child: Row(
       
        
        children: [
         
        for(int i=6; i<12; i++)
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          height: 240,
          width: 180,
         

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

          child: Column(
            children: [
            
                       

                        Padding(padding: EdgeInsets.only(bottom: 10),),
            
            InkWell(
              onTap: (){},
              child: Container(
                
                margin: const EdgeInsets.all(10),
                child: Image.asset("images/$i.png",
                height: 120, width: 120,),
              ),
            ),

            
            Padding(padding: EdgeInsets.only(bottom: 0),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [Text("Product Title is:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17,
              ),),

              Text("Price",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 14,
              ),),

              Text("Rs. 9000",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17,
              ),),



              

              
              
              ],


             
                
            ),

            ),
            
              ]
              ,
            ),
            
            ),
            
            
            
            
            ],
        
      ),
      
    );  }
}