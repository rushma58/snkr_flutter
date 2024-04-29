import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:snkr_flutter/Cart/CartPage.dart';
import 'package:snkr_flutter/screen/registration/registration_screen.dart';
import 'package:snkr_flutter/utils/colors.dart';
import 'package:snkr_flutter/utils/fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  bool _obscureText = true;
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
                    height: 350,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 7),
                          child: SizedBox(
                            //height: 32,
                            child: TextFormField(
                              key: const ValueKey("username"),
                              controller: _usernameController,
                              keyboardType: TextInputType.text,
                              cursorColor: cBlack,
                              style: const TextStyle(
                                color: cBlack,
                                fontFamily: 'Poppins-Regular',
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: cGrayOld.withOpacity(0.2),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                hintText: 'Enter username/ email',
                                hintStyle: fGrayRegular16,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username Cannot Be Empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 10),
                          child: SizedBox(
                            //height: 32,
                            child: TextFormField(
                              key: const ValueKey("password"),
                              controller: _passwordController,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.text,
                              cursorColor: cBlack,
                              style: const TextStyle(
                                color: cBlack,
                                fontFamily: 'Poppins-Regular',
                              ),
                              decoration: InputDecoration(
                                  // icon: Container(
                                  //   padding: const EdgeInsets.all(4),
                                  //   // decoration: BoxDecoration(
                                  //   //     color: cBlack,
                                  //   //     border: Border.all(color: cBlack),
                                  //   //     borderRadius: const BorderRadius.all(
                                  //   //         Radius.circular(4))),
                                  //   child: const Iconify(
                                  //     Mdi.shield_key,
                                  //     size: 26,
                                  //     color: cBlack,
                                  //   ),
                                  // ),
                                  filled: true,
                                  fillColor: cGrayOld.withOpacity(0.2),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  hintText: 'Enter password',
                                  hintStyle: fGrayRegular16,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Iconify(
                                        _obscureText ? Mdi.eye_off : Mdi.eye,
                                        size: 22,
                                        color: cBlack,
                                      ),
                                    ),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password Cannot Be Empty';
                                }
                                return null;
                              },
                            ),
                          ),
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
                                          builder: (context) => CartPage()));
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
