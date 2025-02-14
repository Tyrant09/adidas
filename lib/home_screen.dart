import 'package:adidas/adiclub_screen.dart';
import 'package:adidas/favorite_screen.dart';
import 'package:adidas/search_screen.dart';
import 'package:adidas/shopping_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;

  final Map<int, Map<String, Widget>> _navigetionMap = {
    0: {"title": const Text("Home"), "screen": const HomeScreen()},
    1: {"title": const Text("Search"), "screen": const SearchScreen()},
    2: {"title": const Text("Favorite"), "screen": const FavoriteScreen()},
    3: {"title": const Text("Cart"), "screen": const ShoppingScreen()},
    4: {"title": const Text("Adiclub"), "screen": const AdiclubScreen()},
  };

  void onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SHOP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedindex,
          children: _navigetionMap.values
              .map((page) => page["screen"]!)
              .toList(), // แปลง Map เป็น List ของ Widget
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedindex,
          onTap: onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/logo.png", width: 30, height: 30),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/adiclub.png", width: 45, height: 45),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
