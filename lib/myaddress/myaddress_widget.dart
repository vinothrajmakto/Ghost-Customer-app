import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../addresslist/addresslist_widget.dart';
import '../profilemenu/profilemenu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyaddressWidget extends StatefulWidget {
  const MyaddressWidget({super.key});

  @override
  State<MyaddressWidget> createState() => _MyaddressWidgetState();
}

class _MyaddressWidgetState extends State<MyaddressWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> addressDetails = {};
  int index = 0;

  TextEditingController addressTypeController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      addressDetails = Map<String, String>.from(args['addressDetails'] ?? {});
      index = args['index'] ?? 0;

      // Populate fields only if addressDetails are not empty (edit mode)
      if (addressDetails.isNotEmpty) {
        addressTypeController.text = addressDetails['addressType'] ?? '';
        address1Controller.text = addressDetails['address1'] ?? '';
        address2Controller.text = addressDetails['address2'] ?? '';
        cityController.text = addressDetails['city'] ?? '';
        countryController.text = addressDetails['country'] ?? '';
      }

      // Show the current index value in a toast
      // Fluttertoast.showToast(
      //   msg: "Current index: $index",  // Display the index value
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      // );
    }
  }

  Future<bool> updateAddressInFirebase() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return false;

    final docRef = await FirebaseFirestore.instance
        .collection('customer')
        .where('uid', isEqualTo: userId)
        .limit(1)
        .get();

    if (docRef.docs.isNotEmpty) {
      final document = docRef.docs.first.reference;

      await document.update({
        'addressType_address$index': addressTypeController.text,
        'address1_address$index': address1Controller.text,
        'address2_address$index': address2Controller.text,
        'city_address$index': cityController.text,
        'country_address$index': countryController.text,
      });

      Fluttertoast.showToast(msg: "Address saved successfully");
      return true;  // Indicate successful update
    } else {
      Fluttertoast.showToast(msg: "Failed to save address");
      return false;
    }
  }

  Future<void> deleteAddressInFirebase() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final docRef = await FirebaseFirestore.instance
        .collection('customer')
        .where('uid', isEqualTo: userId)
        .limit(1)
        .get();

    if (docRef.docs.isNotEmpty) {
      final document = docRef.docs.first.reference;

      await document.update({
        'addressType_address$index': FieldValue.delete(),
        'address1_address$index': FieldValue.delete(),
        'address2_address$index': FieldValue.delete(),
        'city_address$index': FieldValue.delete(),
        'country_address$index': FieldValue.delete(),
      });

      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Address'),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEditableField('Address Type', addressTypeController),
                      _buildEditableField('Address Line 1', address1Controller),
                      _buildEditableField('Address Line 2', address2Controller),
                      _buildEditableField('City', cityController),
                      _buildEditableField('Country', countryController),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await deleteAddressInFirebase();
                              },
                              text: 'Delete',
                              options: FFButtonOptions(
                                color: Colors.red,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ?? false) {
                                  bool isUpdated = await updateAddressInFirebase();
                                  if (isUpdated) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => AddresslistWidget(),  // Replace with your ProfileMenu widget
                                      ),
                                    );
                                  }
                                }
                              },
                              text: 'Confirm',
                              options: FFButtonOptions(
                                color: Color(0xFFFFA800),
                                textStyle: FlutterFlowTheme.of(context).titleMedium.copyWith(color: Colors.white),
                                elevation: 3.0,
                                borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF183835), width: 2.0),
          ),
        ),
      ),
    );
  }
}