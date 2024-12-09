// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<bool> finalcode(String mobileNumber) async {
  final firestore = FirebaseFirestore.instance;
  final userCollection = firestore.collection('user');

  try {
    // Query to get the user's document based on the mobile number
    final querySnapshot = await userCollection
        .where('phone_number', isEqualTo: mobileNumber)
        .get();

    // Check if the document exists
    if (querySnapshot.docs.isNotEmpty) {
      final userDoc = querySnapshot.docs.first;

      // Get the fields from the user document
      final lastActiveApp = userDoc['lastactiveapp'];
      final isLoggedIn = userDoc['isloggedin'];

      // Check the conditions
      if (lastActiveApp == 'delivery' && isLoggedIn == true) {
        // Restrict the user
        return true; // Return true if the conditions are met (restrict the user)
      }
    }

    return false; // Return false if the conditions are not met (allow login)
  } catch (e) {
    // Handle any errors
    print("Error checking user status: $e");
    return false; // Optionally, return false or handle the error differently
  }
}
