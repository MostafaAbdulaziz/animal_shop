import 'package:animalsshop/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WebServicesSignup {
  static Future<UserCredential>? createAccount(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

   static Future sendUserData(
      {required String name,
      required String phone,
      required String uId,
      required String email,
      required String gender,
        required String age,
        required String birthDate,
      }) async{
    CreateUserModel userModel = CreateUserModel(
        image: 'https://img.freepik.com/free-photo/friendly-smart-basenji-dog-giving-his-paw-close-up-isolated-white_346278-1626.jpg?w=1060&t=st=1666027790~exp=1666028390~hmac=a01ab40c896fd572c77a9e07e9781af741a89be575885708e86741a10bf73824',
        bio: 'Choose People Who choose you',
        mail: email,
        name: name,
        phone: phone,
        uId: uId,
       age: age,
      birthDate: birthDate,
      gender: gender
    );
     await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap());
  }
}
