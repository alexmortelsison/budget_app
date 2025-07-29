import 'package:budget_app/components/logo.dart';
import 'package:budget_app/components/my_button.dart';
import 'package:budget_app/pages/login_page.dart';
import 'package:budget_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void moveToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void moveToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

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
              onTap: () => moveToLoginPage(),
              horizontal: 84,
            ),
            SizedBox(height: 12),
            MyButton(
              name: 'Register',
              onTap: () => moveToRegisterPage(),
              horizontal: 84,
            ),
          ],
        ),
      ),
    );
  }
}
