import 'dart:convert';
import 'dart:math';

import 'package:final_api_calling_data/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

class homepages extends StatefulWidget {
  const homepages({super.key});

  @override
  State<homepages> createState() => _homepagesState();
}

class _homepagesState extends State<homepages> {
  List<Models> Postlists = [];

  Future<List<Models>> getPostapi() async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
    final json = jsonDecode(responce.body);
    if (responce.statusCode == 200) {
      for (Map<String, dynamic> i in json) {
        Postlists.add(Models.fromJson(i));
      }
      return Postlists;
    } else {
      return Postlists;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api calling from Placeholder'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                    ));
                  } else {
                    return ListView.builder(
                        itemCount: Postlists.length,
                        itemBuilder: (context, index) {
                          var location = Postlists[index].body;
                          var titless = Postlists[index].title;
                          return Card(
                            color: Colors.green[900],
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListTile(
                                title: Text(
                                  'Number of Titles: ' + index.toString(),
                                  style:const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Titles: ' + titless.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70),
                                    ),
                                   const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Description: \n' + location.toString(),
                                      style:const TextStyle(
                                          fontSize: 17, color: Colors.white54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
