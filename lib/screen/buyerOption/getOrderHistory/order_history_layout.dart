import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/widgets/top_nav_bar.dart';
import 'package:snkr_flutter/screen/buyerOption/getOrderHistory/order_history_screen.dart';

import '../../../../core/utils/colors.dart';

class GetMyOrderLayout extends StatefulWidget {
  const GetMyOrderLayout({super.key});

  @override
  State<GetMyOrderLayout> createState() => _GetMyOrderLayoutState();
}

class _GetMyOrderLayoutState extends State<GetMyOrderLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: TopNavBar(
            appBarName: "My Order",
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
        body: const TabBarView(children: [
          OrderHistoryScreen(orderStatus: "1"),
          OrderHistoryScreen(orderStatus: "2"),
          OrderHistoryScreen(orderStatus: "3"),
          OrderHistoryScreen(orderStatus: "4"),
          OrderHistoryScreen(orderStatus: "5"),
        ]),
      ),
    );
  }
}
