import 'package:flutter/material.dart';

import '../../../core/common/button.dart';
import '../Address/address.dart';
import '../OrderConfirmation/order_confirmation.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final fullNameController = TextEditingController();
    final mobileNumberController = TextEditingController();
    final streetNameController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final zipCodeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Shipping Address"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Fill in the details:",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Full Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: mobileNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mobile Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: streetNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Street Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your street name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "City",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: stateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "State/Province",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your state or province';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: zipCodeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Zip Code",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your zip code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(height: 50),
                  ContainerButtonModel(
                    itext: "Add Address",
                    bgColor: Colors.red,
                    containerWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        final address = Address(
                          fullName: fullNameController.text,
                          mobileNumber: mobileNumberController.text,
                          streetName: streetNameController.text,
                          address: addressController.text,
                          city: cityController.text,
                          state: stateController.text,
                          zipCode: zipCodeController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderConfirmScreen(address: address),
                          ),
                        );
                      }
                    },
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
