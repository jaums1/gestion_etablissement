
// import 'package:get_storage/get_storage.dart';

// class TLocalStorage {
  
//   static final TLocalStorage _instance=TLocalStorage._internal();

//   factory TLocalStorage(){
//     return _instance;
//   }

// TLocalStorage._internal();

// final _storage=GetStorage();

// //// GENERIC METHOD SAVE DATA

// Future<void> savaData<T>(String key,T value) async{
//   await _storage.write(key, value);
// }


// //// GENERIC METHOD READ DATA

// T? read<T>(String key){
//  return _storage.read(key);
// }

// //// GENERIC METHOD REMOVE DATA

// Future<void> removeData<T>(String key) async{
//   await _storage.remove(key);
// }

// //// GENERIC METHOD REMOVE ALL DATA

// Future<void> clearAll() async{
//   await _storage.erase();
// }

// }