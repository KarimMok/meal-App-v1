import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealsDetail extends StatelessWidget {
  static final routeName = '/MealDetails';

  Widget buildTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // we recive the id frome meale screen from the arguments
    final meailId = ModalRoute.of(context)!.settings.arguments as String;
    // weshould filtre the list od dUMMY meal

    // firstewhere => return the first element finded
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == meailId);

    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            // buil title widget function 
            buildTitle(context,'Ingrediants'),
        // ingrediant --------------------
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  //  border: Border.all(color:Colors.grey ),
                  borderRadius: BorderRadius.circular(15)),
      
              // margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              width: 300,
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text(
                      ' - ' + selectedMeal.ingredients![index],
                      style: TextStyle(color: Colors.black,fontSize: 18),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients!.length,
              ),
            ),
            SizedBox(height: 15,),
            Divider(color: Colors.brown,),
            buildTitle(context,'Steps'),

           // steps ----------------------
           Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  //  border: Border.all(color:Colors.grey ),
                  borderRadius: BorderRadius.circular(15)),
      
              // margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.symmetric(vertical:8),
              width: 300,
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                      // color: Theme.of(context).accentColor,
                      // child: Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      leading: CircleAvatar(
                        
                        child: Text('${index+1}'),
                        backgroundColor: Colors.purple[900],
                        
                      ),
                         title: Text(
                          selectedMeal.steps![index],
                          style: TextStyle(color: Colors.black,fontSize: 19),
                        ),
                      ),
                      Divider(color: Colors.grey,)
                  ],
                ),
               
                itemCount: selectedMeal.steps!.length,
                
              ),
              
             ),
             // end of screen 
           SizedBox(height: 15,),
            Divider(color: Colors.brown,),
            

          ],
        ),
      ),
    );
  }
}
