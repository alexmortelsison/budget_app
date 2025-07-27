import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function()? onTap;
  const MyButton({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
