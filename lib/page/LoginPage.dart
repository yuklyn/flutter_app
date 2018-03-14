import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/util/Log.dart';
import 'package:flutter_app/value/strings.dart';

const String TAG = 'LoginPage';

class LoginPage extends StatefulWidget {

  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }

}

class LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;

  bool _isLoginStart = false;

  final double _height = 300.0;

  TextEditingController _userController = new UsernameController();
  TextEditingController _passController = new PasswordController();

  LoginPageState() : super();

  void onLoginBtnPressed() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      _isLoginStart = true;
    });
    new Future.delayed(new Duration(seconds: 1), () {
      this.setState(() {
        _isLoginStart = false;
        if (_userController.text == 'yuklyn' &&
            _passController.text == '123') {
          Navigator.of(context).pushReplacementNamed(MyApp.ROUTE_PAGE_HOME);
        } else {
          setState(() {
            _userController.text = '重新输入';
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Log.d(TAG, 'initState');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    Log.d(TAG, 'build');
    return new Scaffold(
      body: new GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new Center(
          child: new Container(
            constraints: new BoxConstraints.expand(
              height: _height,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buildInputWidgets(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Log.d(TAG, 'dispose');
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _lastLifecycleState = state;
    Log.d(TAG, 'LifecycleState has changed: ' + state.toString());
  }

  List<Widget> buildInputWidgets() {
    return <Widget>[
      new Container(
        child: new Image.asset(
          'res/images/git.icon', height: 80.0, width: 80.0,),
      ),
      new Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: new TextField(
            style: new TextStyle(
                fontSize: 16.0, color: Colors.black87),
            controller: _userController,
            decoration: new InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                      color: Colors.black87, width: 1.0),
                  borderRadius: new BorderRadius.circular(3.0)),
              hintText: page_login_username_hint,
            )
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(top: 6.0),
        child: new TextField(
          controller: _passController,
          style: new TextStyle(fontSize: 16.0, color: Colors.black87),
          decoration: new InputDecoration(
            contentPadding: const EdgeInsets.all(12.0),
            border: new OutlineInputBorder(
                borderSide: new BorderSide(
                    color: Colors.black87, width: 1.0),
                borderRadius: new BorderRadius.circular(3.0)),
            hintText: page_login_password_hint,
          ),
          obscureText: true,
        ),
      ),
      new Container(
        height: 50.0,
        margin: const EdgeInsets.only(top: 6.0),
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Offstage(
              offstage: _isLoginStart,
              child: new Container(
                height: 50.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: new FlatButton(
                  child: new Text(
                      page_login_button_text,
                      style: new TextStyle(fontSize: 16.0)),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  highlightColor: Colors.lightBlueAccent,
                  onPressed: onLoginBtnPressed,
                ),),
            ),
            new Offstage(
              offstage: !_isLoginStart,
              child: new CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    ];
  }
}

class LoginInputWidget extends CustomMultiChildLayout {
}

class UsernameController extends TextEditingController {
}

class PasswordController extends TextEditingController {
}