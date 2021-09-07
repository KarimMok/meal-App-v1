import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color color;

  CategoriesItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(8),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          
          gradient: LinearGradient(
            colors:[color.withOpacity(.5),
              color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight 
           ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
