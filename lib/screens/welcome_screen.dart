import 'package:flutter/material.dart';
import 'package:testingscreens/screens/signup_screen.dart';

import '../customs/slanted_clipper.dart';
import 'login_screen.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          /// **🔹 Logo & Title at the Top**
          Positioned(
            top: screenHeight * 0.08,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: screenHeight * 0.22,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Trustpoint',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          /// **✅ Slanted Green Container Takes the Full Bottom Area**
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: SlantedContainerClipper(), // Custom Clipper
              child: Container(
                height: screenHeight * 0.6,
                width: double.infinity,
                color: const Color.fromRGBO(6, 125, 25, 1),
                // Green Background
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// **Login Button**
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(6, 125, 25, 1),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.white),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.018,
                          horizontal: screenWidth * 0.25,
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    /// **Sign Up Button**
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignupPage.id);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
