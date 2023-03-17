import 'package:animalsshop/Business_logic_components/animal_cubit/animal_states.dart';
import 'package:animalsshop/constants/globelkeys.dart';
import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/texteditcontrollers.dart';
import 'package:animalsshop/views/widgets/iconButton_of_app.dart';
import 'package:animalsshop/views/widgets/materialButton_of_app.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:animalsshop/views/widgets/textformfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business_logic_components/animal_cubit/animal_cubit.dart';
import '../widgets/routes_screens.dart';

class AddAnimalScreen extends StatelessWidget {
  const AddAnimalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AnimalCubit(),
      child: BlocBuilder<AnimalCubit, AnimalStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const TextOfApp(
                text: 'Add Animal',
                font: 20,
              ),
              centerTitle: true,
              foregroundColor: Colors.black,
              leading: BackButton(
                onPressed: ()=>routesAndRemoveScreens(context: context, screen: 'homeScreen'),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: buildScreen(context,state)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildScreen(context,state) => Form(
      key: formKeyOfAnimal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dividerBetweenWidgets(height: 30),
          animalImageDesign(context),
          dividerBetweenWidgets(),
          TextFormFieldApp(
            hintText: 'Animal Name',
            prefixIcon: const Icon(Icons.drive_file_rename_outline),
            textInputType: TextInputType.name,
            textFormFieldController: nameAnimalController,
            textVerified: 'please enter animal name',
          ),
          dividerBetweenWidgets(),
          TextFormFieldApp(
            hintText: 'Age',
            prefixIcon: const Icon(Icons.date_range),
            textInputType: TextInputType.text,
            textFormFieldController: ageAnimalController,
            textVerified: 'please enter animal age',
          ),
          dividerBetweenWidgets(),
          TextFormFieldApp(
            hintText: 'Location',
            prefixIcon: const Icon(Icons.location_on),
            textInputType: TextInputType.text,
            textFormFieldController: locationAnimalController,
            textVerified: 'please enter animal location',
          ),
          dividerBetweenWidgets(),
          TextFormFieldApp(
            hintText: 'Price',
            prefixIcon: const Icon(Icons.price_change_outlined),
            textInputType: TextInputType.number,
            textFormFieldController: priceAnimalController,
            textVerified: 'please enter animal price',
          ),
          dividerBetweenWidgets(),
          TextFormFieldApp(
            hintText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone_android),
            textInputType: TextInputType.phone,
            textFormFieldController: phoneAnimalController,
            textVerified: 'please enter phone number',
          ),
          dividerBetweenWidgets(),
          ButtonOfApp(
              function: () {
                AnimalCubit.get(context).upLoadProfileImage(
                    name: nameAnimalController.text,
                    age: ageAnimalController.text,
                    location: locationAnimalController.text,
                    phoneNumber: phoneAnimalController.text,
                    price: priceAnimalController.text,
                );
                // AnimalCubit.get(context).upLoadProfileImage();
              },
              text: 'ADD ANIMAL'),
          dividerBetweenWidgets(),
          if (state is LoadingAnimalState)
            LinearProgressIndicator(),

        ],
      ),
    );

Widget dividerBetweenWidgets({double height = 15}) => SizedBox(
      height: height,
    );

Widget animalImageDesign(context) => Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          animalPicture(context),
          addAnimalImage(context),
        ],
      ),
    );
Widget animalPicture(context) =>  CircleAvatar(
  radius: 70,
  backgroundImage: AnimalCubit.get(context).animalImage == null
      ? const NetworkImage(
      'https://yt3.ggpht.com/UgLHVJF0BRvC0-UGYHipHjxEmTs5GIKT2y16niUWe78S7JjGx1YZvxNYMUqPiIUKbRE3u3BaUQ=s176-c-k-c0x00ffffff-no-rj')
      : FileImage(AnimalCubit.get(context).animalImage!) as ImageProvider,
);

Widget addAnimalImage(context) => CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: IconButtonOfApp(
        function: () =>AnimalCubit.get(context).getProfileImage(),
        icon: Icons.camera_alt,
        size: 25,
      ),
    );
