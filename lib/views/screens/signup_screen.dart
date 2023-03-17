import 'package:animalsshop/Business_logic_components/signup_cubit/signup_cubit.dart';
import 'package:animalsshop/Business_logic_components/signup_cubit/signup_states.dart';
import 'package:animalsshop/constants/globelkeys.dart';
import 'package:animalsshop/constants/texteditcontrollers.dart';
import 'package:animalsshop/views/widgets/flutter_toast.dart';
import 'package:animalsshop/views/widgets/iconButton_of_app.dart';
import 'package:animalsshop/views/widgets/materialButton_of_app.dart';
import 'package:animalsshop/views/widgets/routes_screens.dart';
import 'package:animalsshop/views/widgets/textButton_app.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:animalsshop/views/widgets/textformfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(),
      child: BlocBuilder<SignupCubit, SignupStates>(
        builder: (context, state) =>
            Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SingleChildScrollView(
                      child: buildScreen(context, state),
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

Widget buildScreen(context, state) =>
    Form(
      key: formKeyOfSignup,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextOfApp(
            text: 'SIGN UP',
            font: 40,
          ),
          dividerComponents(height: 30),
          TextFormFieldApp(
            hintText: 'Name',
            prefixIcon: const Icon(Icons.person_add_outlined),
            textInputType: TextInputType.name,
            textFormFieldController: nameController,
            textVerified: 'please enter your name',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email),
            textInputType: TextInputType.emailAddress,
            textFormFieldController: signupEmailController,
            textVerified: 'please enter your email',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone_android),
            textInputType: TextInputType.phone,
            textFormFieldController: phoneController,
            textVerified: 'please enter your phone number',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.password),
            suffixIcon: iconButtonPass(context),
            textInputType: TextInputType.visiblePassword,
            textFormFieldController: signupPasswordController,
            obscureText: SignupCubit
                .get(context)
                .isNotVisiblePass,
            textVerified: 'please enter password',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Confirm Password',
            prefixIcon: const Icon(Icons.password),
            suffixIcon: iconButtonConfPass(context),
            textInputType: TextInputType.visiblePassword,
            textFormFieldController: confirmPasswordController,
            obscureText: SignupCubit
                .get(context)
                .isNotVisibleConPass,
            textVerified: 'please enter confirm password',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Gender',
            prefixIcon: const Icon(Icons.people_alt_outlined),
            textInputType: TextInputType.text,
            textFormFieldController: genderController,
            textVerified: 'please enter gender',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Age',
            prefixIcon: const Icon(Icons.date_range),
            textInputType: TextInputType.number,
            textFormFieldController: ageController,
            textVerified: 'please enter age',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Birth Date',
            prefixIcon: const Icon(Icons.timer_sharp),
            textInputType: TextInputType.number,
            textFormFieldController: birthDateController,
            textVerified: 'please enter birth date',
          ),
          dividerComponents(height: 15),
          state is LoadingCreateAccountState
              ? loadingRegister()
              : registerButton(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextOfApp(text: 'I have an account?'),
              TextButtonApp(
                  function: () =>
                      routesAndRemoveScreens(
                          context: context, screen: 'loginScreen'),
                  text: 'Login')
            ],
          )
        ],
      ),
    );


Widget dividerComponents({required double height})=>SizedBox(
  height: height,
);

Widget loadingRegister()=>const Center(
  child: CircularProgressIndicator(),
);

Widget registerButton(context)=>ButtonOfApp(
    function: ()=>registerAction(context),
    text: 'SIGN UP');


void registerAction(context){
  if (formKeyOfSignup.currentState!.validate()) {
    if (signupPasswordController.text ==
        confirmPasswordController.text) {
      registerActionSuc(context);

    } else {
      messagePassAndConPassNotEqual();
    }
  }
}

void registerActionSuc(context){
  SignupCubit.get(context).createAccount(
      email: signupEmailController.text,
      password: signupPasswordController.text,
      context: context,
      phone: phoneController.text,
      name: nameController.text,
      gender: genderController.text,
      age: ageController.text,
      birthDate: birthDateController.text

  );
}

void messagePassAndConPassNotEqual(){
  showMessage(message: 'password not equal confirm password',
      backgroundColor: Colors.red,
      textColor: Colors.white);
}

Widget iconButtonPass(context)=>IconButtonOfApp(
    icon: SignupCubit
        .get(context)
        .iconPass,
    function: () =>
        SignupCubit.get(context).changeIconAndSecurePass());

Widget iconButtonConfPass(context)=>IconButtonOfApp(
    icon: SignupCubit
        .get(context)
        .iconConPass,
    function: () =>
        SignupCubit.get(context).changeIconAndSecureConPass());