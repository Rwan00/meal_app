import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../modules/meal.dart';
import '../widgets/app_bar.dart';



class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen(this.availableMeals,{super.key});

  final List<Meal> availableMeals;
  static const routeName = 'category_meals';

  @override
  State<StatefulWidget> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String? categoryTitle;
  List<Meal>? categoryMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArg =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title']!;
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }


  /*void _removeMeal(String mealId) {
    setState(() {
      categoryMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        flexibleSpace: const AppBarCustom(),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals![index].id,
            imgUrl: categoryMeals![index].imgUrl,
            title: categoryMeals![index].title,
            duration: categoryMeals![index].duration,
            complexity: categoryMeals![index].complexity,
            affordability: categoryMeals![index].affordability,
          );
        },
        itemCount: categoryMeals!.length,
      ),
    );
  }
}
