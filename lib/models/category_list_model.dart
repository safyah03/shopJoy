// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

List<String> categoryListModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoryListModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
