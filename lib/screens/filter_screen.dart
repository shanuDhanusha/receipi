import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const filterScreen="/filter-screen";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegen=false;

   Widget _switchBuilderList(BuildContext context,String title,String description,bool value,Function update){
      return SwitchListTile(
        value:value,
        onChanged:(bol)=>update(bol),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.black
          ),
        ),
        subtitle: Text(
           description
        ),

      );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         //leading: const IconButton(Icons.arrow_back,color: Colors.white,onPressed: (),),
         backgroundColor:Colors.pink,
          title: const Text(
              "Your Filters",
             style: TextStyle(
                fontSize: 18,
               fontFamily: "Raleway",
               color: Colors.white
             ),
          ),
         actions:[
             IconButton(
                 onPressed:(){

                 },
                 icon:Icon(Icons.save,color: Colors.white,)
             )
         ],
       ),
       body:Column(
         children: [
           Container(
             padding: EdgeInsets.all(20),
             child: const Text("Adjust your meals selection!",
               style: TextStyle(fontSize: 20,color: Colors.black),
             ),
           ),
           Expanded(
               child:ListView(
                   children: [
                      _switchBuilderList(
                          context,"Gluten-free",
                          "only gluten free meals"
                          ,_glutenFree,(newValue){
                         setState(() {
                             _glutenFree=newValue;
                         });
                      }),
                     _switchBuilderList(
                         context,"Lactose-free",
                         "only lactose free meals"
                         ,_vegen,(newValue){
                       setState(() {
                         _vegen=newValue;
                       });
                     }),
                     _switchBuilderList(
                         context,"Vegetarian",
                         "only vegetarian meals"
                         ,_vegetarian,(newValue){
                       setState(() {
                         _vegetarian=newValue;
                       });
                     }),

                   ],
               )
           )
         ],
       )
    );
  }
}
