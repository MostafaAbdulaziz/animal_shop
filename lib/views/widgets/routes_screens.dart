import 'package:flutter/material.dart';

void routesAndRemoveScreens({context, required String screen}) =>
    Navigator.of(context).pushReplacementNamed(screen);
void routesBetweenScreens({context, required String screen}) =>
    Navigator.of(context).pushNamed(screen);