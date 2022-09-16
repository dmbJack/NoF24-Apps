import 'package:flutter/material.dart';
import 'package:not24/repositories/data_repositorie.dart';
import 'package:not24/ui/screens/loading_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ListenableProvider<DataRepository>(
    create: (context) => DataRepository(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not 24',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingScreens(),
    );
  }
}
