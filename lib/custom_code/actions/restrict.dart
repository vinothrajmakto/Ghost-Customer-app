// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future restrict() async {
  // whenever the user login i need to check the user collection from firebase need to check fields like isloggedin bool was true and lastactiveapp is delivery means i need to restrict the user from loggedin
// First, get the current user's ID
  String userId = FirebaseAuth.instance.currentUser!.uid;

  // Then, get the user document from Firestore
  DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('user').doc(userId).get();

  // Check if the user is logged in and their last active app is delivery
  bool isLoggedIn = userDoc.get('isloggedin');
  String lastActiveApp = userDoc.get('lastactiveapp');

  if (isLoggedIn && lastActiveApp == 'delivery') {
    // If the user is logged in and their last active app is delivery, restrict them from logging in
    throw Exception('You are not allowed to log in at this time.');
  } else {
    // Otherwise, allow the user to log in
    // ...
  }
}
