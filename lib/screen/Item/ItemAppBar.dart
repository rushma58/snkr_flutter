import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(

        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },      
            child: Icon(Icons.arrow_back),
            
                ),

                Padding(padding: EdgeInsets.only(left: 90),
                child: Text(
                  "Product Detail",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),

                ),
  ),
  Spacer(),
  Icon(Icons.favorite_border_outlined,
  color: Colors.red,
  size: 30,)

        ],
        
        
      ),




    );
  }
}