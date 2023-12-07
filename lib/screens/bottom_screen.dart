
import '/screens/favorites_screen.dart';
import '/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';


class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  final List<Widget> _page=[
    categoryMealsScreen(),
    const FavoriteScreen()

  ];
  int _selectectPageIndex=0;
  void _selectTab(int index){
     setState(() {
         _selectectPageIndex=index;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_page[0],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectTab ,
        backgroundColor: Colors.green,
        items: const [
           BottomNavigationBarItem(icon: Icon(
             Icons.work,
             color: Colors.white,
           ),
             label:"Category"
           ),
          BottomNavigationBarItem(icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
            label: "Favorite"
          )
        ],
      ),
    );
  }
}
