import 'package:flutter/material.dart';
import 'package:mealapp/widget/drawer.dart';

class Filtering extends StatefulWidget {
  static final routeName = '/Filtring';

  final Function saveFilter;
  final Map currenteFilter;
  
  Filtering(this.currenteFilter, this.saveFilter);

  @override
  _FilteringState createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
//curentfilter
//      'gluten': false,
//     'lactose': false,
//     'vegan': false,
//     'vegetarien': false

  @override
  void initState() {
    _glutenFree = widget.currenteFilter['gluten'];
    _lactoseFree = widget.currenteFilter['lactose'];
    _vegan = widget.currenteFilter['vegan'];
    _vegetarian = widget.currenteFilter['vegetarien'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My filtres'),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarien': _vegetarian
                };

                widget.saveFilter(selectedFilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTile('Gluten FREE',
                  'Only include the Gluten_free Meals', _glutenFree, (val) {
                setState(() {
                  _glutenFree = val;
                });
              }),
              //-----------------------------------------------
              _buildSwitchTile('Lactose FREE',
                  'Only include the Lactose-Free Meals', _lactoseFree, (val) {
                setState(() {
                  _lactoseFree = val;
                  print(_lactoseFree);
                });
                //-----------------------------
              }),
              _buildSwitchTile('Vegan', 'Only include the Vegan Meals', _vegan,
                  (val) {
                setState(() {
                  _vegan = val;
                });
                //--------------------------------
              }),
              _buildSwitchTile('Vegetarien',
                  'Only include the Vegetarien Meals', _vegetarian, (val) {
                setState(() {
                  _vegetarian = val;
                });
              })
            ],
          )),
        ],
      ),
      drawer: MainDrawed(),
    );
  }

// Switch tile builder
  Widget _buildSwitchTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: (value) {
        updateValue(value);
      },
    );
  }
}
