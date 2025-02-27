import 'package:flutter/material.dart';
import '../customs/custom_text_field.dart';
import '../customs/social_login_button.dart';
import 'email_verification_screen.dart';
import 'signup_screen.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool obscurePassword = true;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.06),
                  Center(
                    child: Image.asset(
                      'images/logo.png',
                      height: screenHeight * 0.22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Trustpoint',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  const Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Enter your password",
                    obscureText: obscurePassword,
                    controller: passwordController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                        backgroundColor: const Color.fromRGBO(6, 125, 25, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, EmailVerificationScreen.id);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignupPage.id);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(6, 125, 25, 1),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(6, 125, 25, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _socialLoginSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _socialLoginSection() {
    return Center(
      child: Column(
        children: [
          SocialLoginButton(
            imagePath: 'images/google.png',
            text: "Login with Google",
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SocialLoginButton(
            imagePath: 'images/facebook.png',
            text: "Login with Facebook",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}