import 'package:flutter/material.dart';
import 'package:mealapp/screens/categoryMealScreen.dart';
import 'package:mealapp/screens/categoryScreen.dart';

void main()=>  runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(20, 255, 255, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1:TextStyle(
              color: Color.fromRGBO(200, 211, 255, .6)
            ),
            bodyText2:TextStyle(
              color: Color.fromRGBO(200, 211, 255, .6)
            ),
            headline1:TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ) 
          )
      ),
      
      //home: CategoriesScreen(),
      
      routes: {
        '/':(context)=>CategoriesScreen(),
        CategoryMealScreen.routeName:(context)=>CategoryMealScreen()

      },

      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body:null,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
