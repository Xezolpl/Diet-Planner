import 'package:diet_planner/model/portion_size.dart';
import 'package:flutter/material.dart';

import '../outline_border_text_field.dart';
import 'portions_view.dart';
import '../units_dropdown_button.dart';

class PortionRecord extends StatelessWidget {
  final PortionSize portionSize;
  final PortionsViewState parent;

  const PortionRecord(this.portionSize, this.parent, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          OutlineBorderTextField(
              initValue: portionSize.name,
              readOnly: (portionSize.option != PortionSizeOptions.CUSTOM)),
          SizedBox(
            width: 30,
          ),
          OutlineBorderTextField(
              initValue:
                  '${portionSize.value.keys.first}${portionSize.value.values.first}'),
          UnitsDropdownButton(['ml', 'g']),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.grey),
            onPressed: () {
              parent.portionAction(portionSize.option, false, portionSize);
            },
          )
        ],
      ),
    );
  }
}
