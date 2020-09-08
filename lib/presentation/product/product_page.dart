import 'package:diet_planner/domain/entities/meal.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/presentation/product/portions/portions_view.dart';

import 'package:diet_planner/presentation/widgets/units_dropdown_button.dart';
import 'package:diet_planner/presentation/widgets/meal_date_appbar.dart';
import 'package:flutter/material.dart';

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
  bool isProductDetailsWidgetVisible = false;
  _ProductPageState(this.product, this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMealDateAppBar(context, meal),
      body: Form(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: ListView(
              children: [
                Row(
                  children: [
                    Text('Name', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 20),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(),
                      ),
                    ))
                  ],
                ),
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    child: Text('Sizes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ))),
                PortionsView(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, bottom: 3),
                  child: Text('nutrients',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
                Divider(
                  thickness: 2,
                ),
                LabelWithTextFieldRow(
                    label: 'Energy value',
                    units: ['kcal'],
                    needed: true,
                    onChanged: (double value) {
                      product.nutrients.copyWith(kcal: value.toInt());
                    }),
                LabelWithTextFieldRow(
                    label: 'Carbohydrates',
                    units: ['g'],
                    needed: true,
                    onChanged: (double value) {
                      product.nutrients.copyWith(carbohydrates: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Sugars',
                    units: ['g'],
                    indent: 30,
                    onChanged: (double value) {
                      product.nutrients.copyWith(sugars: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Proteins',
                    units: ['g'],
                    needed: true,
                    onChanged: (double value) {
                      product.nutrients.copyWith(proteins: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Fats',
                    units: ['g'],
                    needed: true,
                    onChanged: (double value) {
                      product.nutrients.copyWith(fats: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Saturated',
                    units: ['g'],
                    indent: 30,
                    onChanged: (double value) {
                      product.nutrients.copyWith(saturated: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Salt',
                    units: ['g'],
                    onChanged: (double value) {
                      product.nutrients.copyWith(salt: value);
                    }),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                    color: Colors.green,
                    shape: BeveledRectangleBorder(
                        side: BorderSide(color: Colors.green[600])),
                    //borderSide: BorderSide(color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        isProductDetailsWidgetVisible =
                            !isProductDetailsWidgetVisible;
                      });
                    },
                    child: Text('Fill more specific info ▼',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600))),
                Visibility(
                    visible: isProductDetailsWidgetVisible,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Fats',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        LabelWithTextFieldRow(
                            label: 'Monounsaturated',
                            units: ['g'],
                            indent: 30,
                            onChanged: (double value) {
                              product.nutrients
                                  .copyWith(monounsaturated: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Poliunsaturated',
                            units: ['g'],
                            indent: 30,
                            onChanged: (double value) {
                              product.nutrients
                                  .copyWith(poliunsaturated: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Omega 3',
                            units: ['g'],
                            indent: 60,
                            onChanged: (double value) {
                              product.nutrients.copyWith(omega3: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'ALA',
                            units: ['g'],
                            indent: 90,
                            onChanged: (double value) {
                              product.nutrients.copyWith(ala: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'EPA',
                            units: ['g'],
                            indent: 90,
                            onChanged: (double value) {
                              product.nutrients.copyWith(epa: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'DHA',
                            units: ['g'],
                            indent: 90,
                            onChanged: (double value) {
                              product.nutrients.copyWith(dha: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Omega 6',
                            units: ['g'],
                            indent: 60,
                            onChanged: (double value) {
                              product.nutrients.copyWith(omega6: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Fibre',
                            units: ['g'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(fibre: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Cholesterol',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(cholesterol: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Caffeine',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(caffeine: value);
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        LabelWithTextFieldRow(
                            label: 'Vitamin A',
                            hint: '(Retinol)',
                            units: ['µg', 'mg', 'IU'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminA: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin C',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminC: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin D',
                            units: ['IU', 'µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminD: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin E',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminE: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin K',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminK: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B1',
                            hint: '(Thiamin)',
                            units: ['µg', 'mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB1: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B2',
                            hint: '(Riboflavin)',
                            units: ['µg', 'mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB2: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B3',
                            hint: '(Niacin, PP)',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB3: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Choline',
                            hint: '(Vitamin B4)',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB4: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B5',
                            hint: '(Pantothenic acid)',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB5: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B6',
                            hint: '(Pyridoxine)',
                            units: ['µg', 'mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB6: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B7',
                            hint: '(Biotin)',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB7: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Folic Acid',
                            hint: '(Vitamin B9)',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB9: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B12',
                            hint: '(Cobalamin)',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(vitaminB12: value);
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        LabelWithTextFieldRow(
                            label: 'Sodium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(sodium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Potassium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(potassium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Calcium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(calcium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Magnesium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(magnesium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Phosphorous',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(phosphorous: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Iron',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(iron: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Copper',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(copper: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Zinc',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(zinc: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Fluorine',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(fluorine: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Selenium',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(selenium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Iodine',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrients.copyWith(iodine: value);
                            }),
                      ],
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LabelWithTextFieldRow extends StatelessWidget {
  final String label, hint;
  final List<String> units;
  final double indent;
  final bool needed;
  final Function(double) onChanged;

  const LabelWithTextFieldRow(
      {@required this.label,
      this.hint = '',
      this.units = const [''],
      this.indent = 0,
      this.needed = false,
      @required this.onChanged,
      Key key})
      : assert(units != null && units.length > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: indent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            indent > 0 ? FontWeight.w400 : FontWeight.w500),
                  ),
                  Text(needed ? '*' : '', style: TextStyle(color: Colors.red)),
                ],
              ),
              Text(hint, style: TextStyle(color: Colors.grey))
            ],
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
              width: 100,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //TODO IF value IS A NUM CUZ USER STILL CAN TYPE THERE NORMAL STRINGS
                  onChanged((double.parse(value) * 10).round() / 10);
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              )),
          SizedBox(
            width: 10,
          ),
          UnitsDropdownButton(units),
        ],
      ),
    );
  }
}
