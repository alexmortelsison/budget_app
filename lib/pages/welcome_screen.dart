import 'package:budget_app/components/logo.dart';
import 'package:budget_app/components/my_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(height: 32),
            MyButton(
              name: 'Login',
              onTap: () {},
            ),
            SizedBox(height: 12),
            MyButton(
              name: 'Register',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
