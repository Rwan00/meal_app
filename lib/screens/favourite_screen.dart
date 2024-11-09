import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../providers/favorites_provider.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends ConsumerWidget {
  

  const FavouriteScreen( {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final favourites = ref.watch(favoriteMealsProvider);

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
