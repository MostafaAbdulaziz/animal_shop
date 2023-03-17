import 'package:animalsshop/models/animal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebServicesAnimal{

  static Future addAnimal({
  required String name,
  required String age,
  required String image,
  required String location,
  required String phoneNumber,
  required String price,
})async{
    AnimalModel animalModel=AnimalModel(
      name: name,
      age: age,
      image: image,
      location: location,
      phoneNumber: phoneNumber,
      price: price
    );
    FirebaseFirestore.instance.collection('animals').doc().set(animalModel.toMap());
  }
}