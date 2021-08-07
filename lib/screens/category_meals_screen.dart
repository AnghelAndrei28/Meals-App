import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreen createState() => _CategoryMealsScreen();
}

class _CategoryMealsScreen extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if(!_loadedInitData)
      {final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals;
      _loadedInitData = true;}
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            id: displayedMeals[index].id,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
