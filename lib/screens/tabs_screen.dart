import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meal_app/providers/navbar_provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';

import 'favourite_screen.dart';

class TabScreen extends ConsumerWidget {
  static String routeName = "Tab Screen";

  const TabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List pages = [
      {'page': const CategoriesScreen(), 'title': "Meals Categories"},
      {'page': const FavouriteScreen(), 'title': "Your Favourites"}
    ];
    final selectedIndex = ref.watch(navBarProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[selectedIndex]['title'],
        ),
        flexibleSpace: const AppBarCustom(),
        centerTitle: true,
      ),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor.withOpacity(0.3),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              blurRadius: 9,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              onTabChange: (newIndex) {
                ref.read(navBarProvider.notifier).selectPage(newIndex);
                
              },
              gap: 10,
              activeColor: Colors.pink.withOpacity(0.4),
              color: Colors.white,
              tabShadow: <BoxShadow>[
                BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    blurRadius: 5)
              ],
              tabBorder: Border.all(color: Colors.white),
              tabActiveBorder:
                  Border.all(color: Colors.deepOrangeAccent.withOpacity(0.3)),
              duration: const Duration(milliseconds: 800),
              tabBorderRadius: 15,
              tabBackgroundColor:
                  Theme.of(context).canvasColor.withOpacity(0.3),
              iconSize: 25,
              curve: Curves.bounceInOut,
              tabs: <GButton>[
                GButton(
                  icon: selectedIndex == 0
                      ? Icons.fastfood_rounded
                      : Icons.fastfood_outlined,
                  text: "Categories",
                ),
                GButton(
                  icon: selectedIndex == 1
                      ? Icons.favorite
                      : Icons.favorite_border,
                  text: "Favorite",
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
