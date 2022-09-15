import 'package:flutter/material.dart';
import 'package:just_app/pages/favourite_screen.dart';
import 'package:just_app/pages/order.dart';

import 'pages/add_new_page.dart';
import 'pages/details.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  var currentIndex = 0;
  var pages = [
    FavouritePage(),
    const OrderPage(),
    DetailView(),
    AddNewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children:pages,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.details),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline),label: ''),
        ],
      ),
    );
  }
}
