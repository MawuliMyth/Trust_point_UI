import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:testingscreens/screens/home_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const String id = 'email_verification_screen';

  const EmailVerificationScreen({super.key});

  void _showVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Verification Successful'),
        content: const Text('Your email has been successfully verified.'),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route)=> false);
              }, // No functionality, UI only
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(6, 125, 25, 1),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 370,
              height: 166,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'A Verification Code Has Been Sent To Your Email, Log Into Your Email And Click The Code To Verify Your Account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 50),
            PinCodeTextField(
              length: 4,
              controller: otpController,
              keyboardType: TextInputType.number,
              appContext: context,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.grey.shade200,
                selectedFillColor: Colors.white,
                inactiveColor: Colors.black26,
                selectedColor: Colors.green,
                activeColor: Colors.green.shade800,
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showVerificationDialog(context), // Triggers popup
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(6, 125, 25, 1),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {}, // No functionality, UI only
                  child: const Text('Resend OTP'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
