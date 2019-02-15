import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter LifeTime',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '致亲爱的您：'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String birthday =  '';
  String targetAge =  '';
  String type = 'year';
  var typeOptions = ['year', 'month', 'week', 'day'];
  String curDate = '';
  int passNum = 1200;
  int nextNum = 1700;
  var showForm = false;
  var fullWidth = true;
  var openAlert = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  Widget buildGrid() {
    List<Widget> item = [];
    for (var i=1; i<=passNum; i++) {
      item.add(new Container(
        color: Colors.grey,
        width: 15.0,
        height: 15.0,
        foregroundDecoration: new BoxDecoration(
          border: new Border.all(color: Colors.white,width: 1.0,style: BorderStyle.solid)
        ),
      ));
    }
    for (var i=1;i<=nextNum; i++) {
      item.add(new Container(
        color: Colors.green,
        width: 15.0,
        height: 15.0,
        foregroundDecoration: new BoxDecoration(
            border: new Border.all(color: Colors.white,width: 1.0,style: BorderStyle.solid)
        ),
      ));
    }
    Widget content = new Wrap(
      spacing: 1.0,
      runSpacing: 1.0,
      children: item,
    );
    return content;
//    return new CustomScrollView( // 此方法不会出现滚动条
//      shrinkWrap: true,
//      slivers: <Widget>[
//        new SliverPadding(
//        padding: const EdgeInsets.all(1.0),
//          sliver: new SliverList(
//              delegate: new SliverChildListDelegate(
//                <Widget>[content]
//              ),
//          ),
//      ),
//      ]
//    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var unit = type=='day'?'天':type=='month'?'月':type=='week'?'周':'年';
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView( // 用此包裹，会出现滚动条
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 400.0
              ),
            child: Column(
              // Column is also layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(top:5.0,right: 10.0,bottom: 5.0,left:5.0),
                  child: new Text(
                    '截止今日$curDate,距离您的出生日$birthday,您已经走过了$passNum$unit。距离您设定的$targetAge岁，还有$nextNum$unit，且行且珍惜！',
                  ),
                ),
                buildGrid(),
                new Container(
                  padding: const EdgeInsets.only(top:5.0,right: 10.0,bottom: 5.0,left:5.0),
                  child: new Text(
                    '无敌是多么多么寂寞。。。',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
