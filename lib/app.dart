import 'package:flutter/material.dart';
import 'constants/maps.dart';

class MyApp extends StatelessWidget {
  final Widget? startScreen;
  const MyApp({super.key,this.startScreen});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startScreen,
      routes: routesScreen,
    );
  }

}