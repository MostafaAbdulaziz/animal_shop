import 'package:animalsshop/Business_logic_components/signup_cubit/signup_states.dart';
import 'package:animalsshop/data_layer/web_services_signup.dart';
import 'package:animalsshop/views/widgets/flutter_toast.dart';
import 'package:animalsshop/views/widgets/routes_screens.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(InitialSignupState());

  static SignupCubit get(context) => BlocProvider.of(context);

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

  void createAccount(
      {required String email,
      required String password,
      context,
      required String name,
      required String phone,
        required String age,
        required String birthDate,
        required String gender
      }) async {
    emit(LoadingCreateAccountState());
    await WebServicesSignup.createAccount(email: email, password: password)!
        .then((value) {
      showMessage(
          message: 'Account Created',
          backgroundColor: Colors.green,
          textColor: Colors.white);
      storeUserData(
          name: name, phone: phone, uId: value.user!.uid, email: email,birthDate:birthDate,gender:gender,age:age);
    }).catchError((error) {
      print(error.toString());
      showMessage(
          message: error.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
      emit(CreateAccountErrorState());
    });
  }

  Future storeUserData(
      {required String name,
      required String phone,
      required String uId,
      required String email,
        required String age,
        required String birthDate,
        required String gender
      }) async {
    await WebServicesSignup.sendUserData(
            name: name, phone: phone, uId: uId, email: email,gender:gender,age:age,birthDate:birthDate)
        .then((value) {
      print('database Store');
      emit(CreateAccountSuccessState());
    });
  }
}
