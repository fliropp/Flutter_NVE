import 'package:flutter/material.dart';
import '../utils/nveRest.dart';
import './nveRegionData.dart';
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
  List<String> _current = [];


  Widget _buildNveList() {
    int count = 0;
    return new ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemBuilder: (context, i) {
          if(count < _nvePlaces.length) {
            if (i.isOdd) return new Divider();
            return _buildRow(_nvePlaces[count][1], _nvePlaces[count++][0].toString() );
          }
        }
    );
  }

  Widget _buildRow(String region, String regionId) {
    final alreadyMarked = _marked.contains(regionId);
    return new ListTile(
        title: new Text(
          region,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadyMarked ? Icons.favorite : Icons.favorite_border,
          color: alreadyMarked ? Colors.red : null,
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
          _openRegion();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_nvePlaces.length == 0)
      getRegions();
    print('build');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('NVE steder'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _openMultiple)
        ],
      ),
      body: _buildNveList(),
    );
  }

  void getRegions() {
    Future<List<String>> future = loadRegions();
    future.then((r) {
      setState(() {
        _nvePlaces = r;
      });
    });
  }

  void getDataForRegion(String regionId) {
    Future<List<String>> future = loadDataForRegion(regionId);
    future.then((d) {
      setState(() {
        _regionData = d;
      });
    });
  }

  void _openRegion() {
    getDataForRegion(_current[1]);
    print('open single...');
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) => new NveRegionData(_regionData)

        ),
    );
  }


  void _openMultiple() {
    print('open multiple...');
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              final tiles = _marked.map((p) {
                return new ListTile(
                  title: new Text(
                    p,
                    style: _biggerFont,
                  ),
                );
              },);
              final divided = ListTile
                  .divideTiles(
                context: context,
                tiles: tiles,
              )
                  .toList();

              return new Scaffold(
                appBar: new AppBar(
                  title: new Text('NVE details for n > 1 places...'),
                ),
                body: new ListView(children: divided),
              );
            }
        )
    );
  }
}