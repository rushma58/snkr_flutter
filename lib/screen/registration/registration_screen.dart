import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/widgets/custom_text_field.dart';
import 'package:snkr_flutter/feature/auth/registration/controller/registration_controller.dart';
import 'package:snkr_flutter/screen/login/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final registrationController = Get.put(RegistrationController());
  TextEditingController confirmPasswordController = TextEditingController();
  // final bool _obscureText = true;
  // final bool _obscureTextConfirmPassword = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            color: cWhite,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Image.asset(
                    'assets/icons/main_logo.png',
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller:
                              registrationController.first_name_controller,
                          labelText: "First Name",
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
                              registrationController.last_name_controller,
                          labelText: "Last Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: registrationController.email_controller,
                          labelText: "Email",
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
                              registrationController.contact_number_controller,
                          labelText: "Contact Number",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),

                        CustomTextField(
                          controller: registrationController.role_controller,
                          labelText: "Role",
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
                              registrationController.payment_number_controller,
                          labelText: "Khalti Number",
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
                              registrationController.current_address_controller,
                          labelText: "Current Address",
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
                              registrationController.password_controller,
                          labelText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == "") {
                              return ("This field is required");
                            }
                            return null;
                          },
                        ),

                        CustomTextField(
                          controller: confirmPasswordController,
                          labelText: "Confirm Password",
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value !=
                                registrationController
                                    .password_controller.text) {
                              return ("Password and Confirm password didn't match.");
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 50), // 10% space
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Obx(() {
                                return ElevatedButton(
                                  //key: const ValueKey("loginBtn"),

                                  onPressed:
                                      registrationController.isLoading.value
                                          ? null
                                          : () async {
                                              await registrationController
                                                  .userRegister();
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
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Already have an account?",
                                style: fBlackRegular14),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "LOGIN",
                                style: fBlackSemiBold16,
                              ),
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
        ),
      ]),
    );
  }

  Widget checkbox() {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          if (!isChecked) {
            //_clearSavedCredentials();
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: isChecked
                ? cBlack
                : cWhite, // Change background color when ticked
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: isChecked
                  ? cBlack
                  : cBlack, // Change inner border color when ticked
              width: 2.0,
            ),
          ),
          child: isChecked
              ? const Icon(
                  Icons.check,
                  size: 16.0,
                  color: cWhite, // Change checkmark color when ticked
                )
              : null,
        ),
      ),
    );
  }
}
