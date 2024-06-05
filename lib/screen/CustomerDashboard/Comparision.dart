import 'package:flutter/material.dart';

class Shoe {
  final String name;
  final String image;
  final List<String> features;

  Shoe({required this.name, required this.image, required this.features});
}

class ShoeComparisonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoeComparisonScreen(),
    );
  }
}

class ShoeComparisonScreen extends StatefulWidget {
  @override
  _ShoeComparisonScreenState createState() => _ShoeComparisonScreenState();
}

class _ShoeComparisonScreenState extends State<ShoeComparisonScreen> {
  final List<Shoe> shoes = [
    Shoe(name: "Shoe 1", image: "images/1.png", features: ["Comfortable", "Lightweight", "Stylish"]),
    Shoe(name: "Shoe 2", image: "images/2.png", features: ["Durable", "Affordable", "Breathable"]),
    // Add more shoes as needed
  ];

  Shoe? selectedShoe1;
  Shoe? selectedShoe2;

  void _selectShoe(Shoe shoe, int shoeNumber) {
    setState(() {
      if (shoeNumber == 1) {
        selectedShoe1 = shoe;
      } else {
        selectedShoe2 = shoe;
      }
    });
  }

  void _resetSelection(int shoeNumber) {
    setState(() {
      if (shoeNumber == 1) {
        selectedShoe1 = null;
      } else {
        selectedShoe2 = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoe Comparison'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => _showShoeSelectionDialog(1),
                          child: selectedShoe1 == null
                              ? Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.grey[300],
                                  child: Icon(Icons.add_a_photo, size: 50),
                                )
                              : Image.asset(selectedShoe1!.image, width: 150, height: 150),
                        ),
                        SizedBox(height: 10),
                        if (selectedShoe1 != null) ...[
                          Text(selectedShoe1!.name),
                          ...selectedShoe1!.features.map((feature) => Text(feature)).toList(),
                          TextButton(
                            onPressed: () => _resetSelection(1),
                            child: Text('Choose Different Shoe'),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => _showShoeSelectionDialog(2),
                          child: selectedShoe2 == null
                              ? Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.grey[300],
                                  child: Icon(Icons.add_a_photo, size: 50),
                                )
                              : Image.asset(selectedShoe2!.image, width: 150, height: 150),
                        ),
                        SizedBox(height: 10),
                        if (selectedShoe2 != null) ...[
                          Text(selectedShoe2!.name),
                          ...selectedShoe2!.features.map((feature) => Text(feature)).toList(),
                          TextButton(
                            onPressed: () => _resetSelection(2),
                            child: Text('Choose Different Shoe'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showShoeSelectionDialog(int shoeNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Shoe'),
          content: SingleChildScrollView(
            child: Column(
              children: shoes.map((shoe) {
                return ListTile(
                  title: Text(shoe.name),
                  onTap: () {
                    _selectShoe(shoe, shoeNumber);
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
