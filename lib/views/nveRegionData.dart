import 'package:flutter/material.dart';

class NveRegionData extends StatelessWidget {

  final List<List<String>> regionData;

  NveRegionData(this.regionData);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('NVE details for ' + regionData[0][1]),
        ),
        body: new Center(
          child: new ListView(
              children: <Widget>[
                new ListTile(title: new Text("Vurdering" + regionData[0][2])),
                new ListTile(title: new Text("Fra " + regionData[0][3] + " til " + regionData[0][4])),
                new ListTile(title: new Text(regionData[0][6])),
                new Divider(),
                new ListTile(title: new Text("Vurdering" + regionData[1][2])),
                new ListTile(title: new Text("Fra " + regionData[1][3] + " til " + regionData[1][4])),
                new ListTile(title: new Text(regionData[1][6])),
                new Divider(),
                new ListTile(title: new Text("Vurdering" + regionData[0][2])),
                new ListTile(title: new Text("Fra " + regionData[2][3] + " til " + regionData[2][4])),
                new ListTile(title: new Text(regionData[2][6])),
                new Divider(),
                new ListTile(title: new Text("Neste vurdering " + regionData[0][5])),
              ]
          ),
        )
    );
  }
}