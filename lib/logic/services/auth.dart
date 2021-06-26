import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: lines_longer_than_80_chars
  Future signInWithCredential(
      String email, String password, String username) async {
    try {
      // ignore: lines_longer_than_80_chars
      UserCredential result =
          await signInWithCredential(email, password, username);
      var user = result.user;

      return user;
      //return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future signUpInvestor(
      // ignore: lines_longer_than_80_chars
      String email,
      String password,
      String username,
      String phonenumber,
      String firstname,
      String lastname) async {
    try {
      UserCredential result = await signUpInvestor(
          email, password, username, phonenumber, firstname, lastname);
      var user = result.user;

      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future signInMC(
    String consultantName,
    String companyName,
    String username,
    String emailAddress,
    String password,
    //String pin,
  ) async {
    try {
      UserCredential result = await signInMC(
          consultantName, companyName, username, emailAddress, password);
      var user = result.user;

      return user;

    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future signInSC(
    String consultantName,
    String companyName,
    String username,
    String emailAddress,
    // String password,
    String pin,
  ) async {
    try {
      UserCredential result = await signInSC(
          consultantName, companyName, username, emailAddress, pin);
      var user = result.user;

      return user;

    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future signUpIC(
    String consultantName,
    String companyName,
    String username,
    String emailAddress,
    String password,
    //String pin,
  ) async {
    try {
      UserCredential result = await signUpIC(
          consultantName, companyName, username, emailAddress, password); 
          //check reasons for using flutter
      var user = result.user;

      return user;

    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
