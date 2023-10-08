import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

import '../modules/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  const MealItem({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.hard:
        return "Hard";
      case Complexity.challenging:
        return "Challenging";
      default:
        return "UnKnown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      case Affordability.pricey:
        return "Expensive";
      default:
        return "UnKnown";
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      /*if (result != null) {
        removeItem(result);
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    Color clr = const Color.fromRGBO(255, 235, 235, 1.0);
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        shadowColor: const Color.fromRGBO(222, 18, 6, 1),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imgUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          clr.withOpacity(0.7),
                          //clr,
                          const Color.fromRGBO(254, 190, 140, 0.5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodySmall,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.browse_gallery_outlined),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(complexityText == "Simple"
                          ? Icons.auto_awesome_outlined
                          : complexityText == "Hard"
                              ? Icons.all_inclusive
                              : Icons.auto_graph),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(affordabilityText == "Affordable"
                          ? Icons.handshake_outlined
                          : affordabilityText == "Expensive"
                              ? Icons.monetization_on_outlined
                              : Icons.auto_fix_high),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
