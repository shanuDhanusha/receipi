import 'screens/bottom_screen.dart';
import 'screens/category_meals_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/meals_ditels.dart';
import 'screens/tabs_screen.dart';
import 'screens/filter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229,1),
        fontFamily:"Raleway",
       // textTheme: ThemeData.light().textTheme.copyWith()
      ),
       initialRoute: "/",
       routes: {
        "/":(ctx)=>const MyHomePage(),
         categoryMealsScreen.routeName:(ctx)=>categoryMealsScreen(),
         MealDetailScreen.routeMealDetailScreen:(ctx)=>MealDetailScreen(),
         FilterScreen.filterScreen:(ctx)=>FilterScreen()

       },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar:AppBar(
      //   backgroundColor: Colors.pinkAccent,
      //   title: const Text(
      //       "Foods",style: TextStyle(color:Colors.white,fontSize: 18),
      //   ),
      // ),
      body:TabScreen()
    );
  }
}

