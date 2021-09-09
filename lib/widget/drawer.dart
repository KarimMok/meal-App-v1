import 'package:flutter/material.dart';
import 'package:mealapp/screens/filtring.dart';

// ignore: must_be_immutable
class MainDrawed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15),
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
           buildListTile("Meal", Icons.restaurant, context),
          Divider(
            color: Colors.grey,
          ),
          buildListTile("Filters", Icons.settings, context),
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, BuildContext ctx) {
    return ListTile(
      onTap: () {
        if (title == 'Filters') {
          Navigator.pushReplacementNamed(ctx, Filtering.routeName);
        } else
          Navigator.pushReplacementNamed(ctx, '/');
      },
     // focusColor: color,
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(title,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoCondensed',
              fontSize: 18,
              fontWeight: FontWeight.bold)),
    );
  }
}
