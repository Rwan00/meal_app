import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/modules/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  void toggleFavourite(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      // state.remove(meal);
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      //state.add(meal);
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
