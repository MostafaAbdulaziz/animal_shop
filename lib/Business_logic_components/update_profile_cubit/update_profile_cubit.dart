import 'dart:io';
import 'package:animalsshop/Business_logic_components/update_profile_cubit/update_profile_states.dart';
import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/data_layer/web_services_update_profile.dart';
import 'package:animalsshop/models/user_model.dart';
import 'package:animalsshop/views/widgets/flutter_toast.dart';
import 'package:animalsshop/views/widgets/routes_screens.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(InitialUpdateProfileState());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  IconData iconPass = Icons.visibility_off;
  bool isNotVisiblePass = true;

  void changeIconAndSecurePass() {
    isNotVisiblePass = !isNotVisiblePass;
    iconPass = isNotVisiblePass ? Icons.visibility_off : Icons.visibility;
    emit(ChangeIconAndSecurePassState());
  }

  IconData iconConPass = Icons.visibility_off;
  bool isNotVisibleConPass = true;

  void changeIconAndSecureConPass() {
    isNotVisibleConPass = !isNotVisibleConPass;
    iconConPass = isNotVisibleConPass ? Icons.visibility_off : Icons.visibility;
    emit(ChangeIconAndSecureConfirmPassState());
  }

  Future<void> updateUserData(
      {required String name,
        required String mail,
        required String phone,
        required String password,
        required String birthData,
        required String bio,
        required String gender,
        required String age,
        }) async {
    emit(LoadingUpdateDataState());
    await WebServicesUpdateProfile.updateUserData(
            uId: userId!,
            name: name,
            mail: mail,
            phone: phone,
            birthData: birthData,
            bio: bio,
            gender: gender,
            age: age,
            password: password,
            )
        .then((value) {
      showMessage(
          message: 'Update Date done',
          backgroundColor: Colors.green,
          textColor: Colors.white);
      emit(UpdateUserDataSuccessState());
    }).catchError((error) {
      showMessage(
          message: error.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
      emit(UpdateUserDataErrorState(error.toString()));
    });
  }

  Future<void> updateEmail({required String mail}) async {
    await WebServicesUpdateProfile.updateEmail(mail: mail);
  }

  Future<void> getUserData(context) async {
    //emit(LoadingGetUserDataState());
    WebServicesUpdateProfile.getUserData().then((value) {
      model = CreateUserModel.fromJson(value.data()!.cast());
      routesBetweenScreens(context: context, screen: 'profileScreen');
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState());
    });
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> changeProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ChangePhotoSuccessState());
    } else {
      print('no photo selected');
      emit(ChangePhotoErrorState());
    }
  }

  void upLoadProfileImage() {
    emit(LoadingUpdateImageState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then(((value) {
      value.ref.getDownloadURL().then((value) {
        WebServicesUpdateProfile.updateUserData(uId: userId!,image: value);
        showMessage(
            message: 'Update Profile Image Done',
            backgroundColor: Colors.green,
            textColor: Colors.white);
        emit(UploadPhotoSuccessState());
      }).catchError((error) {
        emit(UploadPhotoErrorState());
        showMessage(
            message: error.toString(),
            backgroundColor: Colors.green,
            textColor: Colors.white);
      });
    })).catchError((error) {
      showMessage(
          message: error.toString(),
          backgroundColor: Colors.green,
          textColor: Colors.white);
      emit(UploadPhotoErrorState());
    });
  }
}
