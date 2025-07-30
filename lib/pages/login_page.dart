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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(height: 16),
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 24),
            MyButton(
              name: "Login",
              onTap: () {},
              horizontal: 0,
            ),
            SizedBox(height: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Noy yet a member?"),
                    SizedBox(width: 2),
                    Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
