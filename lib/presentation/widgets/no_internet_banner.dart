import 'package:flutter/material.dart';

class NoInternetBanner extends StatelessWidget {
  final bool isVisible;
  const NoInternetBanner(this.isVisible, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        color: Color(0xffdfdfdf),
        width: double.infinity,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'No internet connection!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red[800]),
            ),
            Text(
              'All the changes will be saved only locally.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
