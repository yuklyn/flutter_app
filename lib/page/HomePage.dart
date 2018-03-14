import 'package:flutter/material.dart';
import 'package:flutter_app/util/Log.dart';

const String TAG = 'HomePage';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _curIndex = 0;
  int _act = 1;


  void _onTagAction(AppBarAction action) {
    Log.d(TAG, '点击标题栏的按键');
    setState(() {

    });
  }

  void _onTapFloatButton() {
    Log.d(TAG, '点击按键');
    setState(() {
      _counter++;
    });
  }

  void _onTapBottomNavigationBar(int index) {
    Log.d(TAG, '点击底部导航栏');
    setState(() {
      _curIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        body: new TabBarView(
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
        bottomNavigationBar: buildBottomNavigator(),
        floatingActionButton: new FloatingActionButton(
          onPressed: _onTapFloatButton,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(actions[0].icon),
            onPressed: () {
              _onTagAction(actions[0]);
            },
          ),
          new IconButton(
            icon: new Icon(actions[1].icon),
            onPressed: () {
              _onTagAction(actions[1]);
            },
          ),
          new PopupMenuButton<AppBarAction>( // overflow menu
            onSelected: _onTagAction,
            itemBuilder: (BuildContext context) {
              return actions.skip(2).map((AppBarAction action) {
                return new PopupMenuItem<AppBarAction>(
                  value: action,
                  child: new Icon(action.icon),
                );
              }).toList();
            },
          ),
        ],

        bottom: new TabBar(
          isScrollable: true,
          tabs: choices.map((Choice choice) {
            return new Tab(
              text: choice.title,
              icon: new Icon(choice.icon),
            );
          }).toList(),)
    );
  }

  Widget buildDrawer() {
    return new Drawer(
      child: new ListTile(
        leading: new CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: new AssetImage('res/images/git.icon'),
        ),
        title: const Text('用户名'),
        subtitle: const Text('个性签名'),
        onTap: () {
          // change app state...
          Navigator.pop(context); // close the drawer
        },
      ),
    );
  }

  Widget buildBottomNavigator() {
    List<BottomNavigationBarItem> bottomItems = new List();
    bottomItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.access_alarm), title: new Text('item1')));
    bottomItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.account_balance), title: new Text('item2')));
    bottomItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.directions_subway), title: new Text('item3')));
    return new BottomNavigationBar(
      items: bottomItems,
      currentIndex: _curIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onTapBottomNavigationBar,
    );
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class Choice {
  const Choice({ this.title, this.icon });

  final String title;
  final IconData icon;
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

const List<AppBarAction> actions = const <AppBarAction>[
  const AppBarAction(title: 'CAR', icon: Icons.directions_car),
  const AppBarAction(title: 'BICYCLE', icon: Icons.directions_bike),
  const AppBarAction(title: 'BOAT', icon: Icons.directions_boat),
  const AppBarAction(title: 'BUS', icon: Icons.directions_bus),
  const AppBarAction(title: 'TRAIN', icon: Icons.directions_railway),
  const AppBarAction(title: 'WALK', icon: Icons.directions_walk),
];

class AppBarAction {
  const AppBarAction({ this.title, this.icon });

  final String title;
  final IconData icon;
}
