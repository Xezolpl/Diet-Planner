import 'package:diet_planner/model/meal.dart';
import 'package:diet_planner/model/product.dart';
import 'package:flutter/material.dart';
import 'package:diet_planner/util/xdatetime.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PortionSizeOptions { GLASS, SPOON, HANDFUL, CUSTOM }

extension XPortionSizeOptions on PortionSizeOptions {
  String get name {
    switch (this) {
      case PortionSizeOptions.GLASS:
        return 'Glass';
      case PortionSizeOptions.SPOON:
        return 'Spoon';
      case PortionSizeOptions.HANDFUL:
        return 'Handful';
      case PortionSizeOptions.CUSTOM:
        return 'Custom';
    }
  }

  Map<int, String> get defaultValue {
    switch (this) {
      case PortionSizeOptions.GLASS:
        return {250: 'ml'};
      case PortionSizeOptions.SPOON:
        return {5: 'g'};
      case PortionSizeOptions.HANDFUL:
        return {30: 'g'};
      case PortionSizeOptions.CUSTOM:
        return {25: 'g'};
    }
  }
}

class PortionSize {
  final String name;
  final Map<int, String> value;

  PortionSize({@required this.name, @required this.value});
}

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

  Container sizesList = Container();
  List<PortionSize> sizes = [];

  _ProductPageState(this.product, this.meal);

  @override
  void initState() {
    super.initState();
  }

  void _sizesOptionOnTap([PortionSizeOptions sizeOption]) {
    setState(() {
      if (sizeOption != null) {
        sizes.add(
            PortionSize(name: sizeOption.name, value: sizeOption.defaultValue));
      }
      sizesList = Container(
        margin: EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        height: (sizes.length * 58.0),
        child: Column(
            children: sizes
                .map((e) => Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          getOutlineBorderTextField(
                              initValue: e.name,
                              readOnly: sizeOption == PortionSizeOptions.CUSTOM
                                  ? false
                                  : true),
                          SizedBox(
                            width: 30,
                          ),
                          getOutlineBorderTextField(
                              initValue:
                                  '${e.value.keys.first}${e.value.values.first}'),
                          IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                sizes.remove(e);
                                _sizesOptionOnTap();
                              }),
                        ],
                      ),
                    ))
                .toList()),
      );
    });
  }

  Widget getOutlineBorderTextField({
    Function(String) onChanged,
    String initValue = '',
    bool readOnly = false,
  }) =>
      Expanded(
        child: Container(
          height: 35,
          child: TextField(
            readOnly: readOnly,
            onChanged: onChanged,
            controller: TextEditingController(text: initValue),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      );

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
                          onTap: () {
                            _sizesOptionOnTap(PortionSizeOptions.GLASS);
                          },
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
                          onTap: () {
                            _sizesOptionOnTap(PortionSizeOptions.SPOON);
                          },
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
                          onTap: () {
                            _sizesOptionOnTap(PortionSizeOptions.HANDFUL);
                          },
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
                          onTap: () {
                            _sizesOptionOnTap(PortionSizeOptions.CUSTOM);
                          },
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
                ),
                sizesList,
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, bottom: 3),
                  child: Text('Nutrition',
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
                      product.nutrition.copyWith(kcal: value.toInt());
                    }),
                LabelWithTextFieldRow(
                    label: 'Carbohydrates',
                    units: ['g'],
                    needed: true,
                    onChanged: (double value) {
                      product.nutrition.copyWith(carbohydrates: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Sugars',
                    units: ['g'],
                    indent: 30,
                    onChanged: (double value) {
                      product.nutrition.copyWith(sugars: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Proteins',
                    units: ['g'],
                    needed: true,
                    onChanged: (double value) {
                      product.nutrition.copyWith(proteins: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Fats',
                    units: ['g'],
                    needed: true,
                    onChanged: (double value) {
                      product.nutrition.copyWith(fats: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Saturated',
                    units: ['g'],
                    indent: 30,
                    onChanged: (double value) {
                      product.nutrition.copyWith(saturated: value);
                    }),
                LabelWithTextFieldRow(
                    label: 'Salt',
                    units: ['g'],
                    onChanged: (double value) {
                      product.nutrition.copyWith(salt: value);
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
                              product.nutrition
                                  .copyWith(monounsaturated: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Poliunsaturated',
                            units: ['g'],
                            indent: 30,
                            onChanged: (double value) {
                              product.nutrition
                                  .copyWith(poliunsaturated: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Omega 3',
                            units: ['g'],
                            indent: 60,
                            onChanged: (double value) {
                              product.nutrition.copyWith(omega3: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'ALA',
                            units: ['g'],
                            indent: 90,
                            onChanged: (double value) {
                              product.nutrition.copyWith(ala: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'EPA',
                            units: ['g'],
                            indent: 90,
                            onChanged: (double value) {
                              product.nutrition.copyWith(epa: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'DHA',
                            units: ['g'],
                            indent: 90,
                            onChanged: (double value) {
                              product.nutrition.copyWith(dha: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Omega 6',
                            units: ['g'],
                            indent: 60,
                            onChanged: (double value) {
                              product.nutrition.copyWith(omega6: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Fibre',
                            units: ['g'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(fibre: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Cholesterol',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(cholesterol: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Caffeine',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(caffeine: value);
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
                              product.nutrition.copyWith(vitaminA: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin C',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminC: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin D',
                            units: ['IU', 'µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminD: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin E',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminE: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin K',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminK: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B1',
                            hint: '(Thiamin)',
                            units: ['µg', 'mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB1: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B2',
                            hint: '(Riboflavin)',
                            units: ['µg', 'mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB2: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B3',
                            hint: '(Niacin, PP)',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB3: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Choline',
                            hint: '(Vitamin B4)',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB4: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B5',
                            hint: '(Pantothenic acid)',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB5: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B6',
                            hint: '(Pyridoxine)',
                            units: ['µg', 'mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB6: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B7',
                            hint: '(Biotin)',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB7: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Folic Acid',
                            hint: '(Vitamin B9)',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB9: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Vitamin B12',
                            hint: '(Cobalamin)',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(vitaminB12: value);
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        LabelWithTextFieldRow(
                            label: 'Sodium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(sodium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Potassium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(potassium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Calcium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(calcium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Magnesium',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(magnesium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Phosphorous',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(phosphorous: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Iron',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(iron: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Copper',
                            units: ['mg', 'µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(copper: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Zinc',
                            units: ['mg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(zinc: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Fluorine',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(fluorine: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Selenium',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(selenium: value);
                            }),
                        LabelWithTextFieldRow(
                            label: 'Iodine',
                            units: ['µg'],
                            onChanged: (double value) {
                              product.nutrition.copyWith(iodine: value);
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

class LabelWithTextFieldRow extends StatefulWidget {
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
  State<StatefulWidget> createState() =>
      LabelWithTextFieldRowState(label, hint, units, indent, needed, onChanged);
}

class LabelWithTextFieldRowState extends State<LabelWithTextFieldRow> {
  final String label, hint;
  final List<String> units;
  final double indent;
  final bool needed;
  final Function(double) onChanged;

  String selectedUnit;

  LabelWithTextFieldRowState(this.label, this.hint, this.units, this.indent,
      this.needed, this.onChanged)
      : selectedUnit = units.first;

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
                onChanged: (value) {
                  onChanged((double.parse(value) * 10).truncate() / 10);
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              padding: EdgeInsets.only(left: 5),
              width: 55,
              height: 35,
              child: units.length == 1
                  ? Text(units[0])
                  : DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedUnit,
                        onChanged: (value) {
                          setState(() {
                            selectedUnit = value;
                          });
                        },
                        items: units
                            .map<DropdownMenuItem<String>>(
                                (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ))
                            .toList(),
                      ),
                    )),
        ],
      ),
    );
  }
}
