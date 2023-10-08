import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
        ),
        children: dummyCategories.map((catData) {
          return CategoryItem(
            id: catData.id,
            title: catData.title,
            imgUrl: catData.imgUrl,
          );
        }).toList(),
      ),
    );
  }
}
