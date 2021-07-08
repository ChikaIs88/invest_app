import 'dart:io';

import 'package:chipln/logic/core/storage.dart';
import 'package:chipln/models/company_user_model/company_user_model.dart';
import 'package:chipln/models/image_model/image_model.dart';
import 'package:chipln/models/investor_user_model/investor_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'variable.dart';

/// Base of the configuration
abstract class Database {
  // =======================Add user========================
  Future<void> addUser();
  Future<void> addCompanyUser();

  //======================= Get user data =======================
  Future<void> getUserData();
  Future<void> getCompanyUserData();
  Future<void> getImage({String? id});

  //======================= Below Method are for adding sub pres =============
  Future<void> addUserPrefrence();
  Future<void> addCompanyInfo();
  Future<void> addPackage();
  Future<void> addintrestedPackage({String? id, Map<String, dynamic>? data});
  Future<void> addNotification(
      {String? id, Map<String, dynamic>? data, productId});
}

///=========================This class is use to add data to your firestore.==================
class AddToDatabase extends Database {
  // Create a CollectionReference called users that references
  //the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('investor');
  CollectionReference company =
      FirebaseFirestore.instance.collection('company');
  CollectionReference image = FirebaseFirestore.instance.collection('images');
  CollectionReference info = FirebaseFirestore.instance.collection('info');
  CollectionReference package =
      FirebaseFirestore.instance.collection('package');
  CollectionReference intrested =
      FirebaseFirestore.instance.collection('intrested');
  CollectionReference notification =
      FirebaseFirestore.instance.collection('notification');

  // @Method
  // Adding users to the collection
  // addUser({})
  @override
  Future addUser({Map<String, dynamic>? data, String? id}) {
    // Call the user's CollectionReference to add a new user
    return users.doc(id).set(data);
  }

  //@Method
  // Getting users from the user collection
  // getUserData({})
  @override
  Future<String> getUserData({String? id}) async {
    var userData = await users.doc(id).get();
    userInfo =
        InvestorUserModel.fromJson(userData.data() as Map<String, dynamic>);
    // Saving the user data for offline use
    await saveStorage('first_name', userInfo!.first_name);
    await saveStorage('last_name', userInfo!.last_name);
    await saveStorage('username', userInfo!.username);

    return '$userInfo.email';
  }

  //@Method
  // Adding prefrence from the prefrence collection
  // addUserPrefrence({})
  @override
  Future<void> addUserPrefrence({Map<String, dynamic>? data, String? id}) {
    CollectionReference prefrence =
        FirebaseFirestore.instance.collection('prefrence');
    return prefrence.doc(id).set(data);
  }

  //@Method
  // registring a company user to the collection
  // addCompanyUser({})
  @override
  Future<void> addCompanyUser({
    String? id,
    Map<String, dynamic>? data,
  }) {
    return company.doc(id).set(data);
  }

  //@Method
  // getting a company user to the collection
  // getCompanyUserData({})
  @override
  Future<String> getCompanyUserData({String? id}) async {
    var userData = await company.doc(id).get();
    userInfo =
        CompanyUserModel.fromJson(userData.data() as Map<String, dynamic>);
    await saveStorage('city', userInfo!.city);
    await saveStorage('company_name', userInfo!.company_name);
    return '$userInfo.email';
  }

  //@Method
  // adding a company info to the collection
  // addCompanyInfo({})
  @override
  Future<void> addCompanyInfo({Map<String, dynamic>? data, String? id}) {
    return info.doc(id).set(data);
  }

  //@Method
  // uploading theuser image to the firebase storage
  // addCompanyInfo({})
  Future<void> handleUploadImage(File? imageFile, String? uid) async {
    var task = firebase_storage.FirebaseStorage.instance
        .ref('company/$uid')
        .putFile(imageFile!);
    try {
      // Storage tasks function as a Delegating Future so we can await them.
      var snapshot = await task;
      if (snapshot.state == firebase_storage.TaskState.success) {
        final downloadUrl = await snapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('images')
            .doc(uid)
            .set({'url': downloadUrl, 'id': uid});
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  //@Method
  // getting a company user to the collection
  //getImage({String? id})
  @override
  Future<String> getImage({String? id}) async {
    var imageData = await image.doc(id).get();
    imageInfo = ImageModel.fromJson(imageData.data() as Map<String, dynamic>);
    return imageInfo.url;
  }

  //@Method
  // adding a package info to the collection
  // addPackage({})
  @override
  Future<void> addPackage({
    String? id,
    Map<String, dynamic>? data,
  }) {
    return package.add(data);
  }

  //@Method
  // adding a intrested package info to the collection
  // addintrestedPackage({})
  @override
  Future<void> addintrestedPackage(
      {String? id, Map<String, dynamic>? data, productId}) {
    return intrested.doc(productId).set(data);
  }

  //@Method
  // adding a notifcation to the collection
  // addintrestedPackage({})
  @override
  Future<void> addNotification(
      {String? id, Map<String, dynamic>? data, productId}) {
    return notification.add(data);
  }
}
