import 'package:animalsshop/models/animal_model.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:flutter/material.dart';

import '../widgets/iconButton_of_app.dart';

class AnimalScreen extends StatelessWidget {
  final AnimalModel animalModel;

  const AnimalScreen(
      {Key? key,
     required this.animalModel
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const TextOfApp(text: 'Animal', font: 22),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: buildScreen(
                name:animalModel.name!,
                age:animalModel.age!,
                phone: animalModel.phoneNumber!,
                location: animalModel.location!,
                price: animalModel.price!,
                image: animalModel.image!
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildScreen(
        {required String name,
        required String age,
        required String location,
        required String price,
        required String phone,
        required String image,
        }) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        animalPicture(image:image),
        dividerBetweenWidgets(),
        TextOfApp(
          text: 'name : $name',
          font: 25,
        ),
        dividerBetweenWidgets(),
         TextOfApp(
          text: 'Age : $age',
          font: 25,
        ),
        dividerBetweenWidgets(),
         TextOfApp(
          text: 'location : $location',
          font: 25,
        ),
        dividerBetweenWidgets(),
         TextOfApp(
          text: 'price : $price EG',
          font: 25,
        ),
        dividerBetweenWidgets(),
         TextOfApp(
          text: 'phone Number : $phone',
          font: 25,
        ),
        dividerBetweenWidgets()
      ],
    );

Widget dividerBetweenWidgets({double height = 15}) => SizedBox(
      height: height,
    );

Widget animalPicture({required String image}) =>  Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage(image),
      ),
    );
