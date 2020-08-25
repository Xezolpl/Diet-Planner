import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

final MOBILE_WIDE_AD_SIZE = Size(320, 50);
final TABLET_WIDE_AD_SIZE = Size(728, 90);
final RECTANGLE_AD_SIZE = Size(300, 250);
//TODO: SAVE THE PREFFERED ADS SIZE IN THE PREFFERENCES AND LOAD IT HERE

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide > 600;
}

//Abstraction
abstract class AdPlayer extends StatefulWidget {
  final String adUrl;
  const AdPlayer({
    this.adUrl = '',
    Key key,
  }) : super(key: key);
}

abstract class _AdPlayerState extends State<AdPlayer> {
  final String adUrl;
  bool isVisible = false;
  var listener;
  Widget adImage;

  _AdPlayerState(this.adUrl)
      : adImage = Image.network(
          adUrl,
          fit: BoxFit.cover,
        );

  @override
  void initState() {
    super.initState();
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      setState(() {
        isVisible = status == DataConnectionStatus.connected;
        if (adUrl.isEmpty) isVisible = false;
      });
    });
  }

  @override
  void dispose() async {
    await listener.cancel();
    super.dispose();
  }
}

class AppBarAdPlayer extends AdPlayer {
  final String adUrl;
  const AppBarAdPlayer({this.adUrl = '', Key key})
      : super(adUrl: adUrl, key: key);

  @override
  State<StatefulWidget> createState() => AppBarAdPlayerState(adUrl);
}

class AppBarAdPlayerState extends _AdPlayerState {
  AppBarAdPlayerState(String adUrl) : super(adUrl);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);

    return Visibility(
      visible: isVisible,
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(top: mq.padding.top),
        width: mq.size.width,
        height: AppBar().preferredSize.height + mq.padding.top,
        child: super.adImage,
      ),
    );
  }
}

class BottomAdPlayer extends AdPlayer {
  final String adUrl;
  const BottomAdPlayer({this.adUrl = '', Key key})
      : super(adUrl: adUrl, key: key);

  @override
  State<StatefulWidget> createState() => AppBarAdPlayerState(adUrl);
}

class BottomAdPlayerState extends _AdPlayerState {
  BottomAdPlayerState(String adUrl) : super(adUrl);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    final adSize =
        isTablet(context) ? TABLET_WIDE_AD_SIZE : MOBILE_WIDE_AD_SIZE;

    return Visibility(
      visible: isVisible,
      child: Container(
        color: Theme.of(context).primaryColor,
        width: mq.size.width,
        height: mq.size.width / adSize.aspectRatio,
        child: super.adImage,
      ),
    );
  }
}
