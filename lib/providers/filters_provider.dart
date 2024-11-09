import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegan,
  vegeterian,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegan: false,
          Filters.vegeterian: false,
        });

  void setFilters(Map<Filters, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterMealsProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());

final filtersProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filterMealsProvider);
  return meals.where((meal) {
      if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filters.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
});
