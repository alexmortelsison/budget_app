import 'package:budget_app/components/logo.dart';
import 'package:budget_app/components/my_button.dart';
import 'package:budget_app/components/my_textfield.dart';
import 'package:budget_app/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void moveToWelcomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => moveToWelcomeScreen(),
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
          SizedBox(height: 16),
          MyTextfield(
            hintText: 'Email',
            obscureText: false,
            controller: null,
          ),
          MyTextfield(
            hintText: 'Password',
            obscureText: true,
            controller: null,
          ),
          SizedBox(height: 24),
          MyButton(
            name: "Login",
            onTap: () {},
            horizontal: 47,
          ),
        ],
      ),
    );
  }
}
