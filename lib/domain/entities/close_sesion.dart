import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FuntionClosedSesion {
  static Future<void> closedSesion(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await auth.signOut();
      await googleSignIn.signOut();
      Navigator.pushNamedAndRemoveUntil(
        context,
        'login',
        (Route<dynamic> route) => false,
      );
    }
  }
}
