import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meal_app/modules/meal.dart';

import '../widgets/app_bar.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';

import 'favourite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favourite;



  const TabScreen(this.favourite, {super.key});

  @override
  State<StatefulWidget> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
   List? _pages ;

   @override
  void initState() {
    super.initState();
    _pages =  [
      {'page': const CategoriesScreen(), 'title': "Meals Categories"},
      {'page':  FavouriteScreen(widget.favourite), 'title': "Your Favourites"}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages![_selectedIndex]['title'],
        ),
        flexibleSpace: const AppBarCustom(),
        centerTitle: true,
      ),
      body: _pages![_selectedIndex]['page'],
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
                setState(() {
                  _selectedIndex = newIndex;
                });
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
                  icon: _selectedIndex == 0
                      ? Icons.fastfood_rounded
                      : Icons.fastfood_outlined,
                  text: "Categories",
                ),
                GButton(
                  icon: _selectedIndex == 1
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
