import 'package:animalsshop/Business_logic_components/home_cubit/home_cubit.dart';
import 'package:animalsshop/Business_logic_components/update_profile_cubit/update_profile_cubit.dart';
import 'package:animalsshop/Business_logic_components/update_profile_cubit/update_profile_states.dart';
import 'package:animalsshop/constants/globelkeys.dart';
import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/texteditcontrollers.dart';
import 'package:animalsshop/views/widgets/flutter_toast.dart';
import 'package:animalsshop/views/widgets/iconButton_of_app.dart';
import 'package:animalsshop/views/widgets/materialButton_of_app.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:animalsshop/views/widgets/textformfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UpdateProfileCubit(),
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileStates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  UpdateProfileCubit.get(context).getUserData(context);
                }),
            title: const TextOfApp(
              text: 'Update Profile',
              font: 18,
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SingleChildScrollView(
                  child: buildScreen(context,state),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildScreen(context,state) => Form(
      key: formKeyOfUpdateProfile,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: profileImageDesign(context),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormFieldApp(
            hintText: 'Name',
            prefixIcon: const Icon(Icons.person_add_outlined),
            textInputType: TextInputType.name,
            textFormFieldController: updateNameController,
            textVerified: 'please enter your name',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email),
            textInputType: TextInputType.emailAddress,
            textFormFieldController: updateEmailController,
            textVerified: 'please enter your email',
            //data: 'UpdateProfileCubit.get(context).model!.mail',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone_android),
            textInputType: TextInputType.phone,
            textFormFieldController: updatePhoneController,
            textVerified: 'please enter your phone number',
            //data: 'UpdateProfileCubit.get(context).model!.phone',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Bio',
            prefixIcon: const Icon(Icons.description),
            textInputType: TextInputType.text,
            textFormFieldController: updateBioController,
            textVerified: 'please enter your phone number',
            //data: 'UpdateProfileCubit.get(context).model!.bio',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.password),
            suffixIcon: IconButtonOfApp(
                icon: UpdateProfileCubit.get(context).iconPass,
                function: () =>
                    UpdateProfileCubit.get(context).changeIconAndSecurePass()),
            textInputType: TextInputType.visiblePassword,
            textFormFieldController: updatePasswordController,
            obscureText: UpdateProfileCubit.get(context).isNotVisiblePass,
            textVerified: 'please enter password',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Confirm Password',
            prefixIcon: const Icon(Icons.password),
            suffixIcon: IconButtonOfApp(
                icon: UpdateProfileCubit.get(context).iconConPass,
                function: () => UpdateProfileCubit.get(context)
                    .changeIconAndSecureConPass()),
            textInputType: TextInputType.visiblePassword,
            textFormFieldController: updateConfPassController,
            obscureText: UpdateProfileCubit.get(context).isNotVisibleConPass,
            textVerified: 'please enter confirm password',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Gender',
            prefixIcon: const Icon(Icons.people_alt_outlined),
            textInputType: TextInputType.text,
            textFormFieldController: updateGenderController,
            textVerified: 'please enter gender',
            //data: 'UpdateProfileCubit.get(context).model!.gender',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Age',
            prefixIcon: const Icon(Icons.date_range),
            textInputType: TextInputType.number,
            textFormFieldController: updateAgeController,
            textVerified: 'please enter age',
            //data: 'UpdateProfileCubit.get(context).model!.age',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldApp(
            hintText: 'Birth Date',
            prefixIcon: const Icon(Icons.timer_sharp),
            textInputType: TextInputType.number,
            textFormFieldController: updateBirthDateController,
            textVerified: 'please enter birth date',
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: ButtonOfApp(
                    function: () {
                      if (formKeyOfUpdateProfile.currentState!.validate()) {
                        if (updatePasswordController.text ==
                            updateConfPassController.text) {
                          UpdateProfileCubit.get(context).updateUserData(
                              name: updateNameController.text,
                              mail: updateEmailController.text,
                              phone: updatePhoneController.text,
                              password: updatePasswordController.text,
                              birthData: updateBirthDateController.text,
                              gender: updateGenderController.text,
                              bio: updateBioController.text,
                              age: updateAgeController.text);
                          UpdateProfileCubit.get(context)
                              .updateEmail(mail: updateEmailController.text);
                        } else {
                          showMessage(
                              message: 'password and confirm password not equal',
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                      }
                    },
                    text: 'Update Date'),
              ),
              if(state is LoadingUpdateDataState)
                LinearProgressIndicator(),
              if(UpdateProfileCubit.get(context).profileImage!=null)
                const SizedBox(width: 10,),
              if(UpdateProfileCubit.get(context).profileImage!=null)
                Expanded(
                  child: ButtonOfApp(
                      function: ()=>UpdateProfileCubit.get(context).upLoadProfileImage(),
                      text: 'Update Image'),
                ),
              if(state is LoadingUpdateImageState)
                LinearProgressIndicator(),
              
            ],
          )
        ],
      ),
    );

Widget profileImageDesign(context) => Stack(
      alignment: Alignment.bottomRight,
      children: [
        imageOfProfile(context),
        addProfileImage(context),
      ],
    );

Widget imageOfProfile(context) => CircleAvatar(
      radius: 70,
      backgroundImage: UpdateProfileCubit.get(context).profileImage == null
          ? NetworkImage(model!.image!)
          : FileImage(UpdateProfileCubit.get(context).profileImage!)
              as ImageProvider,
    );

Widget addProfileImage(context) => CircleAvatar(
      radius: 17,
      child: IconButton(
        onPressed: () => UpdateProfileCubit.get(context).changeProfileImage(),
        icon: const Icon(
          Icons.camera_alt_outlined,
        ),
        iconSize: 20,
      ),
    );
