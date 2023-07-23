import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrpper_app/controller/wathercontroller.dart';
import 'package:sky_scrpper_app/views/scrrens/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => wathercontroller(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: homepage(),
    );
  }
}
