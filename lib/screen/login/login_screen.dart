import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:snkr_flutter/core/widgets/custom_text_field.dart';
import 'package:snkr_flutter/screen/registration/registration_screen.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/utils/layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool _obscureText = true;
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
                    height: 100,
                    //width: 500,
                  ),
                ),
                // const Text(
                //   "Login",
                //   style: TextStyle(
                //     fontFamily: "Poppins-SemiBold",
                //     decoration: TextDecoration.none,
                //     fontSize: 30,
                //     color: cBlack,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    //key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: usernameController,
                          labelText: "Enter Email",
                          validator: (value) {
                            if (value == null) {
                              return "Email is required";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: passwordController,
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
                        Row(
                          children: [
                            checkbox(),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins-SemiBold",
                                  color: cBlack),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50), // 10% space
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: ElevatedButton(
                                key: const ValueKey("loginBtn"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cBlack,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                onPressed: () async {
                                  //TODO
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LayoutScreen()));
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: cWhite,
                                  ),
                                ),
                              ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen(),
                                  ),
                                );
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
