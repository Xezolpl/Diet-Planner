import 'package:flutter/material.dart';

class BottomAdPlayer extends StatelessWidget {
  const BottomAdPlayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width / 8.089,
      child: Image.network(
        'https://t5.rbxcdn.com/2e280d9d0117dcd2633865c8fd69f8a4',
        fit: BoxFit.cover,
      ),
    );
  }
}
