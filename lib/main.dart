import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';



import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';


void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final availableMeal = ref.watch(filtersProvider);

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
        TabScreen.routeName: (context) => const TabScreen(),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeal),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routeName: (context) => const FilterScreen()
      },
      home: buildEasySplashScreen(),
    );
  }

  EasySplashScreen buildEasySplashScreen() {
    return EasySplashScreen(
      logo: Image.asset("assets/images/meals/loading.jpg"),
      logoWidth: 170,
      showLoader: true,
      loadingText: const Text("Loading.."),
      navigator: const TabScreen(),
      durationInSeconds: 3,
      backgroundColor: const Color.fromRGBO(249, 234, 213, 1.0),
      title: const Text(
        "Welcome Back",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
