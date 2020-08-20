import 'package:diet_planner/model/meal.dart';
import 'package:diet_planner/model/nutrition.dart';
import 'package:diet_planner/model/product.dart';
import 'package:diet_planner/presentation/meal_products/meal_product_card.dart';
import 'package:diet_planner/presentation/widgets/ads.dart';
import 'package:diet_planner/util/navigator.dart';
import 'package:flutter/material.dart';
import 'package:diet_planner/util/xdatetime.dart';

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
          appBar: AppBar(
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 32,
                ),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                  icon: Icon(
                    Icons.add_circle,
                    size: 32,
                  ),
                ),
              ),
            ],
            toolbarHeight: 70,
            title: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${meal.name}',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${meal.date.printAdverbOfTimeOrDate()}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
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
                adUrl: 'https://blueidea.pl/images/bg33333.jpg',
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
