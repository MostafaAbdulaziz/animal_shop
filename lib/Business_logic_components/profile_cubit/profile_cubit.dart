import 'package:animalsshop/Business_logic_components/home_cubit/home_cubit.dart';
import 'package:animalsshop/Business_logic_components/profile_cubit/profile_states.dart';
import 'package:animalsshop/cache_Helper/shared_preferaned.dart';
import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/data_layer/web_services_profile.dart';
import 'package:animalsshop/views/widgets/flutter_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/widgets/routes_screens.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  void signupAccount(context) async{
    await WebServicesProfile.logoutAccount().then((value)async {
      showMessage(message: 'logout done',
          backgroundColor: Colors.green,
          textColor: Colors.white);
      print(userId);
      CacheHelper.removeData(key: 'userId');
      routesAndRemoveScreens(context: context,screen: 'loginScreen');
      emit(LogoutAccountSuccessState());
    }).catchError((error) {
      showMessage(message: error.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
      emit(LogoutAccountErrorState());
    });
  }

  Future<void> getUserData(context) async{
    await HomeCubit.get(context).getUserData();
  }
}
