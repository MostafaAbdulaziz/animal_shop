import 'package:animalsshop/Business_logic_components/home_cubit/home_cubit.dart';
import 'package:animalsshop/Business_logic_components/home_cubit/home_states.dart';
import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/texteditcontrollers.dart';
import 'package:animalsshop/views/widgets/animal_view.dart';
import 'package:animalsshop/views/widgets/container_of_homepage.dart';
import 'package:animalsshop/views/widgets/routes_screens.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()
        ..getAllAnimals()
        ..getUserData(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            leading: InkWell(
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3, left: 3),
                child: accountImage(state),
              ),
              onTap: () => routesBetweenScreens(
                  context: context, screen: 'profileScreen'),
            ),
            title: state is LoadingGetUserDataState
                ? const TextOfApp(
                    text: 'loading ...',
                    font: 17,
                  )
                : TextOfApp(
                    text: model!.name!,
                    font: 17,
                  ),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: buildScreen(context, state),
          ),
          floatingActionButton: addAnimalAction(context),
        ),
      ),
    );
  }
}

Widget accountImage(state) => CircleAvatar(
      radius: 25,
      backgroundImage: state is LoadingGetUserDataState
          ? const NetworkImage(
              'https://yt3.ggpht.com/UgLHVJF0BRvC0-UGYHipHjxEmTs5GIKT2y16niUWe78S7JjGx1YZvxNYMUqPiIUKbRE3u3BaUQ=s176-c-k-c0x00ffffff-no-rj')
          : NetworkImage('${model!.image}'),
    );

Widget buildScreen(context, state) => Column(
      children: [
        const ContainerOfHomePage(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: state is LoadingDataState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : listOfAnimals(context),
        )
      ],
    );

Widget listOfAnimals(context) => notFoundAnimal(context);

Widget addAnimalAction(context) => FloatingActionButton(
      child: const Icon(
        Icons.add,
        size: 30,
      ),
      onPressed: () =>
          routesAndRemoveScreens(context: context, screen: 'addAnimalScreen'),
    );


 homeBodyList(context,index){
  if(HomeCubit.get(context).searchAnimals.isEmpty)
    {
      return ItemAnimals(model: HomeCubit.get(context).allAnimals[index]);
    }
  else
    {
      return ItemAnimals(model: HomeCubit.get(context).searchAnimals[index]);
    }
}


searchAnimalNotFound(context){
   if(searchController.text.isNotEmpty && HomeCubit.get(context).searchAnimals.isEmpty){
     return  const TextOfApp(text: 'There is no animal with that name',font: 20,color: Colors.grey,);
   }else{
     return GridView.builder(
       shrinkWrap: true,
       physics: const NeverScrollableScrollPhysics(),
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         crossAxisSpacing: 5,
         mainAxisSpacing: 5,
         childAspectRatio: 2 / 3,
       ),
       itemBuilder: (context,index)=>homeBodyList(context,index),
       itemCount: HomeCubit.get(context).searchAnimals.isEmpty
           ? HomeCubit.get(context).allAnimals.length
           : HomeCubit.get(context).searchAnimals.length,
     );
   }

}

notFoundAnimal(context){
   if(HomeCubit.get(context).allAnimals.isNotEmpty){
     return searchAnimalNotFound(context);
   }else{
     return const Center(
       child: TextOfApp(text: 'There are no animals for sale',font: 20,color: Colors.grey,),
     );
   }
}