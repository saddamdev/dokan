import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'product_screen.dart';
import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final items = [
    Icon(Icons.home_outlined),
    Icon(Icons.person_outline),
  ];
  final screens = [
    ProductScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(index == 0 ? 'Product List' : 'My Account'),
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFFe0f7fa),
        buttonBackgroundColor: Color(0xFF80deea),
        backgroundColor: Colors.transparent,
        height: 64,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
