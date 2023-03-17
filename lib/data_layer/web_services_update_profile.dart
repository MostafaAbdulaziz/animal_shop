import 'package:animalsshop/constants/maps.dart';
import 'package:animalsshop/constants/strings.dart';
import 'package:animalsshop/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WebServicesUpdateProfile {
  static Future<void> updateUserData(
      {required String uId,
      String? name,
      String? mail,
      String? phone,
      String? birthData,
      String? bio,
      String? gender,
      String? age,
      String? password,
      String? image}) async {
    CreateUserModel userModel = CreateUserModel(
        age: age??model!.age,
        name: name??model!.name,
        mail: mail??model!.mail,
        phone: phone??model!.phone,
        bio: bio??model!.bio,
        birthDate: birthData??model!.birthDate,
        gender: gender??model!.gender,
        uId: uId,
        image: image ?? model!.image);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(userModel.toMap());
    //await updateEmail(mail: mail);
    await updatePassword(password: password!);
  }

  static Future<void> updateEmail({required String mail}) async {
    FirebaseAuth.instance.currentUser!.updateEmail(mail);
  }

  static Future<void> updatePassword({required String password}) async {
    FirebaseAuth.instance.currentUser!.updatePassword(password);
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
  }
}
