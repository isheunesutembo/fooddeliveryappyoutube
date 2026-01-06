import 'package:flutter/material.dart';
import 'package:fooddeliveryappyoutube/features/cart/screen/cart_screen.dart';
import 'package:fooddeliveryappyoutube/features/favourites/screen/favourite_screen.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';

import '../../../home/screens/home_screen.dart';
import '../../../settings/screen/settimgs_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIntex=0;
  void _onItemTap(int index){
    setState(() {
      selectedIntex=index;
    });
  }
  List<Widget>pages=[
    const HomeScreen(),
    const FavouriteScreen(),
    const CartScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: AppColor.primaryColor,
        currentIndex: selectedIntex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTap,
        items:const [
         
           BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Icon(Icons.home,
            color: Colors.black,
            size: 30,
            ),
            label: "Home"
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
            color: Colors.black,
            size: 30,),
            label: "Favourite"
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket,
            color: Colors.black,
            size: 30,
            ),
            label: "Cart"
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings,
            color: Colors.black,
            size: 30,),
label: "Settings"
          )
        ],
      ) ,
      body: pages[selectedIntex],
    );
  }
}