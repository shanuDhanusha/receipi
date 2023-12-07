import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meals_ditels.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int  duration;
  final Complexity complexity;
  final Affordability affordability;

   MealItem({
     required this.id,
     required this.title,
     required this.imageUrl,
     required this.duration,
     required this.complexity,
     required this.affordability
    });


   String get complex{
     if(complexity==Complexity.Simple){
       return "Simple";
     }
     if(complexity==Complexity.values){
       return "Values";
     }
     if(complexity==Complexity.Hard){
       return "Hard";
     }
     return "";
   }

   String get afforbil{

     if(affordability==Affordability.values){
       return "Value";
     }
     if(affordability==Affordability.Pricey){
       return "Pricey";
     }
     if(affordability==Affordability.Affordable){
       return "Afforble";
     }

     return "";
   }
// \don't use yet
  void selectMeal(BuildContext ctx){
      Navigator.of(ctx).pushNamed(
          MealDetailScreen.routeMealDetailScreen,
          arguments:{
            "id":id
          }
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectMeal(context),
      child:Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                ),
                  child:Image.network(
                    imageUrl,
                    height: 250,
                    width:double.infinity,
                    fit: BoxFit.cover,
                  )
                ),
                Positioned(
                  bottom:30,
                  right: 20,
                  child:Container(
                    width: 300,
                    color: Colors.black26,
                    padding: EdgeInsets.only(left: 10,bottom: 10),
                    child: Text(title,style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
             Container(
                 decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius:BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15))
               ),
               child: Padding(
                  padding:EdgeInsets.all(20),
                 child:Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.schedule),
                          const SizedBox(width: 6,),
                          Text("$duration min")
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work),
                          const SizedBox(width: 6,),
                          Text(complex)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.money_off),
                          const SizedBox(width: 6,),
                          Text(afforbil)
                        ],
                      )
                    ],
                 ),
                           ),
             )
          ],
        ),
      ),
    );

  }
}
