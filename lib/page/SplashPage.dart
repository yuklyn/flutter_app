import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/util/Log.dart';
import 'package:flutter_app/value/strings.dart';

const String TAG = 'SplashPage';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;

  int _retainSecond = 3;

  void _timeCount() {
    if (this._retainSecond == 0) {
      this._launchLoginWidget();
    } else {
      setState(() {
        this._retainSecond--;
      });
      new Future.delayed(new Duration(seconds: 1), () =>
          this._timeCount());
    }
  }

  void _launchLoginWidget() {
    Navigator.of(context).pushReplacementNamed(MyApp.ROUTE_PAGE_LOGIN);
  }

  @override
  void initState() {
    super.initState();
    new Future.delayed(new Duration(seconds: 1), () =>
        this._timeCount());
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    Log.d(TAG, 'Building SplashPage');
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              page_splash_description + '\n\nTime counts down: ' +
                  _retainSecond.toString() + '.\n\n',
            ),
            new Text(
              page_splash_copyright,
            ),
            new Text(
              '\n\nLifeCycleState: ' + _lastLifecycleState.toString(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    Log.d(TAG, 'LifecycleState has changed: ' + state.toString());
    setState(() {
      _lastLifecycleState = state;
    });
  }

}
