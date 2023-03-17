import 'package:firebase_auth/firebase_auth.dart';

class WebServicesProfile{
  static Future<void> logoutAccount() async{
    await FirebaseAuth.instance.signOut();
  }
}