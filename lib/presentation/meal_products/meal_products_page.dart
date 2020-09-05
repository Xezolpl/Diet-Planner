import 'package:diet_planner/model/meal.dart';
import 'package:diet_planner/model/nutrition.dart';
import 'package:diet_planner/model/product.dart';
import 'package:diet_planner/presentation/meal_products/meal_product_card.dart';
import 'package:diet_planner/presentation/widgets/ads.dart';
import 'package:diet_planner/presentation/widgets/meal_date_appbar.dart';
import 'package:diet_planner/util/navigator.dart';
import 'package:flutter/material.dart';

class MealProductsPage extends StatefulWidget {
  const MealProductsPage(this.meal, {Key key}) : super(key: key);
  final Meal meal;
  @override
  State<StatefulWidget> createState() => _MealProductsPageState(meal);
}

class _MealProductsPageState extends State<MealProductsPage> {
  final Meal meal;
  TextEditingController _searchController;

  _MealProductsPageState(this.meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: getMealDateAppBar(
            context,
            meal,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    navigateToProductPage(context, Product.empty(), meal);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search for the products',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onChanged: (value) {
                    _filterProducts(value);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    final product = Product(
                        id: 'id',
                        name: 'Jabłko czerwone',
                        category: 'fruit',
                        nutrition: Nutrition(372, 50, 12.5, 14.3),
                        weight: 100);
                    return GestureDetector(
                        onTap: () {
                          navigateToProductPage(context, product, meal);
                        },
                        child: MealProductCard(product: product));
                  },
                ),
              ),
              BottomAdPlayer(
                adUrl: '',
              ),
            ],
          )),
    );
  }

  void _filterProducts(String filter) {}

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
