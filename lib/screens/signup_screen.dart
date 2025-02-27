import 'package:flutter/material.dart';
import '../customs/custom_text_field.dart';
import 'login_screen.dart';
import 'email_verification_screen.dart';


class SignupPage extends StatefulWidget {
  static const String id = 'signuppage';

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      height: screenHeight * 0.15,
                    ),
                  ),
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
                  _buildLabel('First Name'),
                  CustomTextField(
                    hintText: "Enter your first name",
                    keyboardType: TextInputType.text,
                    controller: _firstNameController,
                  ),
                  _buildLabel('Last Name'),
                  CustomTextField(
                    hintText: "Enter your last name",
                    keyboardType: TextInputType.text,
                    controller: _lastNameController,
                  ),
                  _buildLabel('Email'),
                  CustomTextField(
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  _buildLabel('Phone Number'),
                  CustomTextField(
                    hintText: "Enter your phone number",
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                  ),
                  _buildLabel('Password'),
                  _buildPasswordField(_passwordController),
                  _buildLabel('Re-Enter Password'),
                  _buildPasswordField(_confirmPasswordController),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        backgroundColor: const Color.fromRGBO(6, 125, 25, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, EmailVerificationScreen.id);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(6, 125, 25, 1),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildPasswordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Enter your password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}