import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import 'drawer_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:Scaffold(
          appBar:AppBar(
            backgroundColor:Colors.pinkAccent,
            title: const Text(
              "Meals",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ) ,
            bottom:const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.category,color: Colors.white,),
                  child: Text("Category",style: TextStyle(color: Colors.white),),
                ),
               Tab(
                 icon:Icon(Icons.no_food,color: Colors.white,) ,
                child: Text("Favorites",style: TextStyle(color: Colors.white),),
               )
            ]
            ),
          ),
          drawer:const DrawerNavigation(),
          body: TabBarView(
               children: [
                 CategoriesScreen(),
                 const FavoriteScreen()

               ],
          ),
        )
    );
  }
}
