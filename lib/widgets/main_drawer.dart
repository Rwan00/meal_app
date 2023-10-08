import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up!",
                style: Theme.of(context).textTheme.titleMedium),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(context,"Meal",Icons.restaurant_outlined,'/'),
          buildListTile(context,"Filters",Icons.settings_suggest_outlined,FilterScreen.routeName),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context,String title, IconData icon, String tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap:() => Navigator.of(context).pushReplacementNamed(tapHandler),
    );
  }
}
