import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'modules/meal.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false
    };

    final meals = ref.watch(mealsProvider);

    List<Meal> _availableMeal = meals;
    final List<Meal> _favouriteMeals = [];

    void _toggleFavourite(String mealId) {
      final existingIndex =
          _favouriteMeals.indexWhere((meal) => meal.id == mealId);

      if (existingIndex >= 0) {
        setState(() {
          _favouriteMeals.removeAt(existingIndex);
        });
      } else {
        setState(() {
          _favouriteMeals
              .add(meals.firstWhere((meal) => meal.id == mealId));
        });
      }
    }

    void _setFilters(Map<String, bool> filterData) {
      setState(() {
        _filters = filterData;

        _availableMeal = meals.where((meal) {
          if (_filters['gluten'] == true && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] == true && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] == true && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] == true && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      });
    }

    bool _isMealFavourite(String mealId) {
      return _favouriteMeals.any((meal) => meal.id == mealId);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(247, 164, 164, 1),
          secondary: const Color.fromRGBO(254, 190, 140, 1),
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        useMaterial3: false,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(182, 226, 161, 1),
              ),
              bodySmall: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                color: Color.fromRGBO(60, 72, 107, 1.0),
              ),
              titleLarge: const TextStyle(
                fontSize: 25,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
              titleMedium: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
      ),
      routes: {
        '/': (context) => TabScreen(_favouriteMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FilterScreen.routeName: (context) => FilterScreen(_filters, _setFilters)
      },
    );
  }

  /* EasySplashScreen buildEasySplashScreen() {
    return EasySplashScreen(
      logo: Image.asset("assets/images/meals/loading.jpg"),
      logoWidth: 170,
      showLoader: true,
      loadingText: const Text("Loading.."),
      navigator: TabScreen(_favouriteMeals),
      durationInSeconds: 3,
      backgroundColor: const Color.fromRGBO(249, 234, 213, 1.0),
      title: const Text(
        "Welcome Back",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  } */
}
