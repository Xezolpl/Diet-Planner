import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortionSize {
  final String name;
  final PortionSizeOptions option;
  final Map<int, String> value;

  PortionSize(
      {@required this.name, @required this.option, @required this.value});
}

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

  IconData get iconData {
    switch (this) {
      case PortionSizeOptions.GLASS:
        return FontAwesomeIcons.glassWhiskey;
        break;
      case PortionSizeOptions.SPOON:
        return FontAwesomeIcons.utensilSpoon;
        break;
      case PortionSizeOptions.HANDFUL:
        return FontAwesomeIcons.handPaper;
        break;
      default:
        return FontAwesomeIcons.question;
        break;
    }
  }
}
