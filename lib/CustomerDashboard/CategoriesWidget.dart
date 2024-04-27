import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  // Variable to track the selected container index
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildCategoryContainer("All", 0),
          buildCategoryContainer("Nike", 1),
          buildCategoryContainer("Adidas", 2),
          buildCategoryContainer("New Balance", 3),
          buildCategoryContainer("Puma", 4),
          buildCategoryContainer("Jordan", 5),
        ],
      ),
    );
  }

  // Function to build each category container
  Widget buildCategoryContainer(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Update the selected index
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Selectable Categories'),
      ),
      body: CategoriesWidget(),
    ),
  ));
}
