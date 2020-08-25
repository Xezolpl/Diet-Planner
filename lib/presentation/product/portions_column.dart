import 'package:diet_planner/model/portion_size.dart';
import 'package:flutter/material.dart';

import 'outline_border_text_field.dart';

class PortionsColumn extends StatefulWidget {
  final List<PortionSize> portionsList;

  PortionsColumn(this.portionsList, {Key key}) : super(key: key);

  @override
  _PortionsColumnState createState() => _PortionsColumnState(portionsList);
}

class _PortionsColumnState extends State<PortionsColumn> {
  List<PortionSize> portionsList;

  _PortionsColumnState(this.portionsList);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        height: (portionsList.length * 58.0),
        child: Column(
            children: portionsList
                .map((portionSize) => Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          OutlineBorderTextField(
                              initValue: portionSize.name,
                              readOnly: (portionSize.option !=
                                  PortionSizeOptions.CUSTOM)),
                          SizedBox(
                            width: 30,
                          ),
                          OutlineBorderTextField(
                              initValue:
                                  '${portionSize.value.keys.first}${portionSize.value.values.first}'),
                          IconButton(
                            icon: Icon(Icons.cancel, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                portionsList.remove(portionSize);
                              });
                            },
                          )
                        ],
                      ),
                    ))
                .toList()));
  }
}
