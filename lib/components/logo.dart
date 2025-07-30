import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "lib/assets/logo.json",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Budget",
              style: TextStyle(
                fontSize: 32,
                letterSpacing: -0.9,
                color: Colors.green,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "App",
              style: TextStyle(
                fontSize: 32,
                letterSpacing: -0.9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Text(
          "Your go to app for savings.",
          style: TextStyle(letterSpacing: -0.99),
        ),
      ],
    );
  }
}
