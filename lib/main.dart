import 'package:flutter/material.dart';
import 'views/nveOverview.dart';

void main() => runApp(new NveApp());

class NveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Skredvarsel fra NVE",
      home: new NveOverview(),
    );
  }
}




