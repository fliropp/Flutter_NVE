import 'dart:io';
import 'dart:async';
import 'dart:convert';

final regionsUrl = 'api01.nve.no';
final regionsUrlPath = '/hydrology/forecast/avalanche/v4.0.0/api/RegionSummary/Simple/1/2018-04-08/2018-04-08';

Future<List<String>> loadRegions() async {
  var httpClient = new HttpClient();
  var uri = new Uri.http(regionsUrl, regionsUrlPath);
  var request = await httpClient.getUrl(uri)
    ..headers.add(HttpHeaders.ACCEPT, ContentType.JSON)
    ..headers.contentType = ContentType.JSON;
  var response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
  List nveData = [];
  List data = json.decode(responseBody);
  data.forEach((e) => nveData.add([e['Id'], e['Name'], e['AvalancheWarningList']]));
  nveData.forEach(print);
  return ['1','2'];
}

