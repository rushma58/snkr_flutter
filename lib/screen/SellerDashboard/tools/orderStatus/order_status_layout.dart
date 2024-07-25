import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/widgets/top_nav_bar.dart';
import 'package:snkr_flutter/screen/SellerDashboard/tools/orderStatus/order_status_screen.dart';

import '../../../../core/utils/colors.dart';

class OrderStatusLayout extends StatefulWidget {
  const OrderStatusLayout({super.key});

  @override
  State<OrderStatusLayout> createState() => _OrderStatusLayoutState();
}

class _OrderStatusLayoutState extends State<OrderStatusLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: TopNavBar(
            appBarName: "Order Status",
            filterRequired: false,
            backFunction: '',
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: cGray,
                child: const TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  dividerColor: cWhite,
                  dividerHeight: 4,
                  tabs: [
                    Tab(
                      child: Text(
                        "Order Placed",
                        style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Seller Confirmation",
                        style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Parcel Dispacthed",
                        style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Delivered",
                        style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Received",
                        style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ), // Creates border
                    color: cGrayOld,
                  ), //Change background color from here
                  indicatorWeight: 2,
                  indicatorColor: cGray,
                  labelColor: cWhite,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          OrderStatusScreen(orderStatus: "1"),
          OrderStatusScreen(orderStatus: "2"),
          OrderStatusScreen(orderStatus: "3"),
          OrderStatusScreen(orderStatus: "4"),
          OrderStatusScreen(orderStatus: "5"),
        ]),
      ),
    );
  }
}
