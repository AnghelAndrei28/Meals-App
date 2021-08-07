import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return Center(
          child: Text('You have no favorites yet'),
        );
    }
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            imageUrl: favoriteMeals[index].imageUrl,
            id: favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,
      );
  }
}
