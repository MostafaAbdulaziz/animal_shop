import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
static  SharedPreferences? sharedPreferences;

//save data
static Future<dynamic> savedData({
  required String key,
  required dynamic value
})async{
  sharedPreferences=await SharedPreferences.getInstance();
  if(value is String)
    {
      return await sharedPreferences?.setString(key, value);
    }
  if(value is bool)
    {
      return await sharedPreferences?.setBool(key, value);
    }
}

//get data
static Future<dynamic> getData({required String key})async
{
  sharedPreferences=await SharedPreferences.getInstance();
  return sharedPreferences?.get(key);
}


static  Future<bool?> removeData({required String key})async
{
  sharedPreferences=await SharedPreferences.getInstance();
  return sharedPreferences!.remove(key);
}
}