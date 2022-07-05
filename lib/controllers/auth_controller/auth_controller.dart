import 'package:eatbay_admin/views/auth_pages/dahboard_page/dashboard_page.dart';
import 'package:eatbay_admin/views/auth_pages/signin_page/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? gUser;

  signinWithGoogle() async {
    try{
      final googleUser = await googleSignin.signIn();
    if (googleUser == null) {
      return;
    }
    //obtail auth details from the request
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    //create new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch (e) {
        print(e.toString());
    }

    update();
  }

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); //manual casting
    _user.bindStream(auth.userChanges());
    ever(_user,
        _initialScreen); //fire data(_user) change will trigger initialscreen function
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(SignInPage());
    } else {
      Get.offAll(
          DashboardPage()); //we can also pass the data of user using user object
    }
  }

  void signin(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      update();
    } catch (e) {
      Get.snackbar('About Login', "Login message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed"),
          messageText: Text(e.toString()));
    }
  }

  void logout() async {
    await googleSignin.disconnect();
    await auth.signOut();
    update();
  }
}
