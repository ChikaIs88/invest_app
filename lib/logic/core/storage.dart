import 'package:chipln/logic/core/variable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//[Func] this allow us to save params to the users phone
Future<bool> saveStorage(key, value) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: key, value: value);
  return true;
}

//[Func] this allow us to get the saved params
Future<String> getStorage(key) async {
  const storage = FlutterSecureStorage();
  var value = await storage.read(key: key);
  return value!;
}

//[Func] this allow us to get the saved uid
Future<String> getUid() async {
  const storage = FlutterSecureStorage();
  var value = await storage.read(key: 'uid');
  if (value == null) {
    value = '';
  } else {
    userUid = value;
    userDetails = await storage.readAll();
  }

  return value;
}

//[Func] this allow us to get the user role
Future<String> getRole() async {
  const storage = FlutterSecureStorage();
  var value = await storage.read(key: 'role');
  if (value == null) {
    value = '';
  } else {
    role = value;
    userDetails = await storage.readAll();
  }
  return value;
}
