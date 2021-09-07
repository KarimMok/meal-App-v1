import 'package:flutter/material.dart';
import 'package:mealapp/screens/categoryMealScreen.dart';

class CategoriesItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color color;

  CategoriesItem(this.id, this.title, this.color);

  //we should create function to switch into category meal Screen
  //when we tap on the inkwell

  void selectedcategory(BuildContext ctx) {
    Navigator.pushNamed(ctx, CategoryMealScreen.routeName,arguments: {
      'id':id,
      'title':title

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectedcategory(context),
      // for animation tap on the Ikwel .
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(8),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.5), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
