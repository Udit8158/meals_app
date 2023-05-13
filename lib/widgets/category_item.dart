import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryItemData,
  });

  final Category categoryItemData;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(16),
      shadowColor: categoryItemData.categoryBgColor
          .withOpacity(.8), // Set the desired shadow color

      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                categoryItemData.categoryBgColor.withOpacity(0.5),
                categoryItemData.categoryBgColor.withOpacity(0.9),
              ],
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              categoryItemData.categoryName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
