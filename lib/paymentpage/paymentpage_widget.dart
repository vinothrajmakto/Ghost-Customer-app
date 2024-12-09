import '/auth/firebase_auth/auth_util.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'paymentpage_model.dart';
export 'paymentpage_model.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import the package

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentpageWidget extends StatefulWidget {
  const PaymentpageWidget({super.key});

  @override
  State<PaymentpageWidget> createState() => _PaymentpageWidgetState();
}

class _PaymentpageWidgetState extends State<PaymentpageWidget> {
  late PaymentpageModel _model;
  final _radioGroupController = FormFieldController<String>(null);
  String? selectedPaymentMethod; // Add this variable to keep track of the selected payment method.

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentpageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _updatePaymentInFirebase(String paymentId) async {
    try {
      // Retrieve the order ID from local storage
      final prefs = await SharedPreferences.getInstance();
      final orderId = prefs.getString('orderId');

      if (orderId != null) {
        // Update the lat, lng, and address in Firebase
        await FirebaseFirestore.instance.collection('orders').doc(orderId).update({
          'paymentId': paymentId,
        });
        print('Location updated successfully.');
        // Show a toast message
        Fluttertoast.showToast(
          msg: "Payment updated successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        print('Order ID not found in local storage');
      }
    } catch (error) {
      print('Error updating location in Firebase: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF5F5F5),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'n4iju7zz' /* Payment Methods */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 117.0,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                13.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tgngg0ah' /* 48, Al Majarrah Street Hadbat */,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Jaldi',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        child: Align(
                                          alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Color(0xFFFFA800),
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                          const AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dqwrpk7a' /* 4014 Way CBD */,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Jaldi',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                        const AlignmentDirectional(-0.86, -0.16),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'r2raxhxk' /* 40kms */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Jaldi',
                                              color: const Color(0xFFAFAFAF),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        const AlignmentDirectional(-0.69, -0.14),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 1.0,
                                            height: 15.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFAFAFAF),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        const AlignmentDirectional(-0.58, -0.13),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '7z6frk1i' /* 50 mins Delivery */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Jaldi',
                                            color: const Color(0xFFAFAFAF),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-0.86, -0.45),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'svqejg1x' /* Payment Methods */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Jaldi',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Credit Card / Debit Card', // Updated text
                                      style: FlutterFlowTheme.of(context).labelMedium.copyWith(
                                        color: Colors.black, // Set the text color
                                      ),
                                    ),
                                  ),
                                  FlutterFlowRadioButton(
                                    options: ['Credit Card / Debit Card'],
                                    onChanged: (val) {
                                      setState(() {
                                        selectedPaymentMethod = val; // Update the selected payment method
                                      });
                                    },
                                    controller: _radioGroupController,
                                    optionHeight: 32.0,
                                    textStyle: FlutterFlowTheme.of(context).labelMedium.copyWith(
                                      color: Colors.white, // Set the normal text color here
                                    ),
                                    selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Jaldi',
                                      fontSize: 1.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white, // Set the selected text color here
                                    ),
                                    buttonPosition: RadioButtonPosition.right, // Position the radio button to the right
                                    radioButtonColor: const Color(0xFFFFA800),
                                    inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                    toggleable: false,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Container(
                                width: double.infinity,
                                height: 34.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: const Color(0xFFFFA800),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    FFLocalizations.of(context).getText('vz46hlvp' /* Add a new Card */),
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Jaldi',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.16),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              ),
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // This makes the container wrap its contents
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Cash', // Updated text
                                        style: FlutterFlowTheme.of(context).labelMedium.copyWith(
                                          color: Colors.black, // Set the text color
                                        ),
                                      ),
                                    ),
                                    FlutterFlowRadioButton(
                                      options: ['Cash'],
                                      onChanged: (val) {
                                        setState(() {
                                          selectedPaymentMethod = val; // Update the selected payment method
                                        });
                                      },
                                      controller: _radioGroupController,
                                      optionHeight: 32.0,
                                      textStyle: FlutterFlowTheme.of(context).labelMedium.copyWith(
                                        color: Colors.white, // Set the normal text color here
                                      ),
                                      selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Jaldi',
                                        fontSize: 1.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white, // Set the selected text color here
                                      ),
                                      buttonPosition: RadioButtonPosition.right,
                                      radioButtonColor: const Color(0xFFFFA800),
                                      inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                      toggleable: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.46),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              ),
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Allows the container to wrap its contents
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Wallet', // Updated text
                                        style: FlutterFlowTheme.of(context).labelMedium.copyWith(
                                          color: Colors.black, // Set the text color
                                        ),
                                      ),
                                    ),
                                    FlutterFlowRadioButton(
                                      options: ['Wallet'],
                                      onChanged: (val) {
                                        setState(() {
                                          selectedPaymentMethod = val; // Update the selected payment method
                                        });
                                      },
                                      controller: _radioGroupController,
                                      optionHeight: 32.0,
                                      textStyle: FlutterFlowTheme.of(context).labelMedium.copyWith(
                                        color: Colors.white, // Set the normal text color here
                                      ),
                                      selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Jaldi',
                                        fontSize: 1.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white, // Set the selected text color here
                                      ),
                                      buttonPosition: RadioButtonPosition.right,
                                      radioButtonColor: const Color(0xFFFFA800),
                                      inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                      toggleable: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // Check which payment method is selected
                        if (selectedPaymentMethod == 'Credit Card / Debit Card') {
                          // Process Stripe payment
                          final paymentResponse = await processStripePayment(
                            context,
                            amount: 20000,
                            currency: 'INR',
                            customerEmail: 'admin@ghost.com',
                            description: 'Test Payment',
                            allowGooglePay: true,
                            allowApplePay: false,
                            buttonColor: FlutterFlowTheme.of(context).primary,
                            buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                          );

                          // Check for errors in the payment response
                          if (paymentResponse.paymentId == null && paymentResponse.errorMessage != null) {
                            showSnackbar(
                              context,
                              'Error: ${paymentResponse.errorMessage} Testing ${paymentResponse.paymentId} ENd ${paymentResponse} final',
                            );
                          }

                          _model.paymentId = paymentResponse.paymentId ?? '';
                        } else if (selectedPaymentMethod == 'Cash') {
                          // Set payment ID as cash
                          _model.paymentId = 'cash'; // You can modify this based on your logic
                        } else if (selectedPaymentMethod == 'Wallet') {
                          // Handle wallet payment logic if needed
                          // Example: _model.paymentId = 'wallet'; or any specific wallet processing
                        }

                        // Update payment in Firebase
                        if (_model.paymentId != null) {
                          await _updatePaymentInFirebase(_model.paymentId!);
                        } else {
                          print("Payment ID is null");
                        }

                        // Optionally navigate to another page after processing
                        // context.goNamed('homepage09');

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'b5f8s1re' /* Pay */,
                      ),
                      options: FFButtonOptions(
                        width: 352.0,
                        height: 44.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFFA800),
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Jaldi',
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
