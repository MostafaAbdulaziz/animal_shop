import 'package:animalsshop/Business_logic_components/home_cubit/home_cubit.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/constants/texteditcontrollers.dart';
import 'package:animalsshop/views/widgets/radio_button_of_search.dart';
import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:animalsshop/views/widgets/textformfield_app.dart';

class ContainerOfHomePage extends StatefulWidget {
  const ContainerOfHomePage({Key? key}) : super(key: key);

  @override
  State<ContainerOfHomePage> createState() => _ContainerOfHomePageState();
}

class _ContainerOfHomePageState extends State<ContainerOfHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            searchAboutAnimal(context),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio(value: 'name', groupValue: searchType, onChanged: (val){
                        setState(() {
                          searchType=val!;
                        });
                      },activeColor: Colors.white,),
                      const TextOfApp(text: 'Name')
                    ],
                  ),
                ),
                Expanded(child: Row(
                  children: [
                    Radio(value: 'age', groupValue: searchType, onChanged: (val){
                      setState(() {
                        searchType=val!;
                      });
                    },activeColor: Colors.white,),
                    const TextOfApp(text: 'Age')
                  ],
                ),),
                Expanded(child: Row(
                  children: [
                    Radio(value: 'location', groupValue: searchType, onChanged: (val){
                      setState(() {
                        searchType=val!;
                      });
                    },activeColor: Colors.white,),
                    const TextOfApp(text: 'Location')
                  ],
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget searchAboutAnimal(context)=>SizedBox(
  width: double.infinity,
  child: TextFormFieldApp(
      hintText: 'Search',
      prefixIcon: const Icon(Icons.search),
      textInputType: TextInputType.name,
      textFormFieldController: searchController,
    onChange: (String value){
        HomeCubit.get(context).searchAboutAnimal(value);
    },
  ),
);




