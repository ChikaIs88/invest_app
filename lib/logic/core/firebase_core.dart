import 'package:chipln/app/logger_init.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'firebase_cloud.dart';
import 'storage.dart';

/// Base Authentication for Firebase
///
/// This is where all the magic happens.Get everything
/// about sing in with email and password
abstract class BaseConfig<T> {
  Future<String?> signUpUser({String? email, String? password});
  Future<String?> signInUser({String? email, String? password});
  Future<String?> checkCurrentUser();
  Future<String?> prefrence({Map<String, dynamic>? data});
  Future<void> logOUt();
}

/// Firebase sign in with email and password class
///
/// This class contain all the method which is needed
/// for firebase sign with email
@Injectable(singleton: true)
class Authentication<T> extends BaseConfig<T> {
  // Intiallising firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final AddToDatabase add = AddToDatabase();

  @override
  Future<String> checkCurrentUser() async {
    userUid = auth.currentUser!.uid;
    return auth.currentUser != null ? auth.currentUser!.uid : '';
  }

  @override
  Future<void> logOUt() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    userUid = '';
    return _firebaseAuth.signOut();
  }

  @override
  Future<String?> signInUser({
    String? email,
    String? password,
  }) async {
    //  This is where all the magic for sign in with password happens
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      debugPrint(userCredential.toString());
      userUid = userCredential.user!.uid;
      await saveStorage('uid', userUid);
      await add.getUserData(id: userUid);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Assign the error to a variable
        apiError = 'The account $email does not exist';
        showToast(apiError);
      } else if (e.code == 'wrong-password') {
        // Assign the error to a variable
        apiError = 'The password provided is incorrect';
        showToast(apiError);
      }
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }

  @override
  Future<String?> signUpUser(
      {String? email, String? password, Map<String, dynamic>? info}) async {
    logger.i('signup::: Signing up user with [$email $password $info]');
    try {
      logger.i('signup:: creating the user profile');
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      logger.i('signup:: adding the user profile');
      await add.addUser(data: info, id: userCredential.user!.uid);
      userUid = userCredential.user!.uid;
      await add.getUserData(id: userUid);
      await saveStorage('uid', userCredential.user!.uid);

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // Assign the error to a snackBar
        apiError = 'The password provided is too weak.';
        showToast(apiError);
      } else if (e.code == 'email-already-in-use') {
        // Assign the error to a variable
        apiError = 'The account already exists for $email.';
        showToast(apiError);
      }
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }

  @override
  Future<String?> prefrence({Map<String, dynamic>? data}) async {
    try {
      await add.addUserPrefrence(data: data, id: userUid);
      return 'success';
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }
}
