import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:async';

String formatDate(String crapDate){

  DateTime date = DateTime.parse(crapDate);
  var formatter = new DateFormat('yyyy.MM.dd');
  return formatter.format(date);
}

Future<Map<String, double>> getCurrentLocation() async {

  Map<String, double> currentLocation;
  var _location = new Location();
  String error;

  try {
    currentLocation = await _location.getLocation;
    error = null;
  } on PlatformException catch (e) {
    if (e.code == 'PERMISSION_DENIED') {
      error = 'Permission denied';
      print(error);
    } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
      error = 'Permission denied - please ask the user to enable it from the app settings';
      print(error);
    }
    currentLocation = null;
  }
  print('--->' + currentLocation.toString());
  return currentLocation;
}


Color getDangerColor(String dangerLevel){
  switch(dangerLevel) {
    case "0":
      {
        return Colors.white;
      }
    case "1":
      {
        return Colors.green;
      }
    case "2":
      {
        return Colors.yellowAccent;
      }
    case "3":
      {
        return Colors.orange;
      }
    case "4":
      {
        return Colors.red;
      }
    default:
      {
        return Colors.grey;
      }
  }
}

IconData getDangerIcon(String dangerLevel){
  switch(dangerLevel) {
    case "0":
      {
        return Icons.error;
      }
    case "1":
      {
        return Icons.looks_one;
      }
    case "2":
      {
        return Icons.looks_two;
      }
    case "3":
      {
        return Icons.looks_3;
      }
    case "4":
      {
        return Icons.looks_4;
      }
    default:
      {
        return Icons.error_outline;
      }
  }
}