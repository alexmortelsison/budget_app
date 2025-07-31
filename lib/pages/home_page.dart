import 'package:budget_app/components/bottom_navbar.dart';
import 'package:budget_app/components/top_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavbar(),
      body: Center(
        child: CustomScrollView(
          slivers: [
            TopAppbar(),
            SliverToBoxAdapter(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
