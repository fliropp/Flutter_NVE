import 'package:flutter/material.dart';
import '../utils/utils.dart';

class NveRegionData2 extends StatelessWidget {

  final List<List<String>> regionData;
  final double TXT_WIDTH = 300.0;
  final BoxDecoration ROUND_CORNERS = new BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: new BorderRadius.all(
        const Radius.circular(8.0),
      ));

  NveRegionData2(this.regionData);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('NVE details for ' + regionData[0][1], style:new TextStyle(color: Colors.yellowAccent)),
          backgroundColor: Colors.red,
        ),
        body: new Container(
          child: new Column(
            children: [
              new Container(
                child: new Row(
                children:<Column> [
                  new Column(children: [
                    new Container(
                        child: new Row(
                          children:[
                            new Container(
                                child: new Text(regionData[0][2], style:new TextStyle(fontSize: 24.0)),
                                width:50.0,
                                height: 50.0,
                                padding: const EdgeInsets.all(15.0),
                                decoration:  new BoxDecoration(
                                    color: getDangerColor(regionData[0][2]),
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(8.0),
                                    ))),

                            new Container(
                                child: new Text(
                                    "Fra " + formatDate(regionData[0][3]) + " til " + formatDate(regionData[0][4])),
                                width:250.0,
                                height:50.0,
                                padding: const EdgeInsets.all(15.0),
                                margin: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                decoration:  new BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: new BorderRadius.all(
                                       const Radius.circular(8.0),
                                    ))
                            ),
                          ])),

                    new Container(
                        margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 25.0),
                        child: new Text(
                            regionData[0][6]),
                        width:TXT_WIDTH,
                        padding: const EdgeInsets.all(15.0),
                        decoration:  new BoxDecoration(
                            color: Colors.white70,
                            borderRadius: new BorderRadius.all(
                              const Radius.circular(8.0),
                            ))
                    ),
                  ]),
                 ]),

              ),

              new Container(
                child: new Row(
                    children:<Column> [
                      new Column(children: [
                        new Container(
                            child: new Row(
                                children:[
                                  new Container(
                                      child: new Text(regionData[1][2], style:new TextStyle(fontSize: 24.0)),
                                      width:50.0,
                                      height: 50.0,
                                      padding: const EdgeInsets.all(15.0),
                                      decoration:  new BoxDecoration(
                                          color: getDangerColor(regionData[0][2]),
                                          borderRadius: new BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ))),

                                  new Container(
                                      child: new Text(
                                          "Fra " + formatDate(regionData[1][3]) + " til " + formatDate(regionData[1][4])),
                                      width:250.0,
                                      height:50.0,
                                      padding: const EdgeInsets.all(15.0),
                                      margin: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                      decoration:  new BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: new BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ))
                                  ),
                                ])),

                        new Container(
                            margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 25.0),
                            child: new Text(
                                regionData[1][6]),
                            width:TXT_WIDTH,
                            padding: const EdgeInsets.all(15.0),
                            decoration:  new BoxDecoration(
                                color: Colors.white70,
                                borderRadius: new BorderRadius.all(
                                  const Radius.circular(8.0),
                                ))
                        ),
                      ]),
                    ]),

              ),

              new Container(
                child: new Row(
                    children:<Column> [
                      new Column(children: [
                        new Container(
                            child: new Row(
                                children:[
                                  new Container(
                                      child: new Text(regionData[2][2], style:new TextStyle(fontSize: 24.0)),
                                      width:50.0,
                                      height: 50.0,
                                      padding: const EdgeInsets.all(15.0),
                                      decoration:  new BoxDecoration(
                                          color: getDangerColor(regionData[0][2]),
                                          borderRadius: new BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ))),

                                  new Container(
                                      child: new Text(
                                          "Fra " + formatDate(regionData[2][3]) + " til " + formatDate(regionData[2][4])),
                                      width:250.0,
                                      height:50.0,
                                      padding: const EdgeInsets.all(15.0),
                                      margin: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                      decoration:  new BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: new BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ))
                                  ),
                                ])),

                        new Container(
                            margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 25.0),
                            child: new Text(
                                regionData[2][6]),
                            width:TXT_WIDTH,
                            padding: const EdgeInsets.all(15.0),
                            decoration:  new BoxDecoration(
                                color: Colors.white70,
                                borderRadius: new BorderRadius.all(
                                  const Radius.circular(8.0),
                                ))
                        ),
                      ]),
                    ]),

              ),


          ]),
          color: Colors.grey,
          alignment: FractionalOffset.bottomCenter,
          padding: const EdgeInsets.all(15.0),


        )
    );
  }
}