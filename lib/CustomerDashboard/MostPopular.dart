import 'package:flutter/material.dart';

class MostPopular extends StatelessWidget {
   MostPopular({super.key});



  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.78,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=1; i<5; i++)
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),

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
            children: [Container(
            padding: const EdgeInsets.only(bottom: 3),
            alignment: Alignment.centerLeft,
            child: const Text("Product Title",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 17,
                        
            ),),
            
            
            
                        ),
            
                        Container(
            alignment: Alignment.centerLeft,
            child: const Text("Product Description please",
            style: TextStyle(color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold),),
            
                        ),

                        Padding(padding: EdgeInsets.only(bottom: 20),),
            
            InkWell(
              onTap: (){},
              child: Container(
                
                margin: const EdgeInsets.all(10),
                child: Image.asset("images/$i.png",
                height: 120, width: 120,),
              ),
            ),

            
            const Padding(padding: EdgeInsets.only(bottom: 10),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [Text("Rs. 5555",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17,
              ),),

              Icon(Icons.shopping_cart_checkout,
              size: 30,
              color: Colors.black,)

              
              
              ],
             
                
            ),
            ),
            
              ]
              ,
            ),
            
            ),
            
            
            
            
            ],
          );


      



     
  }


  
}















