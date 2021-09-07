import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widget/categorie.dart';

class CategoriesScreen extends StatelessWidget {
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Meal app"),),
      body: GridView(
        padding: EdgeInsets.all(12),
          children: DUMMY_CATEGORIES.map((catData)=>
              CategoriesItem(catData.id,catData.title,catData.color)
          
          ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 205,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
