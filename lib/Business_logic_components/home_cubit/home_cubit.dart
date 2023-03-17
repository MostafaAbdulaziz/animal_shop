import 'package:animalsshop/Business_logic_components/home_cubit/home_states.dart';
import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/constants/texteditcontrollers.dart';
import 'package:animalsshop/data_layer/web_services_home.dart';
import 'package:animalsshop/models/animal_model.dart';
import 'package:animalsshop/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<AnimalModel> allAnimals = [];

  Future getAllAnimals() async {
    emit(LoadingDataState());
    WebServicesHome.getAllAnimal().then((value) {
      value.docs.forEach((element) {
        allAnimals.add(AnimalModel.fromJson(element.data()));
        emit(GetDataSuccessState());
      });
    });
  }


  //CreateUserModel? model;
  Future<void> getUserData() async {
    emit(LoadingGetUserDataState());
    WebServicesHome.getUserData().then((value) {
      model = CreateUserModel.fromJson(value.data()!.cast());
      updateNameController.text = model!.name!;
      updateEmailController.text = model!.mail!;
      updatePhoneController.text = model!.phone!;
      updateBioController.text = model!.bio!;
      updateGenderController.text = model!.gender!;
      updateAgeController.text = model!.age!;
      updateBirthDateController.text = model!.birthDate!;
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState());
    });
  }

  List<AnimalModel> searchAnimals = [];

  void searchAboutName(String valueOfSearch) {
    searchAnimals = allAnimals
        .where(
            (element) => element.name!.toLowerCase().startsWith(valueOfSearch))
        .toList();
    emit(GetSearchAnimalState());
  }
  void searchAboutAge(String valueOfSearch) {
    searchAnimals = allAnimals
        .where(
            (element) => element.age!.toLowerCase().startsWith(valueOfSearch))
        .toList();
    emit(GetSearchAnimalState());
  }
  void searchAboutLocation(String valueOfSearch) {
    searchAnimals = allAnimals
        .where(
            (element) => element.location!.toLowerCase().startsWith(valueOfSearch))
        .toList();
    emit(GetSearchAnimalState());
  }
  void searchAboutAnimal(String valueOfSearch){
    if(searchType=='name'){
      searchAboutName(valueOfSearch);
    }else if(searchType=='age'){
      searchAboutAge(valueOfSearch);
    }else{
      searchAboutLocation(valueOfSearch);

    }

  }
}
