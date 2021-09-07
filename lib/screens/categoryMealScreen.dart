import 'package:flutter/material.dart';
//import 'package:mealapp/widget/categorie.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categoryMealScreen';
  @override
  _MealScreen createState() => _MealScreen();
}

// Scrren wich have reciept of the meal
class _MealScreen extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    // we recive the arguments
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String?, String?>;
    //final categoryID = routeArg["id"];
    final categoryTitle = routeArg["title"];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: null,
    );
  }
}
