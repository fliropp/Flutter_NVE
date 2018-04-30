import 'package:flutter/material.dart';
import '../utils/nveRest.dart';
import '../utils/utils.dart';
import './nveRegionData2.dart';
import 'dart:async';

class NveOverview extends StatefulWidget {

  @override
  createState() => new NveOverviewState();
}

class NveOverviewState extends State<NveOverview> {

  List _nvePlaces = [];
  List _regionData = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _marked = new Set<String>();
  Map<String, double> _whereami = new Map<String, double>();
  List<String> _current = [];


  Widget _buildNveList() {
    int count = 0;
    return new Container(
        child: new ListView.builder(
                  padding: const EdgeInsets.all(18.0),
                  itemBuilder: (context, i) {
                    if(count < _nvePlaces.length) {
                      if (i.isOdd) return new Divider();
                      return _buildRow(_nvePlaces[count][1], _nvePlaces[count][0].toString(), _nvePlaces[count++][2]);
                    }
                  },
        ),
        color: Colors.grey,
    );
  }

  Widget _buildRow(String region, String regionId, String dangerLevel) {
    final alreadyMarked = _marked.contains(regionId);
    return new ListTile(
        title: new Container(
          child: new Text(
            region,
            style: _biggerFont,
          ),
          decoration: new BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: new BorderRadius.all(
              const Radius.circular(8.0),
            ),
          ),
          padding: const EdgeInsets.all(15.0),
        ),
        trailing: new Icon(
          getDangerIcon(dangerLevel),
          color: getDangerColor(dangerLevel),
        ),
        onTap: () {
          setState(() {
            if (alreadyMarked) {
              _marked.remove(regionId);
            } else {
              _marked.add(regionId);
            }
            _current = [region, regionId];
          });
          _getDataForAndOpenRegion(_current[1]);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_nvePlaces.length == 0) {
      getRegions();
    }
    print('build overview');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('NVE steder', style:new TextStyle(color: Colors.yellowAccent)),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.location_on), onPressed: _getGeoLoc)
        ],
      ),
      body: _buildNveList(),
    );
  }

  void getRegions() {
    print('get regions....');
    Future<List<String>> future = loadRegions();
    future.then((r) {
      setState(() {
        _nvePlaces = r;
      });
    });
  }

  void _getDataForAndOpenRegion(String regionId) {
    Future<List<String>> future = loadDataForRegion(regionId);
    future.then((d) {
      setState(() {
        _regionData = d;
      });
      Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) => new NveRegionData2(_regionData)

        ),
      );
    });

  }

  VoidCallback _getGeoLoc() {

    Future<Map<String, double>> future = getCurrentLocation();
    future.then((d) {
      if(_whereami['altitude'] != d['altitude']) {
        setState(() {
          _whereami = d;
        });
      }
      Future<List<String>> future2 = loadDataForRegionByCoordinates(_whereami['longitude'].toString(), _whereami['latitude'].toString());
      future2.then((d) {
        setState(() {
          _regionData = d;
        });
        Navigator.of(context).push(
          new MaterialPageRoute(
              builder: (context) => new NveRegionData2(_regionData)

          ),
        );
      });
    });
  }

  VoidCallback _setGeoLoc() {
    print('whereami: ' + _whereami.toString());
  }


}