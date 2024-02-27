import 'package:final_api_calling_data/homepages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(debugShowCheckedModeBanner: false,
    theme: ThemeData( brightness: Brightness.dark, appBarTheme: AppBarTheme(color: Colors.blueGrey,centerTitle: true)),
     home:const homepages(),

    );
  }
}