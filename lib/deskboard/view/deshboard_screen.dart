import 'package:flutter/material.dart';
import 'package:snap_kart/cart/view/cart_screen.dart';
import 'package:snap_kart/category/view/category_screen.dart';
import 'package:snap_kart/product/view/product_screen.dart';
import 'package:snap_kart/profile/view/profile_screen.dart';

class DeskBoardScreen extends StatefulWidget {
  const DeskBoardScreen({super.key});

  @override
  State<DeskBoardScreen> createState() => _DeskBoardScreenState();
}

class _DeskBoardScreenState extends State<DeskBoardScreen> {
  List<Widget> screen = [
    ProductScreen(),
    CategoryScreen(),
    ProfileScreen(),
    CartScreen()
  ];
  int currentIndex = 0;

  void onItemTapped(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: currentIndex,
      children: screen,
    );
  }

  Widget bottomBar() {
    return BottomNavigationBar(
      elevation: 0,backgroundColor: Colors.grey.shade300,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.production_quantity_limits,
            ),
            label: 'Product'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
            ),
            label: 'Account'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Cart"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onItemTapped,
    );
  }
}
