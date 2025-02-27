import 'package:flutter/material.dart';
import 'package:testingscreens/screens/email_verification_screen.dart';
import 'package:testingscreens/screens/home_screen.dart';
import 'package:testingscreens/screens/login_screen.dart';
import 'package:testingscreens/screens/signup_screen.dart';
import 'package:testingscreens/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrustPoint',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginPage.id: (context) => const LoginPage(),
        SignupPage.id: (context) => const SignupPage(),
        EmailVerificationScreen.id: (context) => const EmailVerificationScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
