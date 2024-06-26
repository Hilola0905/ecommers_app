import 'package:ecommers_app/screens/tabs/category/category__screen.dart';
import 'package:ecommers_app/screens/tabs/product/product_screen.dart';
import 'package:ecommers_app/screens/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/tab_view_model.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    CategoryScreen(),
    ProductScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabViewModel>().getIndex,
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: "Category",
            activeIcon: Icon(
              Icons.category_sharp,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: "Products",
            activeIcon: Icon(
              Icons.check_box_outline_blank,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(
              Icons.person,
            ),
          )
        ],
      ),
    );
  }
}
