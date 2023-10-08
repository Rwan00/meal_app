import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../widgets/app_bar.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;
  const FilterScreen(this.currentFilters,this.saveFilters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    super.initState();
     _glutenFree = widget.currentFilters['gluten']!;
     _lactoseFree = widget.currentFilters['lactose']!;
     _vegan = widget.currentFilters['vegan']!;
     _vegetarian = widget.currentFilters['vegetarian']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        flexibleSpace: const AppBarCustom(),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "• Adjust Your Meal Selection (⁠｡⁠◕⁠‿⁠◕⁠｡⁠).",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  context,
                  "Gluten-Free",
                  "Only include gluten-free meals",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  context,
                  "Lactose-Free",
                  "Only include lactose-free meals",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  context,
                  "Vegan-Free",
                  "Only include vegan-free meals",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  context,
                  "Vegetarian-Free",
                  "Only include vegetarian-free meals",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian
          };
          widget.saveFilters(selectedFilters);
        },
        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
        child: Icon(
          Icons.save,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }

  SwitchListTile buildSwitchListTile(BuildContext context, String title,
      String description, bool currentValue, Function(bool val) updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
