import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snkr_flutter/screen/login/login_screen.dart';
import 'package:snkr_flutter/screen/registration/registration_screen.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class LoginOrRegistrationScreen extends StatefulWidget {
  const LoginOrRegistrationScreen({super.key});

  @override
  State<LoginOrRegistrationScreen> createState() =>
      _LoginOrRegistrationScreenState();
}

class _LoginOrRegistrationScreenState extends State<LoginOrRegistrationScreen> {
  bool? isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    //_getDataFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: cWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/icons/main_logo.png',
                        height: 200,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cBlack.withOpacity(0.1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Login to an Account",
                      style: fBlackSemiBold16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cBlack.withOpacity(0.5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      " Create an Account ",
                      style: fWhiteSemiBold16,
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
