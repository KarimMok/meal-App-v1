import 'package:flutter/material.dart';
import 'package:mealapp/module/meal.dart';
import 'package:mealapp/screens/detailsOfMeal.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? imageUrl;
  final String? title;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;

  const MealItem(
      {@required this.id,
      @required this.imageUrl,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});
  // to convert the enum to String text
  String get complxityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Enknow';
    }
  }

  //-------------------------------
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Luxurious:
        return 'Luxurious';

      case Affordability.Pricey:
        return 'Pricey';

      default:
        return 'Enknow';
    }
  }

  Widget? mealImg() {
    if (imageUrl != null)
      return Image.network(
        this.imageUrl.toString(),
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    else
      return CircularProgressIndicator(
        color: Colors.black,
      );
  }

  //switsh into meal Details we need ID arguments to make différences
  void selectedMeal(BuildContext ctx) {
    Navigator.pushNamed(ctx, MealsDetail.routeName,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    print(complexity.toString());
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(14),
        child: Column(
          children: [
            Stack(
              children: [
                // to cut the image as the card reduis top
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: mealImg(),
                ),
                Positioned(
                  bottom: 15,
                  right: 2,
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 3),
                    color: Colors.black.withOpacity(.6),
                    width: 250,
                    child: Text(
                      title.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text(
                        duration.toString() + 'min ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(width: 6),
                    Text(
                      complxityText, // from the get methode
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text(
                      affordabilityText,
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
