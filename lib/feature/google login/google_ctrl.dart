

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleCtrl{
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static Future<void> signInWithGoogle(BuildContext context) async{
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();


    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;


    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) => {
      log("user email credential : ${value.user?.email}"),
      log("user NAme credential: ${value.user?.displayName}"),
      log("user photo credential : ${value.user?.photoURL}"),

       Navigator.pushReplacement(
            context,
             MaterialPageRoute(builder: (context) => ProfilePage(
               userEmail: value.user?.email ?? "",
               userName: value.user?.displayName ?? "",
               userPhotoURL: value.user?.photoURL ?? "",
             ))),

    });


  }
}