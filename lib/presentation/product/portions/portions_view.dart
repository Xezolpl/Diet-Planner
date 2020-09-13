import 'package:diet_planner/domain/entities/portion_size.dart';
import 'package:flutter/material.dart';

import 'portions_record.dart';
import 'portions_selector.dart';

class PortionsView extends StatefulWidget {
  const PortionsView({Key key}) : super(key: key);

  @override
  PortionsViewState createState() => PortionsViewState();
}

class PortionsViewState extends State<PortionsView> {
  List<PortionSize> portionsList = [];
  List<Widget> portionsRecordList = [];

  SinglePortionSelector glassSelector, spoonSelector, handfulSelector;

  void portionAction(PortionSizeOptions option, bool isAdding,
      [PortionSize removedPortionSize]) {
    //If there is an element with that option in the list
    setState(() {
      if (option == PortionSizeOptions.CUSTOM) {
        isAdding
            ? portionsList.add(PortionSize(
                name: option.name, option: option, value: option.defaultValue))
            : portionsList.remove(removedPortionSize);
      }
      //If we are ading check there are no elements with that option
      // in (the option is unchecked) and there are no more than 5 elements total.
      // If we are deleting just !isAdding
      else if ((isAdding &&
              portionsList.where((e) => e.option == option).length == 0 &&
              portionsList.length <= 5) ||
          !isAdding) {
        switch (option) {
          case PortionSizeOptions.GLASS:
            glassSelector = SinglePortionSelector(
              portionSizeOption: PortionSizeOptions.GLASS,
              parent: this,
              isSelected: isAdding,
            );
            break;
          case PortionSizeOptions.SPOON:
            spoonSelector = SinglePortionSelector(
              portionSizeOption: PortionSizeOptions.SPOON,
              parent: this,
              isSelected: isAdding,
            );
            break;
          case PortionSizeOptions.HANDFUL:
            handfulSelector = SinglePortionSelector(
              portionSizeOption: PortionSizeOptions.HANDFUL,
              parent: this,
              isSelected: isAdding,
            );
            break;
          default:
            break;
        }

        isAdding
            ? portionsList.add(PortionSize(
                name: option.name, option: option, value: option.defaultValue))
            : portionsList.removeWhere((e) => e.option == option);
      }
      portionsRecordList = portionsList
          .map((portionSize) => PortionRecord(portionSize, this))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    //Set up the selectors
    glassSelector = SinglePortionSelector(
      portionSizeOption: PortionSizeOptions.GLASS,
      parent: this,
      isSelected: false,
    );
    spoonSelector = SinglePortionSelector(
      portionSizeOption: PortionSizeOptions.SPOON,
      parent: this,
      isSelected: false,
    );
    handfulSelector = SinglePortionSelector(
      portionSizeOption: PortionSizeOptions.HANDFUL,
      parent: this,
      isSelected: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Widget
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                glassSelector,
                PortionsDivider(),
                spoonSelector,
                PortionsDivider(),
                handfulSelector,
                PortionsDivider(),
                SinglePortionSelector(
                  portionSizeOption: PortionSizeOptions.CUSTOM,
                  parent: this,
                  isSelected: false,
                ),
              ],
            ),
          ]),
        ),
      ]..addAll(portionsRecordList),
    );
  }
}
