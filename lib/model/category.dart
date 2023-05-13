import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.categoryId,
    required this.categoryName,
    this.categoryBgColor = Colors.orange,
  });

  final String categoryId;
  final String categoryName;
  final Color categoryBgColor;
}
