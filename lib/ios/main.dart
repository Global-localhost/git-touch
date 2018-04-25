import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/index.dart';
import 'notification.dart';
import 'profile.dart';
import 'issue.dart';

class IosHomePage extends StatefulWidget {
  IosHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IosHomePageState createState() => new _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(context) {
    return new CupertinoPageScaffold(
      child: new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: const Text('Home'),
            ),
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.conversation_bubble),
              title: const Text('Notification'),
            ),
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              title: const Text('Profile'),
            ),
          ],
        ),
        tabBuilder: (context, int index) {
          return new DefaultTextStyle(
            style: const TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: new CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return new IosHomeTab();
                    break;
                  case 1:
                    return new IosNotificationTab();
                    break;
                  case 2:
                    return new IosProfileTab();
                    break;
                  default:
                }
              },
            ),
          );
        },
      ),
    );
  }
}
