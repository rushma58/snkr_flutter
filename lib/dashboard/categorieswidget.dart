// import 'package:flutter/material.dart';

// class CategoriesWidget extends StatelessWidget {
//   const CategoriesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [ //yo tala ko for wala chai tala images ko asset import garesi nike wala ani balla mathi haleko ho
//           for(int i=1; i<5; i++)
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//             decoration: BoxDecoration(
//               color: Colors.pink,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   //use i variable mathi for halesi to change pictures in loop
//                   "images/$i.png",
//                   width: 40,
//                   height: 40,
//                 ),
//                 Text("Nike", style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17,
//                   color: Color(0xFF4C53A5), //espaxi homepage.dart ma jane
//                 ),)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),


          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [Text("All",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),),

            Padding(padding: EdgeInsets.only(left: 10),),

            Text("All",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),),

            Text("All",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),),

            Text("Nike",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),),

            Text("Adidas",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),),

            Text("New Balance",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),),

            Text("Puma",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),),

            




            ],
          ) ,





        )
      ],),
    );
  }
}