import 'package:eatbay_admin/views/auth_pages/dahboard_page/dashboard_page.dart';
import 'package:eatbay_admin/views/auth_pages/signin_page/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? gUser;

  signinWithGoogle() async {
    try {
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
    } catch (e) {
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

  signInWithTwitter() async {
    try {
      // Create a TwitterLogin instance
      final twitterLogin = TwitterLogin(
        apiKey: 'jWrVprX8qJJE5o7TXoF5ix8IE',
        apiSecretKey: 'oPkjD8DXAiRjaT2P9gOpccn5RCJPnUB1QEl9Mof0fJB6jze5ZG',
        redirectURI: "flutter-twitter-login://",
      );

      var twitterAuthCredential;

      // Trigger the sign-in flow
      final authResult = await twitterLogin.login().then((value) async {
        print(value.authToken);
        // Create a credential from the access token
        twitterAuthCredential = TwitterAuthProvider.credential(
          accessToken: value.authToken!,
          secret: value.authTokenSecret!,
        );
      });

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance
          .signInWithCredential(twitterAuthCredential);
    } catch (e) {}
  }

  signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);  
    } catch (e) {}
  }

  void logout() async {
    if (googleSignin.currentUser != null) {
      await googleSignin.disconnect();
    } else {
      // await twitterLogin.disconnect();
    }
    await auth.signOut();
    update();
  }
}
