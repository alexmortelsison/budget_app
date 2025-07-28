import 'package:budget_app/components/bottom_navbar.dart';
import 'package:budget_app/components/top_appbar.dart';
import 'package:budget_app/pages/login_page.dart';
import 'package:budget_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> logout() async {
    final AuthService authService = AuthService();
    try {
      await authService.signout();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
            side: BorderSide(
              strokeAlign: 10,
              color: const Color.fromARGB(255, 38, 70, 39),
              width: 3,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 48,
            color: const Color.fromARGB(255, 38, 70, 39),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavbar(),
      body: CustomScrollView(
        slivers: [
          TopAppbar(imageUrl: "lib/assets/google.png", name: "Alex Sison"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              fontSize: 24,
                              letterSpacing: -0.99,
                            ),
                          ),
                          Text(
                            "¥287,000",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: SimpleCircularProgressBar(
                          size: 60,
                          progressStrokeWidth: 10,
                          backStrokeWidth: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
