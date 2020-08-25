import 'package:flutter/material.dart';

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
}
