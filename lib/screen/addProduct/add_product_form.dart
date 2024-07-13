import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snkr_flutter/core/constants/list.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/widgets/custom_text_field.dart';
import 'package:snkr_flutter/feature/product/addProduct/controllers/add_product_controller.dart';

import '../../core/widgets/custom_date_field.dart';
import '../../core/widgets/custom_drop_down.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  File? _image;

  final addProductController = Get.put(AddProductController());
  bool isChecked = false;
  late String? images = "";

  Future<void> _pickImage() async {
    try {
      final file = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (file != null) {
        debugPrint('Selected file: ${file.path}');
        setState(() {
          _image = File(file.path);
          addProductController.images_controller = _image?.path;
        });
      } else {
        debugPrint('No image selected');
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: cBlack,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Sell",
              style: fWhiteSemiBold24,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image.asset(
                "assets/icons/main_logo.png",
                height: 30,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: addProductController.name_controller,
                          labelText: "Shoes Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: addProductController.brand_controller,
                          labelText: "Brand Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: addProductController.model_controller,
                          labelText: "Model Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomDropdownField(
                          dropdownList: shoeCategoriesList,
                          controller: addProductController.category_controller,
                          labelText: "Category",
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: addProductController.size_controller,
                          labelText: "Size",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: addProductController.color_controller,
                          labelText: "Color",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        const Text('10% commission charge will be subjected',
                            style: fRedRegular12),
                        TextFormField(
                          controller: addProductController.price_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Price',
                            labelStyle: fGrayRegular14,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: cGrayOld.withOpacity(0.5))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: cBlack)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the price';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            double price = double.tryParse(value) ?? 0.0;
                            double commission = price * 0.1; // 10% commission
                            double finalPrice = price + commission;

                            addProductController.commission_controller.text =
                                commission.toStringAsFixed(2);
                            addProductController.final_price_controller.text =
                                finalPrice.toStringAsFixed(2);
                          },
                        ),

                        const SizedBox(height: 12),
                        CustomTextField(
                          controller:
                              addProductController.commission_controller,
                          readOnly: true,
                          labelText: "Commission (10%)",
                        ),

                        CustomTextField(
                          controller:
                              addProductController.final_price_controller,
                          readOnly: true,
                          labelText: "Final Price",
                        ),

                        CustomTextField(
                          controller:
                              addProductController.description_controller,
                          labelText: "Description",
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),

                        CustomTextField(
                          controller: addProductController.material_controller,
                          labelText: "Material used",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: addProductController.sku_controller,
                          labelText: "SKU",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),

                        // CustomTextField(
                        //   controller: addProductController.release_date_controller,
                        //   labelText: "Release Date",
                        //   keyboardType: TextInputType.name,
                        //   validator: (value) {
                        //     if (value == "") {
                        //       return ("This field is required");
                        //     }
                        //     return null;
                        //   },
                        // ),

                        CustomDateField(
                          controller:
                              addProductController.release_date_controller,
                          labelText: "Release Date",
                          readOnly: true,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: addProductController.weight_controller,
                          labelText: "Weight",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),

                        CustomTextField(
                          controller:
                              addProductController.dimensions_controller,
                          labelText: "Dimensions",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),

                        CustomDropdownField(
                          dropdownList: shoeGenderList,
                          controller: addProductController.gender_controller,
                          labelText: "Gender",
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),

                        // CustomDropdownField(
                        //   dropdownList: shoeStatusList,
                        //   controller: addProductController.status_controller,
                        //   labelText: "Status",
                        //   validator: (value) {
                        //     if (value == "") {
                        //       return ("This field is required");
                        //     }
                        //     return null;
                        //   },
                        // ),

                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _pickImage,
                          child: const Text('Upload Image'),
                        ),
                        const SizedBox(height: 20),
                        _image == null
                            ? const Text(
                                'No image selected.',
                                style: TextStyle(color: Colors.red),
                              )
                            : Image.file(_image!),
                        const SizedBox(height: 30), // 10% space
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Obx(() {
                                return ElevatedButton(
                                  //key: const ValueKey("loginBtn"),
                                  onPressed:
                                      addProductController.isLoading.value
                                          ? null
                                          : () async {
                                              await addProductController
                                                  .addProduct();
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
                                    'Add Product',
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
        ],
      ),
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:snkr_flutter/core/utils/colors.dart';
// import 'package:snkr_flutter/core/widgets/custom_text_field.dart';
// import 'package:snkr_flutter/feature/product/addProduct/controllers/add_product_controller.dart';

// import '../../core/widgets/custom_drop_down.dart';
// import '../../core/widgets/top_nav_bar.dart';

// class AddProductForm extends StatefulWidget {
//   const AddProductForm({super.key});

//   @override
//   State<AddProductForm> createState() => _AddProductFormState();
// }

// class _AddProductFormState extends State<AddProductForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final ImagePicker _imagePicker = ImagePicker();
//   File? _image;

//   final addProductController = Get.put(AddProductController());

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await _imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//         debugPrint("Image: $_image");
//         addProductController.images_controller.text =
//             "[\"${pickedFile.path}\"]";

//         debugPrint(
//             "controller: ${addProductController.images_controller.text}");
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: TopNavBar(
//           appBarName: "Add Product",
//           filterRequired: false,
//           backFunction: '',
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
//               child: Text("Add Product"),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     CustomTextField(
//                       controller: addProductController.name_controller,
//                       labelText: "Shoes Name",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.brand_controller,
//                       labelText: "Brand Name",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.model_controller,
//                       labelText: "Model Name",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomDropdownField(
//                       dropdownList: shoeCategoriesList,
//                       controller: addProductController.category_controller,
//                       labelText: "Category",
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.size_controller,
//                       labelText: "Size",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.color_controller,
//                       labelText: "Color",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.price_controller,
//                       labelText: "Price",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.description_controller,
//                       labelText: "Description",
//                       keyboardType: TextInputType.multiline,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.material_controller,
//                       labelText: "Material used",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.sku_controller,
//                       labelText: "SKU",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.release_date_controller,
//                       labelText: "Release Date",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.weight_controller,
//                       labelText: "Weight",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: addProductController.dimensions_controller,
//                       labelText: "Dimensions",
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomDropdownField(
//                       dropdownList: shoeGenderList,
//                       controller: addProductController.category_controller,
//                       labelText: "Gender",
//                       validator: (value) {
//                         if (value == "") {
//                           return ("This field is required");
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _pickImage,
//                       child: const Text('Upload Image'),
//                     ),
//                     const SizedBox(height: 20),
//                     _image == null
//                         ? const Text(
//                             'No image selected.',
//                             style: TextStyle(color: Colors.red),
//                           )
//                         : Image.file(_image!),
//                     const SizedBox(height: 30),
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Obx(() {
//                             return ElevatedButton(
//                               onPressed: addProductController.isLoading.value
//                                   ? null
//                                   : () async {
//                                       await addProductController
//                                           .addProduct(_image);
//                                     },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: cBlack,
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(8)),
//                                 ),
//                               ),
//                               child: const Text(
//                                 'Add Product',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: 'Poppins-SemiBold',
//                                   color: cWhite,
//                                 ),
//                               ),
//                             );
//                           }),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



