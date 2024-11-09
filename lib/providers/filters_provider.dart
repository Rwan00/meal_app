import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void setFilters(Map<Filters,bool> choosenFilters) {
    state = choosenFilters;
  }
  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterMealsProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());
