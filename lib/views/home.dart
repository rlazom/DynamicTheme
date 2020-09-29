import 'dart:ui';

import 'package:dark_mode/common/widgets/theme_switcher_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//  Widget _getOverlay() {
//    return ColorFiltered(
//      colorFilter: ColorFilter.mode(
//          Colors.black54,
//          BlendMode.srcOut
//      ),
//      child: Stack(
//        children: [
//          Container(
//            decoration: BoxDecoration(
//              color: Colors.transparent,
//            ),
//            child: Align(
//              alignment: Alignment.bottomRight,
//              child: Container(
//                margin: const EdgeInsets.only(right: 4, bottom: 4),
//                height: 80,
//                width: 80,
//                decoration: BoxDecoration(
//                  color: Colors.black, // Color does not matter but should not be transparent
//                  borderRadius: BorderRadius.circular(40),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }

//  Color _getColor({bool invert = false}) {
//    Color color = Colors.white54;
//    bool isAutoThemeData = ThemeSwitcher.of(context).isAuto;
//    if(!isAutoThemeData) {
//      var themeData = ThemeSwitcher.of(context).themeData;
//      color = themeData.brightness == Brightness.light ? Colors.white54 : Colors.black54 ;
//    }
//    return invert ? _invertColor(color) : color;
//  }

//  Color _invertColor(Color color) {
//    return color == Colors.white54 ? Colors.black54 : Colors.white54;
//  }

//  _buildIcon() {
//    IconData icon = Icons.brightness_auto;
//    String themeStatus = 'auto';
//    bool isAutoThemeData = ThemeSwitcher.of(context).isAuto;
//    if(!isAutoThemeData) {
//      var themeData = ThemeSwitcher.of(context).themeData;
//      icon = themeData.brightness == Brightness.light ? Icons.brightness_high : Icons.brightness_4 ;
//      themeStatus = themeData.brightness == Brightness.light ? 'light' : 'dark' ;
//    }
//
//    return new Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Column(
//        children: [
//          new Icon(icon, color: Theme.of(context).textTheme.button.color),
//          new Text(themeStatus, style: TextStyle(color: Theme.of(context).textTheme.button.color, fontSize: 10),),
//        ],
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          ThemeSwitcherBtn(),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          new Image.asset('images/background.jpg', fit: BoxFit.cover, width: MediaQuery.of(context).size.width,),
          new Container(color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),),

          new ClipRect(
            child: new Container(
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('You have pushed the button this many times:', style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.justify,),
                      new Text('$_counter', style: Theme.of(context).textTheme.headline4,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add, color: Theme.of(context).textTheme.button.color),
      ),
    );
  }
}