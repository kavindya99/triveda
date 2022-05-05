import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// To parse this JSON data, do
//
//     final testModel = testModelFromMap(jsonString);

List<TestModel> testModelFromMap(String str) =>
    List<TestModel>.from(json.decode(str).map((x) => TestModel.fromMap(x)));

String testModelToMap(List<TestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TestModel {
  TestModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory TestModel.fromMap(Map<String, dynamic> json) => TestModel(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}

class TestTry extends StatefulWidget {
  const TestTry({Key key}) : super(key: key);

  @override
  _TestTryState createState() => _TestTryState();
}

class _TestTryState extends State<TestTry> {
  List<TestModel> testList = [];

  Future<List<TestModel>> getDataApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    var data = jsonDecode((response.body.toString()));
    if (response.statusCode == 200) {
      for (Map i in data) {
        testList.add(TestModel.fromMap(i));
      }
      return testList;
    } else {
      return testList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDataApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("loading");
                } else {
                  return ListView.builder(
                    itemCount: testList.length,
                    itemBuilder: ((context, index) {
                      return Text(
                        index.toString(),
                      );
                    }),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
