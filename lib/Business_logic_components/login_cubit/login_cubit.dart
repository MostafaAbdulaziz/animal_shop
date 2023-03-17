import 'package:animalsshop/Business_logic_components/login_cubit/login_states.dart';
import 'package:animalsshop/cache_Helper/shared_preferaned.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/data_layer/web_servies_login.dart';
import 'package:animalsshop/views/widgets/flutter_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/widgets/routes_screens.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData iconPass = Icons.visibility_off;
  bool isNotVisiblePass = true;

  void changeIconAndSecurePass() {
    isNotVisiblePass = !isNotVisiblePass;
    iconPass = isNotVisiblePass ? Icons.visibility_off : Icons.visibility;
    emit(ChangeIconLoginState());
  }

  void loginAccount(
      {required String email, required String password, context}) async {
    emit(LoadingLoginState());
    WebServicesLogin.loginAccount(email: email, password: password)
        .then((value) async {
      await CacheHelper.savedData(
          key: 'userId', value: value.user!.uid);
      userId=await CacheHelper.getData(key: 'userId');
      routesAndRemoveScreens(context: context, screen: 'homeScreen');
      showMessage(
          message: 'Login success',
          backgroundColor: Colors.green,
          textColor: Colors.white);

      emit(LoginAccountSuccessState());
    }).catchError((error) {
      showMessage(
          message: error.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
      emit(LoginAccountErrorState());
    });
  }
}
