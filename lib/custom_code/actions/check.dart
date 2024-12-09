// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future check() async {
  final userRef =
      FirebaseFirestore.instance.collection('user').doc(uid as String?);
  final userDoc = await userRef.get();

  if (userDoc.exists) {
    final userData = userDoc.data();
    if (userData?['isloggedin'] == true &&
        userData?['lastactiveapp'] == 'delivery') {
      // Restrict the user from logging in
      return false;
    } else {
      // Allow the user to log in
      return true;
    }
  }
}
