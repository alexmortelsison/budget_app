import 'package:budget_app/components/my_button.dart';
import 'package:budget_app/components/my_textfield.dart';
import 'package:budget_app/pages/home_page.dart';
import 'package:budget_app/pages/signup_page.dart';
import 'package:budget_app/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void moveToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Inside your _LoginPageState class in lib/pages/login_page.dart

  Future<void> handleLogin() async {
    // Make sure it's async
    // Input Validation
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Text(
              "Please enter your email",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
      return; // Stop execution if validation fails
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Text(
              "Please enter your password",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
      return; // Stop execution if validation fails
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false, // User must wait
      builder: (context) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );

    try {
      AuthService authService =
          AuthService(); // Create an instance of your AuthService
      await authService.loginWithEmailAndPassword(
        // Call the login method from your AuthService
        emailController.text,
        passwordController.text,
      );

      // Dismiss loading indicator on success
      // Check if the dialog is still open before trying to pop it
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }

      // Show success message (optional, but good user feedback)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Text(
              "Logged in successfully!",
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      // Navigate to HomePage on successful login
      // Use pushReplacement to replace the current page in the stack
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Dismiss loading indicator on error
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }

      // Handle Firebase-specific errors and provide user-friendly messages
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else if (e.code == 'too-many-requests') {
        message = 'Too many failed login attempts. Please try again later.';
      } else {
        message =
            'Login failed: ${e.message}'; // Generic fallback for other Firebase errors
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      // Dismiss loading indicator for any other unexpected errors
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }

      // Handle any other general errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Text(
              'An unexpected error occurred during login.',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
      print(
        'Unexpected error during login: $e',
      ); // Print full error to console for debugging
    }
  }

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
                onTap: () => handleLogin(),
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
                      GestureDetector(
                        onTap: moveToSignUp,
                        child: Text(
                          "Sign up now",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      height: 40,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text("or"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      height: 40,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => handleLogin(),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset("lib/assets/google.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
