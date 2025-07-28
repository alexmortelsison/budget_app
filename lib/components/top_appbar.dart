import 'package:flutter/material.dart';

class TopAppbar extends StatelessWidget {
  final String imageUrl;
  final String name;
  const TopAppbar({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      backgroundColor: const Color.fromARGB(255, 38, 70, 39),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  imageUrl,
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
