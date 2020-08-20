import 'package:diet_planner/model/meal.dart';
import 'package:diet_planner/model/product.dart';
import 'package:flutter/material.dart';
import 'package:diet_planner/util/xdatetime.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  final Meal meal;

  const ProductPage(this.product, this.meal, {Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(product, meal);
}

class _ProductPageState extends State<ProductPage> {
  final Product product;
  final Meal meal;

  _ProductPageState(this.product, this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Form(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Name', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 20),
                  Expanded(child: getBasicTextField())
                ],
              ),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  child: Text('Sizes', style: TextStyle(fontSize: 18))),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.glassWhiskey,
                                size: 14,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Glass', style: TextStyle(fontSize: 15)),
                            ]),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.utensilSpoon,
                                size: 14,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Spoon', style: TextStyle(fontSize: 15)),
                            ]),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.handPaper,
                                size: 14,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Handful', style: TextStyle(fontSize: 15)),
                            ]),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.question,
                                size: 14,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Custom', style: TextStyle(fontSize: 15)),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

getBasicTextField() => TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(),
      ),
    );
