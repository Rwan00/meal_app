import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../modules/meal.dart';
import '../widgets/app_bar.dart';



class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen(this.availableMeals,{super.key});

  final List<Meal> availableMeals;
  static const routeName = 'category_meals';

  

  
  @override
  Widget build(BuildContext context) {
    String? categoryTitle;

  List<Meal>? categoryMeals;
  final routeArg =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title']!;
    categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        flexibleSpace: const AppBarCustom(),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals![index].id,
            imgUrl: categoryMeals[index].imgUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
