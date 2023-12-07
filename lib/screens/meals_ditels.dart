import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
   static const routeMealDetailScreen="/meal-details";

   Widget sectionTitle(BuildContext ctx,String title){
     return Container(
       margin: const EdgeInsets.symmetric(vertical: 10),
       child: Text(
          title ,
          style: const TextStyle(
             fontFamily:"Raleway",
             fontSize: 25
         ),
       ),
     );
   }

   Widget buildContainer(BuildContext ctx,Widget child){
     return Container(
         decoration: BoxDecoration(
         color: Colors.white,
         border:Border.all(color: Colors.green),
         borderRadius: BorderRadius.circular(10)
          ),
         margin: EdgeInsets.all(10),
         padding: EdgeInsets.all(10),
         width: 300,
         height: 250,
       child:child
     );
   }

  @override
  Widget build(BuildContext context) {
    final Map routeData=ModalRoute.of(context)?.settings.arguments as Map<String,Object>;
    final String id=routeData["id"].toString();
    final filterData=DUMMY_MEALS.firstWhere((meal) =>meal.id==id );
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).primaryColor,
        title: Text(
          filterData.title,
          style: const TextStyle(
              color: Colors.white,
            fontSize: 20
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
             Container(
               height: 300,
               width:double.infinity,
               child:Image.network(
                   filterData.imageUrl,
                   fit: BoxFit.cover,
               ) ,
             ),
            sectionTitle(context,"Ingredients"),
            buildContainer(context,
               ListView.builder(itemBuilder:(ctx,index){
                return Card(
                   color: Theme.of(context).canvasColor,
                   child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                       filterData.ingredients[index]
                    ),
                  ),
        
                );
              },itemCount: filterData.ingredients.length,),
            ),
            sectionTitle(context,"Steps"),
            buildContainer(context,
              ListView.builder(itemBuilder:(ctx,index){
                 return Column(
                     children:[
                       ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink[200],
                        child: Text("#${index+1}"),
                         ),
                         title: Text(filterData.steps[index]),
                        ),
                       const Divider(color: Colors.green,)
                     ]
                 );
              },itemCount: filterData.steps.length,),

            )
          ],
        ),
      )
    );
  }
}
