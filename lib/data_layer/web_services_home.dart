import 'package:animalsshop/constants/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebServicesHome{

  static Future<QuerySnapshot<Map<String,dynamic>>> getAllAnimal()async{
    return FirebaseFirestore.instance.collection('animals').get();

  }

  static Future<DocumentSnapshot<Map<String,dynamic>>> getUserData()async{
    return await FirebaseFirestore.instance.collection('users').doc(userId).get();
  }
}