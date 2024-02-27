import 'package:flutter/material.dart';



import 'dart:convert';

List<Models> modelsFromJson(String str) =>
    List<Models>.from(json.decode(str).map((x) => Models.fromJson(x)));

String modelsToJson(List<Models> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Models {
  int userId;
  int id;
  String title;
  String body;

  Models({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Models.fromJson(Map<String, dynamic> json) => Models(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
