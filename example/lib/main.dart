import 'package:flat_segmented_control/flat_segmented_control.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segmented Control Demo',
      home: MyHomePage(title: 'Segmented Control Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: FlutterLogo(
              size: 150.0,
            ),
          ),
          SizedBox(height: 20.0),
          FlatSegmentedControl(
            tabChildren: <Widget>[
              Container(
                height: 50.0,
                child: Center(child: Text("Tab 1")),
              ),
              Container(
                height: 50.0,
                child: Center(child: Text("Tab 2")),
              ),
              Container(
                height: 50.0,
                child: Center(child: Text("Tab 3")),
              ),
            ],
            childrenHeight: 150.0,
            children: <Widget>[
              Center(child: Text("View 1")),
              Center(child: Text("View 2")),
              Center(child: Text("View 3")),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          ),
        ],
      ),
    );
  }
}
