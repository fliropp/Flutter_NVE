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
        body: new GridView.count(
          crossAxisCount: 3,
          scrollDirection: Axis.horizontal,
              children: new List.generate(3, (index) {
                return new Center(
                  child: new Text("Vurdering" + regionData[index][2], style:new TextStyle(color: Colors.green.withOpacity(1.0))),

                );
              }
                /*new Text("Vurdering" + regionData[0][2]),
                new Text("Fra " + regionData[0][3] + " til " + regionData[0][4]),
                new Text(regionData[0][6]),*/


          ),
        )
    );
  }
}