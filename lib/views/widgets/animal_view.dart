import 'package:animalsshop/models/animal_model.dart';
import 'package:animalsshop/views/screens/animal_screen.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:flutter/material.dart';

class ItemAnimals extends StatelessWidget {
  final AnimalModel model;

  const ItemAnimals({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: GridTile(
          footer: animalName(model),
          child: animalPicture(model),
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => AnimalScreen(animalModel: model,)),
      ),
    );
  }
}

Widget animalName(AnimalModel model) => Container(
      width: double.infinity,
      color: Colors.black.withOpacity(0.6),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextOfApp(
        text: model.name!,
        color: Colors.white,
        font: 20,
      ),
    );

Widget animalPicture(AnimalModel model) => Image.network(
      model.image!,
      fit: BoxFit.fill,
    );
