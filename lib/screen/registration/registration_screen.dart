import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:snkr_flutter/screen/login/login_screen.dart';
import 'package:snkr_flutter/utils/colors.dart';
import 'package:snkr_flutter/utils/fonts.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController? _fullNameController;
  TextEditingController? _usernameController;
  TextEditingController? _emailController;
  TextEditingController? _cPasswordController;
  TextEditingController? _passwordController;
  bool _obscureText = true;
  bool _obscureTextConfirmPassword = true;
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
                    //key: _formKey,
                    child: Column(
                      children: [
                        //---------------NAME----------------
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 7),
                          child: SizedBox(
                            child: TextFormField(
                              key: const ValueKey("fullName"),
                              controller: _fullNameController,
                              keyboardType: TextInputType.text,
                              cursorColor: cBlack,
                              style: const TextStyle(
                                color: cBlack,
                                fontFamily: 'Poppins-Regular',
                              ),
                              // decoration: const InputDecoration(
                              //   contentPadding: EdgeInsets.all(10),
                              //   hintText: 'Enter Your Name',
                              //   focusedBorder: UnderlineInputBorder(
                              //     borderSide: BorderSide(
                              //       color: cBlack, // Focused border color
                              //       width: 1.5,
                              //     ),
                              //   ),
                              // ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: cGrayOld.withOpacity(0.2),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                hintText: 'Full Name',
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
                                  return 'Name Cannot Be Empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //---------------Email----------------
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: SizedBox(
                            child: TextFormField(
                              key: const ValueKey("email"),
                              controller: _emailController,
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
                                hintText: 'Email',
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
                                  return 'Email Cannot Be Empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //---------------NAME----------------
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: SizedBox(
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
                                hintText: 'Username',
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
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
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
                                  filled: true,
                                  fillColor: cGrayOld.withOpacity(0.2),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  hintText: 'Password',
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
                                        size: 20,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 14),
                          child: SizedBox(
                            //height: 32,
                            child: TextFormField(
                              key: const ValueKey("cpassword"),
                              controller: _cPasswordController,
                              obscureText: _obscureTextConfirmPassword,
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
                                  hintText: 'Re-Enter the Password',
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
                                        _obscureTextConfirmPassword =
                                            !_obscureTextConfirmPassword;
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Iconify(
                                        _obscureTextConfirmPassword
                                            ? Mdi.eye_off
                                            : Mdi.eye,
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

                        const SizedBox(height: 50), // 10% space
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
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
                                },
                                child: const Text(
                                  'Create an Account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: cWhite,
                                  ),
                                ),
                              ),
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
