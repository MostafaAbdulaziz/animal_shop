import 'dart:io';
import 'package:animalsshop/Business_logic_components/animal_cubit/animal_states.dart';
import 'package:animalsshop/data_layer/web_services_animal.dart';
import 'package:animalsshop/views/widgets/flutter_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AnimalCubit extends Cubit<AnimalStates> {
  AnimalCubit() : super(InitialAnimalState());

  static AnimalCubit get(context) => BlocProvider.of(context);

  Future addAnimal({
    required String name,
    required String age,
    String? image,
    required String location,
    required String phoneNumber,
    required String price,
  }) async {
    WebServicesAnimal.addAnimal(
            name: name,
            age: age,
            image: image!,
            location: location,
            phoneNumber: phoneNumber,
            price: price)
        .then((value) {
      showMessage(
          message: 'add animal success',
          backgroundColor: Colors.green,
          textColor: Colors.white);
      emit(AddAnimalSuccessState());
    }).catchError((error) {
      showMessage(
          message: 'add animal success',
          backgroundColor: Colors.red,
          textColor: Colors.white);
      emit(AddAnimalErrorState());
    });
  }

  //change image of profile

  File? animalImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      animalImage = File(pickedFile.path);
      emit(ChangePhotoSuccessState());
    } else {
      print('no photo selected');
      emit(ChangePhotoErrorState());
    }
  }

  void upLoadProfileImage({
    required String name,
    required String age,
    String? image,
    required String location,
    required String phoneNumber,
    required String price,
  }) {
    emit(LoadingAnimalState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('animal/${Uri.file(animalImage!.path).pathSegments.last}')
        .putFile(animalImage!)
        .then(((value) {
      value.ref.getDownloadURL().then((value) {
        addAnimal(
            name: name,
            age: age,
            location: location,
            phoneNumber: phoneNumber,
            price: price,
            image: value);
        showMessage(
            message: 'Add Animal Done',
            backgroundColor: Colors.green,
            textColor: Colors.white);
        emit(UploadPhotoSuccessState());
      }).catchError((error) {
        showMessage(
            message: 'Add Animal Done',
            backgroundColor: Colors.red,
            textColor: Colors.white);
        emit(UploadPhotoErrorState());
      });
    })).catchError((error) {
      showMessage(
          message: 'Add Animal Done',
          backgroundColor: Colors.red,
          textColor: Colors.white);
      emit(UploadPhotoErrorState());
    });
  }
}
