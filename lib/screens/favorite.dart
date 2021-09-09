import 'package:flutter/material.dart';
import 'package:mealapp/module/meal.dart';
import 'package:mealapp/widget/meal.dart';

// ignore: must_be_immutable
class Favorite extends StatelessWidget {
  List<Meal> favorite;
  Favorite(this.favorite);

  @override
  Widget build(BuildContext context) {
    if (favorite.isEmpty) {
      return Scaffold(
        body: Center(
            child: Text(
          "faavorite",
          style: TextStyle(color: Colors.black),
        )),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favorite[index].id,
            imageUrl: favorite[index].imageUrl,
            title: favorite[index].title,
            duration: favorite[index].duration,
            complexity: favorite[index].complexity,
            affordability: favorite[index].affordability,
          //  removItem: () {},
          );
        },
        itemCount: favorite.length,
      );
    }
  }
}
