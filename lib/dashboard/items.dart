// import 'package:flutter/material.dart';

// class ItemsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       childAspectRatio: 0.68,
//       physics:
//           NeverScrollableScrollPhysics(), //for halesi balla yo halne it disables the scroll functionality of the gridview. Then, it will scroll in listview of homepage
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       children: [
// //shopping cart haru wala icon ra rs wala icon paxi balla esma aune
//         for (int i = 1; i < 6; i++)
//           Container(
//             padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//             decoration: BoxDecoration(
//               color: Colors.purpleAccent,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         color: Color(0xFF4C53A5),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         "-50%",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.amberAccent,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Icon(
//                       Icons.favorite_border,
//                       color: Colors.red,
//                     )
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     margin: EdgeInsets.all(10),
//                     child: Image.asset(
//                       "Images/$i.png", // esma for paxi balla $i halne

//                       height: 120,
//                       width: 120,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(bottom: 8),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Product Title",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Color(0xFF4C53A5),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Write the description of the product",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Color(0xFF4C53A5),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         " Rs.55",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF4C53A5),
//                         ),
//                       ),
//                       Icon(
//                         Icons.shopping_cart_checkout,
//                         color: Color(0xFF4C53A5),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }









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















