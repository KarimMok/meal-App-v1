import 'package:flutter/material.dart';
import 'package:mealapp/screens/categoryScreen.dart';
import 'package:mealapp/screens/favorite.dart';
import 'package:mealapp/widget/drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreen_state createState() => _TabScreen_state();
}

// ignore: camel_case_types
class _TabScreen_state extends State<TabScreen> {
  int _selectedItem = 0;
  List<Map> page = [
    {'page': CategoriesScreen(), 'title': 'Categories Meal'},
    {'page': Favorite(), 'title': 'Favorite'}
  ];

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
      drawer:MainDrawed(),
    );
  }
}
