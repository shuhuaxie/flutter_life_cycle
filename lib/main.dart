import 'package:flutter/material.dart';

import 'page_lifecycle.dart';
import 'widget_lifeCycle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp() {
    print('xie :' + runtimeType.toString() + " construction");
  }

  @override
  Widget build(BuildContext context) {
    print('xie :' + runtimeType.toString() + " build");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter life cycle Demo Home Page'),
      routes: {
        "nameRoute": (BuildContext context) => new SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    print('xie :' + runtimeType.toString() + " build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListItem('WidgetLifeCycle', MyWidgetLifeCycle()),
              ListItem('PageLifeCycle', PageLifeCycleApp()),

            ],
          ),
        ),
      ),
    );
  }
}
class ListItem extends StatelessWidget {
  final String name;
  final Widget widget;

  const ListItem(
      this.name,
      this.widget, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => widget),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            name,
            style: Theme.of(context).textTheme.body2,
          ),
        ),
      ),
    );
  }
}

