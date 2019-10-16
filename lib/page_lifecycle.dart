import 'package:flutter/material.dart';

class PageLifeCycleApp extends StatelessWidget {
  PageLifeCycleApp() {
    print('xie :' + runtimeType.toString() + " construction");
  }

  @override
  Widget build(BuildContext context) {
    print('xie :' + runtimeType.toString() + " build");
    return new PageNavStatefulWidget(title: 'Flutter Demo Home Page');
  }
}

class PageNavStatefulWidget extends StatefulWidget {
  PageNavStatefulWidget({Key key, this.title}) : super(key: key) {
    print('xie :' + runtimeType.toString() + " construction");
  }

  final String title;

  @override
  _PageNavStatefulWidgetState createState() => new _PageNavStatefulWidgetState();
}

class _PageNavStatefulWidgetState extends State<PageNavStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    print('xie :' + runtimeType.toString() + " build");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("演示跳转"),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "nameRoute");
                },
                child: new Text("直接使用name跳转")),
            new FlatButton(
                onPressed: () {
                  Navigator.push<String>(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new ThirdPage(title: "请输入昵称");
                  })).then((String result) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            content: new Text("您输入的昵称为:$result"),
                          );
                        });
                  });
                },
                child: new Text("跳转传参并返回值")),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('xie :' + runtimeType.toString() + " deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print('xie :' + runtimeType.toString() + " dispose");
  }
}

class SecondPage extends StatelessWidget {
  SecondPage() {
    print('xie :' + runtimeType.toString() + " construction");
  }

  @override
  Widget build(BuildContext context) {
    print('xie :' + runtimeType.toString() + " build");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第二页"),
      ),
      body: new Center(
        child: new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text("return")),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final String title;

  ThirdPage({this.title}) {
    print('xie :' + runtimeType.toString() + " construction");
  }

  @override
  State<StatefulWidget> createState() {
    return new _ThirdPageState();
  }
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController controller;

  @override
  void initState() {
    controller = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('xie :' + runtimeType.toString() + " build");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(labelText: "请输入昵称"),
            controller: controller,
          ),
          new RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                if (controller.text == '') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                            title: new Text("请输入昵称"),
                          ));
                  return;
                }
                Navigator.pop(context, controller.text);
              },
              child: new Text("OK"))
        ],
      ),
    );
  }
}
