import 'dart:io';

import 'package:chipln/logic/core/storage.dart';
import 'package:chipln/models/company_user_model/company_user_model.dart';
import 'package:chipln/models/investor_user_model/investor_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'variable.dart';

/// Base of the configuration
abstract class Database {
  // Add user
  Future<void> addUser();
  Future<void> addCompanyUser();
  // Get user data
  Future<void> getUserData();
  Future<void> getCompanyUserData();
  // Add User Prefrence

  Future<void> addUserPrefrence();
}

///This function is use to add data to your firestore.
///You can call the one which fit for you
class AddToDatabase extends Database {
  // Create a CollectionReference called users
  // that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('investor');
  CollectionReference company =
      FirebaseFirestore.instance.collection('company');
  @override
  Future addUser({Map<String, dynamic>? data, String? id}) {
    // Call the user's CollectionReference to add a new user
    return users.doc(id).set(data);
  }

  @override
  Future<String> getUserData({String? id}) async {
    var userData = await users.doc(id).get();
    userInfo =
        InvestorUserModel.fromJson(userData.data() as Map<String, dynamic>);
    await saveStorage('first_name', userInfo!.first_name);
    await saveStorage('last_name', userInfo!.last_name);
    await saveStorage('username', userInfo!.username);

    return '$userInfo.email';
  }

  @override
  Future<void> addUserPrefrence({Map<String, dynamic>? data, String? id}) {
    CollectionReference prefrence =
        FirebaseFirestore.instance.collection('prefrence');
    return prefrence.doc(id).set(data);
  }

  @override
  Future<void> addCompanyUser({
    String? id,
    Map<String, dynamic>? data,
  }) {
    return company.doc(id).set(data);
  }

  @override
  Future<String> getCompanyUserData({String? id}) async {
    var userData = await company.doc(id).get();
    userInfo =
        CompanyUserModel.fromJson(userData.data() as Map<String, dynamic>);
    await saveStorage('city', userInfo!.city);
    await saveStorage('company_name', userInfo!.company_name);
    return '$userInfo.email';
  }

 
}
