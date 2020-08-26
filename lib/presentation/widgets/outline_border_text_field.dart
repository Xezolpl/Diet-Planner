import 'package:flutter/material.dart';

class OutlineBorderTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String initValue;
  final bool readOnly;

  const OutlineBorderTextField({
    Key key,
    this.onChanged,
    this.initValue = '',
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
  }
}
