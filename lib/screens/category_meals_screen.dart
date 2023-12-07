import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
class categoryMealsScreen extends StatelessWidget {
  static const routeName='/category-mels';

  @override
  Widget build(BuildContext context) {
    final Map<String,Object> ?routeArgs=ModalRoute.of(context)!.settings.arguments as Map<String,Object>?;
    final String ?title=routeArgs?["title"].toString();
    final String ?id=routeArgs?["id"].toString();
    // we can filter map  this code  ..........
    final categoryMeals=DUMMY_MEALS.where((mels){
      return mels.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString(),style: const TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:ListView.builder(itemBuilder: (ctx,index){
           return MealItem(
               id: categoryMeals[index].id,
               title:categoryMeals[index].title,
               imageUrl:categoryMeals[index].imageUrl,
               duration:categoryMeals[index].duration,
               complexity:categoryMeals[index].complexity,
               affordability:categoryMeals[index].affordability
           ) ;
      },itemCount:categoryMeals.length ,)
    );
  }
}
