import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../widgets/app_bar.dart';

class FilterScreen extends ConsumerStatefulWidget {
  static const routeName = '/filters';

  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filterMealsProvider);
    _glutenFree = activeFilters[Filters.glutenFree]!;
    _lactoseFree = activeFilters[Filters.lactoseFree]!;
    _vegan = activeFilters[Filters.vegan]!;
    _vegetarian = activeFilters[Filters.vegeterian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        flexibleSpace: const AppBarCustom(),
        centerTitle: true,
      ),
      body: PopScope(
        onPopInvoked: (_) async {
          ref.read(filterMealsProvider.notifier).setFilters({
            Filters.glutenFree : _glutenFree,
            Filters.lactoseFree : _lactoseFree,
            Filters.vegan:_vegan,
            Filters.vegeterian :_vegetarian,
          });
        },
        child: Column(
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
      ),
      drawer: const MainDrawer(),
      
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
