import 'package:diet_planner/model/portion_size.dart';
import 'package:flutter/material.dart';

import 'portions_view.dart';

class SinglePortionSelector extends StatelessWidget {
  final PortionSizeOptions portionSizeOption;
  final PortionsViewState parent;
  final bool isSelected;

  SinglePortionSelector(
      {@required this.portionSizeOption,
      @required this.parent,
      @required this.isSelected,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Pre-radius setting
    BorderRadius bRadius = BorderRadius.circular(0);
    if (portionSizeOption == PortionSizeOptions.GLASS) {
      bRadius = BorderRadius.only(
          topLeft: Radius.circular(15), bottomLeft: Radius.circular(15));
    } else if (portionSizeOption == PortionSizeOptions.CUSTOM) {
      bRadius = BorderRadius.only(
          topRight: Radius.circular(15), bottomRight: Radius.circular(15));
    }
    //Widget
    return Expanded(
      child: GestureDetector(
        onTapDown: (_) {
          parent.portionAction(portionSizeOption, true);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green[100] : Colors.white,
            borderRadius: bRadius,
          ),
          padding: EdgeInsets.all(2),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              portionSizeOption.iconData,
              size: 14,
            ),
            SizedBox(width: 3),
            Text(
              portionSizeOption.name,
              style: TextStyle(fontSize: 15),
            )
          ]),
        ),
      ),
    );
  }
}

class PortionsDivider extends StatelessWidget {
  const PortionsDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 2,
      height: 50,
      child: VerticalDivider(
        color: Colors.grey,
        thickness: 2,
      ),
    );
  }
}
