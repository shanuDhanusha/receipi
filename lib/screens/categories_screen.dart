import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),

      child: GridView(
        //padding:EdgeInsets.all(10),
          gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:300,
              childAspectRatio:3/2,
              crossAxisSpacing:20,
              mainAxisSpacing:20
          ),
         children:DUMMY_CATEGORY.map((catData){
             return CategoryItem(id: catData.id,title:catData.title, color:catData.color);
         }).toList()
      ),
    );
  }
}
