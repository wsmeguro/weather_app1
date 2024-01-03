import "package:flutter/material.dart";
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future List<String> get_list() async{
  var list_data = [];
  var url = Uri.parse(
      'https://www.wsmeguro.jp/weather/weather_data.php?input_data=list');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    //var jsonResponse = convert.jsonDecode(convert.utf8.decode(response.body.runes.toList()));
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse.length;
    print('気象台の数: $itemCount.');
    for (var weatherData in jsonResponse) {
      list_data.add(weatherData['name'] + ' : ' + weatherData['code']);
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return list_data;
}
