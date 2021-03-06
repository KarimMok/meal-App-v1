import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/module/meal.dart';
import 'package:mealapp/screens/categoryMealScreen.dart';
//import 'package:mealapp/screens/categoryScreen.dart';
import 'package:mealapp/screens/detailsOfMeal.dart';
import 'package:mealapp/screens/filtring.dart';
import 'package:mealapp/screens/tabScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarien': false
  };
  List<Meal> _availbleMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  //verify if the the existe in favorite and deleted
  void _toggleFavoriteMeal(String mealId) {
    final indexmeal =
        _favoriteMeal.indexWhere((element) => element.id == mealId);
    // the meal existe // indexwhere return -1 if the condition false
    if (indexmeal >= 0) {
      setState(() {
        _favoriteMeal.removeAt(indexmeal);
      });
    } else {
      setState(() {
        print('add');
        _favoriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  //------------------------------------
  //if the meal existe in favorite to change the icon type
  bool _isFavorite(String mealId) {
    return _favoriteMeal.any((element) => mealId == element.id);
  }

//--------------------------------------------------------
  // fitring the list of meal
  void _setFilter(Map<String, bool> _filterData) {
    setState(() {
      _filter = _filterData;
      if (_filter['gluten'] == false &&
          _filter['lactose'] == false &&
          _filter['vegan'] == false &&
          _filter['vegetarien'] == false) {
        _availbleMeals = DUMMY_MEALS;
      } else {
        _availbleMeals = _availbleMeals.where((meal) {
          if ((_filter['gluten'] == true) && (meal.isGlutenFree == false)) {
            return false;
          }
          if (_filter['lactose'] == true && meal.isLactoseFree == false)
            return false;
          if (_filter['vegan'] == true && meal.isVegan == false) return false;
          if (_filter['vegetarien'] == true && meal.isVegetarian == false)
            return false;
          //print(_filter['gluten']);
          return true;
        }).toList();
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'best food',
      theme: ThemeData(
          //the default color en the app
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(0, 255, 240, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(200, 211, 255, .6)),
              bodyText2: TextStyle(color: Color.fromRGBO(200, 211, 255, .6)),
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))),

      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favoriteMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availbleMeals),
        MealsDetail.routeName: (context) =>
            MealsDetail(_toggleFavoriteMeal, _isFavorite),
        Filtering.routeName: (context) => Filtering(_filter, _setFilter),
      },

      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
  
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Meal App"),
//       ),
//       body:,
//        // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
