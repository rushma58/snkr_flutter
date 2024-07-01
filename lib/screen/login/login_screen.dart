import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/widgets/custom_text_field.dart';
import 'package:snkr_flutter/feature/auth/login/controller/login_controller.dart';
import 'package:snkr_flutter/screen/registration/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final bool _obscureText = true;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 100),
              child: Image.asset(
                'assets/icons/main_logo.png',
                height: 100,
                //width: 500,
              ),
            ),
            const Text("Login", style: fBlackSemiBold34),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                //key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: loginController.email_controller,
                      labelText: "Enter Email",
                      validator: (value) {
                        if (value == null) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: loginController.password_controller,
                      labelText: "Enter Password",
                      isObscured: true,
                      validator: (value) {
                        if (value == null) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            checkbox(),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Remember me',
                              style: fBlackSemiBold14,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30), // 10% space
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Obx(() {
                                return ElevatedButton(
                                  key: const ValueKey("loginBtn"),
                                  onPressed: loginController.isLoading.value
                                      ? null
                                      : () async {
                                          await loginController.userLogin();
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
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const LayoutScreen(),
                                  //     ),
                                  //   );
                                  // },
                                  child: const Text(
                                    'Login',
                                    style: fWhiteSemiBold16,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(width: 10), // 10% space
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                key: const ValueKey("fingerPrintBtn"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cBlack,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Iconify(
                                  Ion.finger_print,
                                  color: cWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Don't have an account?",
                                style: fBlackRegular14),
                            GestureDetector(
                              onTap: () {
                                Get.to(const RegistrationScreen());
                              },
                              child: const Text(
                                "REGISTER NOW",
                                style: fBlackSemiBold16,
                              ),
                            ),
                          ],
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
