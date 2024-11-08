import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';

import '../widgets/app_bar.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavourite;
  final Function isMealFavourite;




  const MealDetailScreen(this.toggleFavourite, this.isMealFavourite,
      {super.key});

  static const routeName = 'meal_detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        flexibleSpace: const AppBarCustom(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  selectedMeal.imgUrl,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            buildText(context, "Ingredients"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 7,
                    shadowColor: Theme.of(context).colorScheme.secondary,
                    color: const Color.fromRGBO(182, 226, 161, 1),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: buildText(context, "Steps"),
            ),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Container(
                        color: const Color.fromRGBO(182, 226, 161, 0.3),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            foregroundColor: Colors.black,
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){toggleFavourite(mealId);},
        child: Icon(
            isMealFavourite(mealId) ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }

  Text buildText(BuildContext context, String txt) {
    return Text(
      txt,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget buildContainer(BuildContext context, Widget chi) {
    return Card(
      elevation: 7,
      shadowColor: Theme.of(context).colorScheme.secondary,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 330,
        height: 170,
        margin: const EdgeInsets.all(10),
        child: chi,
      ),
    );
  }
}
