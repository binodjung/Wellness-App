import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellness_app/passwords/verification_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            /// Adding a Logo
            SizedBox(
              height: 100,
              child: Image.asset("assets/logo.png"), //  adding a logo
            ),
            const SizedBox(height: 20),

            /// adding a  text
            const Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            /// Enter Email Label
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter Email Address",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),

            /// In TextField, adding text
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// adding text  Back to Sign In
            Opacity(
              opacity: 0.6,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // navigate back to sign in
                },
                child: const Text(
                  "Back to Sign In",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// Send Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  //  Navigate to verification page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VerificationPage(),
                    ),
                  );
                },
                child: const Text(
                  "Send",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// OR text
            const Text(
              "or",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            /// Social Media Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook,
                      size: 32, color: Colors.blue),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram,
                      size: 32, color: Colors.purple),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp,
                      size: 32, color: Colors.green),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
