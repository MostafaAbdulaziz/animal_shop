import 'package:animalsshop/views/screens/add_animal_screen.dart';
import 'package:animalsshop/views/screens/animal_screen.dart';
import 'package:animalsshop/views/screens/home_screen.dart';
import 'package:animalsshop/views/screens/login_screen.dart';
import 'package:animalsshop/views/screens/profile_screen.dart';
import 'package:animalsshop/views/screens/signup_screen.dart';
import 'package:animalsshop/views/screens/update_profile.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

Map<String, WidgetBuilder> routesScreen={
  'loginScreen':(context)=>const LoginScreen(),
  'signupScreen':(context)=>const SignupScreen(),
  'profileScreen':(context)=>const ProfileScreen(),
  'homeScreen':(context)=>const HomeScreen(),
  'addAnimalScreen':(context)=>const AddAnimalScreen(),
  //'animalScreen':(context)=>const AnimalScreen(),
  'updateProfileScreen':(context)=>const UpdateProfileScreen(),
};

CreateUserModel? model;
