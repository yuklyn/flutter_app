import 'package:flutter/material.dart';
import 'package:flutter_app/page/HomePage.dart';
import 'package:flutter_app/page/LoginPage.dart';
import 'package:flutter_app/page/SplashPage.dart';
import 'package:flutter_app/util/Log.dart';
import 'package:flutter_app/value/strings.dart';

void main() => runApp(new MyApp());

const String TAG = 'main';

class MyApp extends StatelessWidget {
  static const String ROUTE_PAGE_SPLASH = 'SplashPage';
  static const String ROUTE_PAGE_LOGIN = 'LoginPage';
  static const String ROUTE_PAGE_HOME = 'HomePage';

  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Navigator.defaultRouteName: (context) =>
    new SplashPage(title: page_splash_title),
    ROUTE_PAGE_LOGIN: (context) => new LoginPage(title: page_login_title),
    ROUTE_PAGE_HOME: (context) => new HomePage(title: page_home_title)
  };

  @override
  Widget build(BuildContext context) {
    Log.d(TAG, 'Building App');
    return new MaterialApp(
      title: app_name,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _routes,
    );
  }
}