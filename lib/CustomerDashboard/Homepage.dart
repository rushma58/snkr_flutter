import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:snkr_flutter/CustomerDashboard/CategoriesWidget.dart';
import 'package:snkr_flutter/CustomerDashboard/HomeAppBar.dart';
import 'package:snkr_flutter/CustomerDashboard/ItemsWidget.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});



  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeAppBar(),

          Container(

            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )
            ),
            child: Column(
              children: [Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey,
                  width: 1),
                  boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 2, // Blur radius
        offset: Offset(0, 2), // Shadow position, (x,y)
      ),
    ],
                  

                
                  
                
                ),
                child: Row(
                  children: [Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 50,
                    width: 300,
                    
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here...",
                      ),
                    ),
                  ), const Spacer(),
                  const Icon(Icons.search,
                  size: 30,
                  color: Colors.black,),

                
                  
                  
                  
                  ],
                  

                ),
              ),

                //CATEGORIES

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(vertical: 20,
                    horizontal: 20),
                    child: const Text("Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                    

                    
                    


                  ),
                  
                  
                 CategoriesWidget(),

                  //ITEMS

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text("Our Top Products",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),),

                    
                  ),

                  const ItemsWidget(),
              
              
              
              
              
              ],




            ),

          ),



        ],

      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        height: 75,
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
            ),
             Icon(
            Icons.menu_book,
            size: 30,
            color: Colors.white,
            ),
             Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
            ),
             Icon(
            Icons.card_travel,
            size: 30,
            color: Colors.white,
            ),

        ],
      ),




    );
  }
}