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
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> userchecking(BuildContext context) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user is logged in.');
    }

    // Check user restrictions
    final userDoc =
        await FirebaseFirestore.instance.collection('user').doc(user.uid).get();

    if (userDoc.exists) {
      final userData = userDoc.data();
      if (userData != null &&
          userData['isloggedin'] == true &&
          userData['lastactiveapp'] == 'delivery') {
        // Show restriction message
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Restricted Access'),
                content: Text('You are not allowed to log in from this app.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });

        // Stop further login actions
        return;
      }
    }

    // Proceed with login actions
    final userRef = FirebaseFirestore.instance.collection('user').doc(user.uid);
    await userRef.update({
      'isloggedin': true,
      'lastactiveapp': 'customer',
      'lastactivetime': DateTime.now(),
    });

    // Continue with other actions after login
    print('Login successful and user status updated');
    // Add additional logic or navigation here if needed
  } catch (e) {
    print('Error during login process: $e');
    // Handle any errors or exceptions here
  }
}
