import 'package:diet_planner/domain/entities/product.dart';
import 'package:flutter/material.dart';

class MealProductCard extends StatefulWidget {
  final Product product;

  const MealProductCard({@required this.product, Key key}) : super(key: key);

  @override
  _MealProductCardState createState() => _MealProductCardState(product);
}

class _MealProductCardState extends State<MealProductCard> {
  final Product product;
  FocusNode checkboxFocusNode;

  bool isProductChecked = false;

  _MealProductCardState(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Image.asset(
                getAssetPathForCategory(product.category),
                width: 32,
                height: 32,
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name}',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${product.weight}g',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          '${product.nutrition.kcal} kcal',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Checkbox(
                focusNode: checkboxFocusNode,
                value: isProductChecked,
                onChanged: (value) {
                  setState(() {
                    isProductChecked = value;
                  });
                },
              ),
              SizedBox(
                width: 8,
              )
            ],
          )),
    );
  }
}

String getAssetPathForCategory(String category) {
  String name = '';
  switch (category) {
    case 'fruit':
      name = 'apple';
      break;
    case 'none':
    case '':
      name = 'none';
      break;
  }
  return 'assets/png/food/$name.png';
}
