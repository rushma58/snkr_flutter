import 'package:flutter/material.dart';

import '../../../core/common/button.dart';
import '../Shipping Location/shipping_location.dart';

class Esewa extends StatefulWidget {
  const Esewa({super.key});

  @override
  State<Esewa> createState() => _EsewaState();
}

//radio
class _EsewaState extends State<Esewa> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  /// for calculation part
  final int subTotal = 700; // Sub-total amount
  final int deliveryCharge = 100; // Delivery charge

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int totalAmount = subTotal + deliveryCharge;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction"),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "Choose your payment method:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    height: 55,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      border: _type == 1
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.red,
                                ),
                                Text(
                                  "Esewa",
                                  style: _type == 1
                                      ? const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )
                                      : TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[300],
                                          fontWeight: FontWeight.bold,
                                        ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/esewa.png",
                              width: 80,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    height: 55,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      border: _type == 2
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.red,
                                ),
                                Text(
                                  "Khalti",
                                  style: _type == 2
                                      ? const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )
                                      : TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[300],
                                          fontWeight: FontWeight.bold,
                                        ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/khalti.png",
                              width: 80,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    height: 55,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      border: _type == 3
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.red,
                                ),
                                Text(
                                  "Cash on Delivery",
                                  style: _type == 3
                                      ? const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )
                                      : TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[300],
                                          fontWeight: FontWeight.bold,
                                        ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/cashondelivery.png",
                              width: 70,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sub-Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Rs. $subTotal",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Delivery Charge",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Rs. $deliveryCharge",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Rs. $totalAmount",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 220),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShippingAddress()));
                    },
                    child: ContainerButtonModel(
                      itext: "Confirm Payment",
                      containerWidth: size.width,
                      bgColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
