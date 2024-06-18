import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = "Neha Shakya";
  String _email = "neha211shakya@gmail.com";
  String _phoneNumber = "9818885966";

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    // Simulate a delay for fetching data
    await Future.delayed(Duration(seconds: 2));

    // This is where you would fetch data from a database in the future.
    // For now, we simulate this with hardcoded values.
    setState(() {
      _name = "Neha Shakya";
      _email = "neha211shakya@gmail.com";
      _phoneNumber = "9818885966";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 35,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
        title: Text("My Profile"),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account Information",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildInfoRow("Full Name", _name),
            Divider(),
            _buildInfoRow("Email", _email),
            Divider(),
            _buildInfoRow("Phone Number", _phoneNumber),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.black,
        height: 75,
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
            
          ),
           Icon(
            Icons.add_circle,
            size: 40,
            color: Colors.white,
          ), 
           Icon(
            Icons.checklist,
            size: 40,
            color: Colors.white,
          ), 
          
          Icon(
            Icons.person_2_sharp,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              // Add functionality to edit the information
            },
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
