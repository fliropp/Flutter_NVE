import 'dart:io';
import 'dart:async';
import 'dart:convert';

final domain = 'api01.nve.no';
final lrPath = '/hydrology/forecast/avalanche/v4.0.0/api/RegionSummary/Simple/1/2018-04-08/2018-04-08';
final ldfrPath = "/hydrology/forecast/avalanche/v4.0.0/api/AvalancheWarningByRegion/Simple/";
final language = "1";
final salten = "3016";

Future<List<String>> loadRegions() async {
  var httpClient = new HttpClient();
  var uri = new Uri.http(domain, lrPath);
  var request = await httpClient.getUrl(uri)
    ..headers.add(HttpHeaders.ACCEPT, ContentType.JSON)
    ..headers.contentType = ContentType.JSON;
  var response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
  List nveData = [];
  List data = json.decode(responseBody);
  data.forEach((e) => nveData.add([e['Id'], e['Name'], e['AvalancheWarningList'][0]['DangerLevel']]));
  return nveData;
}

Future<List<String>> loadDataForRegion(String rid) async{
  var httpClient = new HttpClient();
  var uri = new Uri.http(domain, ldfrPath + rid + "/" + language);
  var request = await httpClient.getUrl(uri)
    ..headers.add(HttpHeaders.ACCEPT, ContentType.JSON)
    ..headers.contentType = ContentType.JSON;
  var response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
  List nveData = [];
  List data = json.decode(responseBody);
  data.forEach((e) => nveData.add([e['RegionId'], e['RegionName'], e['DangerLevel'], e['ValidFrom'], e['ValidTo'], e['NextWarningTime'], e['MainText']]));
  //data.forEach((e) => print(e));
  print("Load Region Data\n" + nveData.toString());
  return nveData;
}



