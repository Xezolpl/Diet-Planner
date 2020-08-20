import 'package:flutter/material.dart';

final MOBILE_WIDE_AD_SIZE = Size(320, 50);
final TABLET_WIDE_AD_SIZE = Size(728, 90);
final RECTANGLE_AD_SIZE = Size(300, 250);
//TODO: SAVE THE PREFFERED ADS SIZE IN THE PREFFERENCES AND LOAD IT HERE

class EmptyTranspartentContainer extends StatelessWidget {
  const EmptyTranspartentContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}

class BottomAdPlayer extends StatelessWidget {
  final String adUrl;
  const BottomAdPlayer({this.adUrl = '', Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width / MOBILE_WIDE_AD_SIZE.aspectRatio,
      child: adUrl.isNotEmpty
          ? Image.network(adUrl, fit: BoxFit.cover)
          : EmptyTranspartentContainer(),
    );
  }
}

class AppBarAdPlayer extends StatelessWidget {
  final String adUrl;
  const AppBarAdPlayer({this.adUrl = '', Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);

    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: mq.padding.top),
      width: mq.size.width,
      height: AppBar().preferredSize.height + mq.padding.top,
      child: adUrl.isNotEmpty
          ? Image.network(
              adUrl,
              fit: BoxFit.cover,
            )
          : EmptyTranspartentContainer(),
    );
  }
}
