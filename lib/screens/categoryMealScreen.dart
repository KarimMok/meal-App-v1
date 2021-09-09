import 'package:flutter/material.dart';
//import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/module/meal.dart';
//import 'package:mealapp/module/meal.dart';
import 'package:mealapp/widget/meal.dart';
//import 'package:mealapp/widget/categorie.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categoryMealScreen';
  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);
  @override
  _MealScreen createState() => _MealScreen();
}

// Scrren wich have reciept of the meal
class _MealScreen extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal> categorieMeal = [];

  // this function its same of init State
  @override
  void didChangeDependencies() {
    //??
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String?, String?>;
    final categoryID = routeArg["id"];
    categoryTitle = routeArg["title"];
    // we filtre the liste of Meal and return the Meal corespand of the category id
    //categorieMeal = DUMMY_MEALS.where((element) {
    categorieMeal = widget.availableMeal.where((element) {
    
      return element.categories!.contains(categoryID);
    }).toList();

    super.didChangeDependencies();
  }

  // fuction for removin meal item the will pass from the constructor of mail details .
  // void _removeMeal(String itemId) {
  //   setState(() {
  //     categorieMeal.removeWhere((element) => element.id == itemId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // we recive the arguments
    //  print(categorieMeal.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categorieMeal[index].id,
            imageUrl: categorieMeal[index].imageUrl,
            title: categorieMeal[index].title,
            duration: categorieMeal[index].duration,
            complexity: categorieMeal[index].complexity,
            affordability: categorieMeal[index].affordability,
           // removItem: _removeMeal,
          );
        },
        itemCount: categorieMeal.length,
      ),
    );
  }
}
