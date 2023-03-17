import 'package:animalsshop/Business_logic_components/profile_cubit/profile_cubit.dart';
import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/views/widgets/materialButton_of_app.dart';
import 'package:animalsshop/views/widgets/routes_screens.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business_logic_components/profile_cubit/profile_states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const TextOfApp(
              text: 'Profile',
              font: 20,
            ),
            centerTitle: true,
            foregroundColor: Colors.black,
            leading: BackButton(onPressed: () {
              routesAndRemoveScreens(context: context, screen: 'homeScreen');
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: buildScreen(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildScreen(context) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        profileImageDesign(),
        dividerBetweenWidgets(),
        TextOfApp(text: model!.name!, font: 18),
        dividerBetweenWidgets(height: 5),
        TextOfApp(text: model!.bio!, font: 15),
        dividerBetweenWidgets(height: 40),
        TextOfApp(
          text: 'Name: ${model!.name!}',
          font: 18,
        ),
        dividerBetweenWidgets(),
        TextOfApp(
          text: 'Email : ${model!.mail!}',
          font: 18,
        ),
        dividerBetweenWidgets(),
        TextOfApp(
          text: 'Birth Date : ${model!.birthDate!}',
          font: 18,
        ),
        dividerBetweenWidgets(),
        TextOfApp(text: 'Phone : ${model!.phone!}', font: 18),
        dividerBetweenWidgets(),
        TextOfApp(text: 'Gender : ${model!.gender!}', font: 18),
        dividerBetweenWidgets(),
        TextOfApp(text: 'Age : ${model!.age!}', font: 18),
        dividerBetweenWidgets(height: 30),
        actionsOfProfile(context)
      ],
    );

Widget profileImageDesign() => Stack(
      alignment: Alignment.bottomRight,
      children: [
        imageOfProfile(),
        addProfileImage(),
      ],
    );

Widget imageOfProfile() =>  CircleAvatar(
      radius: 55,
      backgroundImage: NetworkImage(model!.image!),
    );

Widget addProfileImage() => CircleAvatar(
      radius: 17,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.camera_alt_outlined,
        ),
        iconSize: 20,
      ),
    );

Widget dividerBetweenWidgets({double height = 10}) => SizedBox(
      height: height,
    );

Widget actionsOfProfile(context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        updateProfileData(context),
        const SizedBox(
          width: 10,
        ),
        signupAction(context)
      ],
    );

Widget signupAction(context) => Expanded(
    child: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(offset: Offset(5, 8), blurRadius: 18)]),
        child: ButtonOfApp(
            function: () {
              ProfileCubit.get(context).signupAccount(context);
            },
            text: 'Sign up')));

Widget updateProfileData(context) => Expanded(
    child: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(offset: Offset(5, 8), blurRadius: 18)]),
        child: ButtonOfApp(
            function: () {
              routesBetweenScreens(
                  context: context, screen: 'updateProfileScreen');
            },
            text: 'Update Profile')));
