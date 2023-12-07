import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
   CategoryItem({
    required this.id, 
    required this.title,
    required this.color
  });
//page route by this function 
   void categoryScreen(BuildContext ctx){
     Navigator.of(ctx).pushNamed(categoryMealsScreen.routeName,arguments: {
         "id":id,
         "title":title,
         "color":color
     });
   }
//....   

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:()=>categoryScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
           borderRadius: BorderRadius.circular(15)
        ),
        child: Text(title,
          style: const TextStyle(
            fontSize:15,
            color:Colors.black
        ),
        ),
      ),
    );
  }
}
