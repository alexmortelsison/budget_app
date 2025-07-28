import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 18,
      color: const Color.fromARGB(255, 38, 70, 39),
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.home_outlined,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.savings_outlined,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(width: 40),
          Icon(
            Icons.monetization_on_outlined,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
