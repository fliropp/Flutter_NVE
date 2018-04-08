import 'package:flutter/material.dart';
import '../utils/nveRest.dart';
import 'dart:async';
class NveOverview extends StatefulWidget {
  @override
  createState() => new NveOverviewState();
}

class NveOverviewState extends State<NveOverview> {


  Future<List<String>> nveResponse = loadRegions();
  final _nvePlaces = ['1','2', '3'];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _marked = new Set<String>();
  String _current = '';

  Widget _buildNveList() {
    int count = 0;
    return new ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          if (count < _nvePlaces.length)
            return _buildRow(_nvePlaces[count++]);
        }
    );
  }

  Widget _buildRow(String place) {
    final alreadyMarked = _marked.contains(place);
    return new ListTile(
        title: new Text(
          place,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadyMarked ? Icons.favorite : Icons.favorite_border,
          color: alreadyMarked ? Colors.red : null,
        ),

        onTap: () {
          setState(() {
            if (alreadyMarked) {
              _marked.remove(place);
            } else {
              _marked.add(place);
            }
            _current = place;
          });
          _openSingle();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
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

  void _openSingle() {
    print('open multiple...');
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                appBar: new AppBar(
                  title: new Text('NVE details for ' + _current),
                ),
                body: new Text(_current),
              );
            }
        )
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