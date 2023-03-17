import 'package:animalsshop/cache_Helper/shared_preferaned.dart';
import 'package:animalsshop/constants/constant_Widgets.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/views/screens/home_screen.dart';
import 'package:animalsshop/views/screens/login_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Business_logic_components/bloc_observer.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  userId=await CacheHelper.getData(key: 'userId');
  print(userId);
  startScreen=userId!=null?const HomeScreen():const LoginScreen();
  runApp( MyApp(startScreen: startScreen,));
}

