import 'package:budget_app/components/my_button.dart';
import 'package:budget_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("lib/assets/logo.json"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Budget",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "App",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              MyTextfield(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              SizedBox(height: 8),
              MyTextfield(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 8),
              MyButton(
                name: 'Login',
                onTap: () {},
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Not a member yet?",
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Sign up now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
