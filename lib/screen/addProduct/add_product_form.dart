import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/widgets/custom_text_field.dart';
import 'package:snkr_flutter/feature/product/addProduct/controllers/add_product_controller.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final addProductController = Get.put(AddProductController());
  TextEditingController confirmPasswordController = TextEditingController();
  // final bool _obscureText = true;
  // final bool _obscureTextConfirmPassword = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Text("Add Product"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: addProductController.name_controller,
                      labelText: "First Name",
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == "") {
                          return ("This field is required");
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30), // 10% space
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Obx(() {
                            return ElevatedButton(
                              //key: const ValueKey("loginBtn"),

                              onPressed: addProductController.isLoading.value
                                  ? null
                                  : () async {
                                      await addProductController.addProduct();
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cBlack,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                              // onPressed: () async {
                              //   //TODO
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               const LayoutScreen()));
                              // },
                              child: const Text(
                                'Create an Account',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: cWhite,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
