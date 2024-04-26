import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=1; i<6; i++)
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Text("-50%",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
              ),

              const Icon(Icons.favorite_border_outlined,
              size: 30,
              color: Colors.red,)
              ,
              ],

            ),
            
            InkWell(
              onTap: (){},
              child: Container(
                
                margin: const EdgeInsets.all(10),
                child: Image.asset("images/$i.png",
                height: 120, width: 120,),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 3),
              alignment: Alignment.centerLeft,
              child: const Text("Product Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 17,
            
              ),),


              
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: const Text("Product Description please",
              style: TextStyle(color: Colors.blue,
              fontSize: 12,
              fontWeight: FontWeight.bold),),

            ),
            const Padding(padding: EdgeInsets.only(top: 15),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [Text("\$55",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 20,
              ),),

              Icon(Icons.shopping_cart_checkout_rounded,
              size: 30,
              color: Colors.blue,)

              
              
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















