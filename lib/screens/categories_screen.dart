import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/model/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // method to filter list
  List<Meal> filterMeals(String categoryId) {
    List<Meal> list = [];

    for (var element in dummyMeals) {
      if (element.categories.contains(categoryId)) {
        list.add(element);
      }
    }
    return list;
  }

  // select a category and go to the meals screen for that category
  void _selectCategory(BuildContext ctx, Category category) {
    Navigator.push(
      ctx,
      // Router function
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filterMeals(category.categoryId),
          title: category.categoryName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          ...availableCategories
              .map((category) => CategoryItem(
                    categoryItemData: category,
                    onPressCategoryItem: () {
                      _selectCategory(context, category);
                    },
                  ))
              .toList()
        ],
      ),
    );
  }
}
