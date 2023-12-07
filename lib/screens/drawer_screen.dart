import 'filter_screen.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  Widget selectDrawerOption(String option,IconData icon ,Function selecterPage){
      return ListTile(
           leading: Icon(icon,color: Colors.pink,size: 30,),
           title: Text(
               option,
             style: const TextStyle(
                fontSize: 20,
                fontFamily: "Raleway",
                color: Colors.black
             ),
           ),
            horizontalTitleGap: 15,
            selectedColor: Colors.green,
            onTap:()=>selecterPage()
        
      );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 300,
       clipBehavior: Clip.antiAlias,
       elevation: 3,
       child: Column(
         children: [
           Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25,top: 70),
             decoration: const BoxDecoration(
                color: Colors.amber,
             ),
             child: const Text(
                 "Cooking Up!",
               style: TextStyle(
                 fontFamily:"Raleway",
                 fontSize: 35,
                 color: Colors.white
               ),
             ),
           ),
           const SizedBox(height: 40,),
           selectDrawerOption(
             "Meals",
             Icons.cookie,
               (){
                 Navigator.of(context).pushNamed("/");
               }
           ),
           SizedBox(),
           selectDrawerOption(
               "Filter",
               Icons.settings,
               (){
                 Navigator.of(context).pushNamed(FilterScreen.filterScreen);
               }
           ),
         ],
       ),
    );
  }
}
