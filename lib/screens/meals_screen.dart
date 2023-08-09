import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.title,
  });

  final List<Meal> meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    // content when have no meals
    Widget screenContentWithNoMeals = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // center the content
        children: [
          Text(
            'Oh no! .... It Seems Empty!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'There are no meals in this category. Try to select the other categories',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.76),
                  fontSize: 18,
                ),
          ),
        ],
      ),
    );

    // content when have meals

    // optimizedly show list of content for having long list
    Widget screenContentWithMeals = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return Text(
          meals[index].title,
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isEmpty ? screenContentWithNoMeals : screenContentWithMeals,
    );
  }
}
