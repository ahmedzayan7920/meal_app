import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routeArgs['id'];
    final catTitle = routeArgs['title'];
    final catMeals = dummyMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("$catTitle"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            catMeals[index].imageUrl,
            catMeals[index].id,
            catMeals[index].categories,
            catMeals[index].title,
            catMeals[index].ingredients,
            catMeals[index].steps,
            catMeals[index].duration,
            catMeals[index].complexity,
            catMeals[index].affordability,
            catMeals[index].isGlutenFree,
            catMeals[index].isLactoseFree,
            catMeals[index].isVegan,
            catMeals[index].isVegetarian,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
