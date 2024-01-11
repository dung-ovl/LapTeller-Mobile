import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt", "products": []}');
}

dynamic convertToJSONBOT(
  String prompt,
  List<dynamic>? products,
) {
  String productlist = json.encode(products);
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode(
      '{"role": "bot", "content": "$prompt", "products": $productlist}');
}

int convertDateTimeJson(String jsonDate) {
  return DateTime.parse(jsonDate).millisecondsSinceEpoch ~/ 1000;
}

String formatCurrency(String currency) {
  var usCurrency = NumberFormat('#,##0');

  return usCurrency.format(double.parse(currency));
}

List<LatLng> getLatLong(dynamic location) {
  List<LatLng> latLngList = [];
  for (var loc in location) {
    double lat = loc['gps_coordinates']['latitude'];
    double lng = loc['gps_coordinates']['longitude'];
    latLngList.add(LatLng(lat, lng));
  }
  return latLngList;
}
