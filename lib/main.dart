import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tequevia/provider.dart';

import 'Homepag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: const Homepage(),
      ),
    );
  }
}
