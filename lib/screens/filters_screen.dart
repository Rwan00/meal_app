import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';


import '../widgets/app_bar.dart';

class FilterScreen extends ConsumerWidget {
  static const routeName = '/filters';

  const FilterScreen({super.key});

  
 

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filterMealsProvider);
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
                  activeFilters[Filters.glutenFree]!,
                  (newValue) {
                    ref
                        .read(filterMealsProvider.notifier)
                        .setFilter(Filters.glutenFree, newValue);
                  },
                ),
                buildSwitchListTile(
                  context,
                  "Lactose-Free",
                  "Only include lactose-free meals",
                  activeFilters[Filters.lactoseFree]!,
                  (newValue) {
                    ref
                        .read(filterMealsProvider.notifier)
                        .setFilter(Filters.lactoseFree, newValue);
                  },
                ),
                buildSwitchListTile(
                  context,
                  "Vegan-Free",
                  "Only include vegan-free meals",
                  activeFilters[Filters.vegan]!,
                  (newValue) {
                    ref
                        .read(filterMealsProvider.notifier)
                        .setFilter(Filters.vegan, newValue);
                  },
                ),
                buildSwitchListTile(
                  context,
                  "Vegetarian-Free",
                  "Only include vegetarian-free meals",
                  activeFilters[Filters.vegeterian]!,
                  (newValue) {
                    ref
                        .read(filterMealsProvider.notifier)
                        .setFilter(Filters.vegeterian, newValue);
                  },
                ),
              ],
            ),
          ),
        ],
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
