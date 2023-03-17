import 'package:animalsshop/Business_logic_components/login_cubit/login_cubit.dart';
import 'package:animalsshop/Business_logic_components/login_cubit/login_states.dart';
import 'package:animalsshop/constants/globelkeys.dart';
import 'package:animalsshop/constants/texteditcontrollers.dart';
import 'package:animalsshop/views/widgets/materialButton_of_app.dart';
import 'package:animalsshop/views/widgets/routes_screens.dart';
import 'package:animalsshop/views/widgets/textButton_app.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:animalsshop/views/widgets/textformfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/iconButton_of_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                child: buildScreen(context: context,state:state),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildScreen({required BuildContext context,state}) => Form(
      key: formKeyOfLogin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextOfApp(
            text: 'LOGIN',
            font: 40,
          ),
          TextOfApp(
            text: 'login now to browse our hot offers',
            color: Colors.black.withOpacity(0.75),
            font: 17,
          ),
          dividerComponents(height: 30),
          TextFormFieldApp(
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email),
            textInputType: TextInputType.emailAddress,
            textFormFieldController: loginEmailController,
            textVerified: 'please enter your mail',
          ),
          dividerComponents(height: 15),
          TextFormFieldApp(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.security),
            suffixIcon: IconButtonOfApp(
                icon: LoginCubit.get(context).iconPass,
                function: () =>
                    LoginCubit.get(context).changeIconAndSecurePass()),
            textInputType: TextInputType.text,
            textFormFieldController: loginPasswordController,
            textVerified: 'please enter your password',
            obscureText: LoginCubit.get(context).isNotVisiblePass,
          ),
          dividerComponents(height: 15),
          state is LoadingLoginState
              ? loadingLoginAction()
              : loginButton(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextOfApp(text: 'are yoy don\'t have an account?'),
              TextButtonApp(
                  function: () => routesAndRemoveScreens(
                      context: context, screen: 'signupScreen'),
                  text: 'Register')
            ],
          )
        ],
      ),
    );


Widget dividerComponents({required double height})=> SizedBox(
  height: height,
);

Widget loadingLoginAction()=>const Center(
  child: CircularProgressIndicator(),
);

Widget loginButton(context)=>ButtonOfApp(
    function: ()=>loginAction(context),
    text: 'LOGIN');

void loginAction(context){
  if (formKeyOfLogin.currentState!.validate()) {
    LoginCubit.get(context).loginAccount(
        email: loginEmailController.text,
        password: loginPasswordController.text,context: context);
  }
}
