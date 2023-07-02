import 'package:get_storage/get_storage.dart';

class LocalStorage{
  static final __getStrorage=GetStorage();
  LocalStorage._privateConstructor();
  static final LocalStorage instance=LocalStorage._privateConstructor();
static String? _accessToken;
  static void setToken({required String token}){
      _accessToken=token;
    __getStrorage.write("00xxff0x", token);
  }

 static String? getToken(){
    _accessToken??=__getStrorage.read("00xxff0x");
    return _accessToken;
  }

  static void removeToken(){
    __getStrorage.remove("00xxff0x");
  }



}

