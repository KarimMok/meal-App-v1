import 'package:flutter/material.dart';
import 'package:mealapp/module/meal.dart';
import 'package:mealapp/screens/categoryScreen.dart';
import 'package:mealapp/screens/favorite.dart';
import 'package:mealapp/widget/drawer.dart';

// ignore: must_be_immutable
class TabScreen extends StatefulWidget {
  final List<Meal> froriteMeal;
  TabScreen(this.froriteMeal);

  @override
  _TabScreen_state createState() => _TabScreen_state();
}

// ignore: camel_case_types
class _TabScreen_state extends State<TabScreen> {
   List<Map> page =[] ;

  @override
  void initState() {
    page = [
      {'page': CategoriesScreen(), 'title': 'Categories Meal'},
      {'page': Favorite(widget.froriteMeal), 'title': 'Favorite'}
    ];
    super.initState();
  }

  int _selectedItem = 0;

  void _selectedPage(value) {
    setState(() {
      _selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page[_selectedItem]['title'].toString()),
      ),
      body: page[_selectedItem]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        //  backgroundColor: Colors.indigo[900],
        // to change the color we shoulddefine the current index
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedItem,
        elevation: 8,
        type: BottomNavigationBarType.shifting,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categories',
            backgroundColor: Colors.indigo[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favorites',
            backgroundColor: Colors.deepOrangeAccent[400],
          ),
        ],
      ),
      drawer: MainDrawed(),
    );
  }
}
