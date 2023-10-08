import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';

import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favourites;

  const FavouriteScreen(this.favourites, {super.key});

  @override
  Widget build(BuildContext context) {

    if(favourites.isEmpty)
      {
        return const Center(
          child: Text("You have no favorites yet - Start adding some (⁠◍⁠•⁠ᴗ⁠•⁠◍⁠)⁠❤"),
        );
      }
    else
      {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favourites[index].id,
              imgUrl: favourites[index].imgUrl,
              title: favourites[index].title,
              duration: favourites[index].duration,
              complexity: favourites[index].complexity,
              affordability: favourites[index].affordability,
            );
          },
          itemCount: favourites.length,
        );
      }

  }
}
