import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widget/meal.dart';
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
    final categoryID = routeArg["id"];
    final categoryTitle = routeArg["title"];
    // we filtre the liste of Meal and return the Meal corespand of the category id
    final categorieMeal = DUMMY_MEALS.where((element) {
      return element.categories!.contains(categoryID);
    }).toList();
    //  print(categorieMeal.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              imageUrl: categorieMeal[index].imageUrl,
              title: categorieMeal[index].title,
              duration: categorieMeal[index].duration,
              complexity: categorieMeal[index].complexity,
              affordability: categorieMeal[index].affordability);
        },
        itemCount: categorieMeal.length,
      ),
    );
  }
}
