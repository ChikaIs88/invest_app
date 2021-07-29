//this carries out the tasks in the firebase cloud and manages errors

import 'dart:io';

import 'package:chipln/app/logger_init.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'firebase_cloud.dart';
import 'storage.dart';

/// Base Authentication for Firebase
///
/// This is where all the magic happens.Get everything
/// about sing in with email and password
abstract class BaseConfig<T> {
  Future<String?> signUpUser({String? email, String? password});
  Future<String?> signUpCompanyUser({String? email, String? password});
  Future<String?> signInUser({String? email, String? password});
  Future<String?> signInCompanyUser({String? email, String? password});
  Future<String?> checkCurrentUser();
  Future<String?> prefrence({Map<String, dynamic>? data});
  Future<String?> info({Map<String, dynamic>? data});
  Future<String?> intrested({Map<String, dynamic>? data});
  Future<String?> package({Map<String, dynamic>? data});
  Future<String?> downloadImageURL({id});
  Future<String?> notification({
    Map<String, dynamic>? data,
  });
  Future<void> logOUt();
}

/// Firebase sign in with email and password class
///
/// This class contain all the method which is needed
/// for firebase sign with email
@Injectable(singleton: true) //for other files to use it with ease
class FirebaseConfiguration<T> extends BaseConfig<T> {
  // Intiallising firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final AddToDatabase add = AddToDatabase();
  CollectionReference _companyInfo =
      FirebaseFirestore.instance.collection('info');
  CollectionReference _company =
      FirebaseFirestore.instance.collection('company');

  // @Method
  // checking current user
  // checkCurrentUser()
  @override
  Future<String> checkCurrentUser() async {
    userUid = auth.currentUser!.uid;
    return auth.currentUser != null ? auth.currentUser!.uid : '';
  }

  // @Method
  // loging current user out
  // logOUt()
  @override
  Future<void> logOUt() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    userUid = '';
    return _firebaseAuth.signOut();
  }

  // @Method
  // signing in investor  User
  // signInUser()
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
      await add.getUserPrefrence(id: userUid);
      await saveStorage('role', 'user');
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const storage = FlutterSecureStorage();
        await storage.deleteAll();
        userUid = '';
        // Assign the error to a variable
        apiError = 'The account $email does not exist';
        showToast(apiError);
      } else if (e.code == 'wrong-password') {
        const storage = FlutterSecureStorage();
        await storage.deleteAll();
        userUid = '';
        // Assign the error to a variable
        apiError = 'The password provided is incorrect';
        showToast(apiError);
      }
    } catch (e) {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
      userUid = '';
      apiError = '$e';
      showToast(apiError);
    }
  }

  // @Method
  // signing up investor  User
  // signUpUser()
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

      await saveStorage('role', 'user');
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

  // @Method
  // adding up investor  User prefrence
  // prefrence({Map<String, dynamic>? data})
  @override
  Future<String?> prefrence({Map<String, dynamic>? data}) async {
    try {
      await add.addUserPrefrence(data: data, id: userUid);
      await add.getUserPrefrence(id: userUid);
      return 'success';
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }

  // @Method
  // adding up company package
  // package({Map<String, dynamic>? data})
  @override
  Future<String?> package({Map<String, dynamic>? data}) async {
    try {
      await add.addPackage(data: data, id: userUid);
      return 'success';
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }

  // @Method
  // adding up user intrested package
  // intrested({Map<String, dynamic>? data, productId})
  @override
  Future<String?> intrested({Map<String, dynamic>? data, productId}) async {
    try {
      await add.addintrestedPackage(
          data: data, id: userUid, productId: productId);
      return 'success';
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }

  // @Method
  // adding up notification
  // notification({Map<String, dynamic>? data})
  @override
  Future<String?> notification({
    Map<String, dynamic>? data,
  }) async {
    try {
      await add.addNotification(data: data);
      return 'success';
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }

  // @Method
  // signing up company user
  // signUpCompanyUser({String? email, String? password, info})
  @override
  Future<String?> signUpCompanyUser(
      {String? email, String? password, info}) async {
    try {
      logger.i('signup:: creating the user profile');
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      logger.i('signup:: adding the user profile');
      await add.addCompanyUser(data: info, id: userCredential.user!.uid);
      userUid = userCredential.user!.uid;
      await add.getCompanyUserData(id: userUid);

      await saveStorage('uid', userCredential.user!.uid);
      await saveStorage('role', 'company');
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

  // @Method
  // adding up company user info
  // info({Map<String, dynamic>? data, File? imageFile})
  @override
  Future<String?> info({Map<String, dynamic>? data, File? imageFile}) async {
    try {
      await add.handleUploadImage(imageFile, userUid);
      await add.addCompanyInfo(data: data, id: userUid);
      return 'success';
    } catch (e) {
      apiError = '$e';
      showToast(apiError);
    }
  }

  // @Method
  // signing in company user
  // signInCompanyUser({String? email, String? password})
  @override
  Future<String?> signInCompanyUser({String? email, String? password}) async {
    //  This is where all the magic for sign in with password happens
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      debugPrint(userCredential.toString());
      userUid = userCredential.user!.uid;
      await saveStorage('uid', userUid);
      await add.getCompanyUserData(id: userUid);
      await saveStorage('role', 'company');
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const storage = FlutterSecureStorage();
        await storage.deleteAll();
        userUid = '';
        // Assign the error to a variable
        apiError = 'The account $email does not exist';
        showToast(apiError);
      } else if (e.code == 'wrong-password') {
        const storage = FlutterSecureStorage();
        await storage.deleteAll();
        userUid = '';
        // Assign the error to a variable
        apiError = 'The password provided is incorrect';
        showToast(apiError);
      }
    } catch (e) {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
      userUid = '';
      apiError = '$e';
      showToast(apiError);
    }
  }

// @Method
  // getting Image url
  // downloadImageURL({id})
  @override
  Future<String?> downloadImageURL({id}) async {
    var image = await add.getImage(id: id);
    return image;
  }

  Future<dynamic> getCompanyUserData(id) async {
    var data = await _companyInfo.doc(id).get();
    return data.data();
  }
   Future<dynamic> getCompanyUserInfo(id) async {
    var data = await _company.doc(id).get();
    return data.data();
  }
}
