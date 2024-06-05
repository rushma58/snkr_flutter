import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class SellerHomepage extends StatefulWidget {
  @override
  _SellerHomepage createState() => _SellerHomepage();
}

class _SellerHomepage extends State<SellerHomepage> {
  String _name = "Neha Shakya";
  String _number = "Add Your Number";
  int _wishlistCount = 1;
  int _followedStoresCount = 3;
  int _vouchersCount = 1;

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
      _number = "Add Your Number";
      _wishlistCount = 1;
      _followedStoresCount = 3;
      _vouchersCount = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      child: InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, "itemPage");
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            "images/1.png",
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _number,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("$_wishlistCount"),
                        Text(
                          "My Wishlist",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("$_followedStoresCount"),
                        Text(
                          "Followed Stores",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("$_vouchersCount"),
                        Text(
                          "Vouchers",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildGridItem(Icons.info, "Product Details"),
                _buildGridItem(Icons.checklist, "Product Status"),
                _buildGridItem(Icons.add_circle, "Add new Product"),
                _buildGridItem(Icons.verified, "Authentic Check"),
                _buildGridItem(Icons.shopping_cart, "My Orders"),
                _buildGridItem(Icons.payment, "Payments"),
              ],
            ),
          ),
        ],
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

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 36),
        SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
