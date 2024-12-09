import "package:country_picker/country_picker.dart";
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCountryCode = ''; // Default country code for India
  String selectedCountryFlag = '🌍';// Default country flag
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());
    _checkLocationPermission();

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Ask user to enable GPS
      await Geolocator.openLocationSettings();
      return;
    }

    // Check for location permission.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied.
      return;
    }

    // Get the user's location.
    Position position = await Geolocator.getCurrentPosition();
    await _getCountryCode(position);
  }

  Future<void> _getCountryCode(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        String? countryCode = placemarks[0].isoCountryCode;

        // Use country_picker to get the country data
        Country? country = Country.tryParse(countryCode ?? '');

        if (country != null) {
          setState(() {
            selectedCountryCode = country.phoneCode; // Set phone code (e.g., 91)
            selectedCountryFlag = country.flagEmoji; // Set flag emoji
          });
        }
      }
    } catch (e) {
      print('Error retrieving country code: $e');
    }
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          selectedCountryCode = country.phoneCode;
          selectedCountryFlag = country.flagEmoji;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/Logo_-_default_style.png',
                                width: 268,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 358,
                            height: 350,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -0.29),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 90,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                            AlignmentDirectional(-1, 0),
                                            child: Text(
                                              FFLocalizations.of(context).getText(
                                                'yn4aea2v' /* Enter your mobile number */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 14,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.5,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                            AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5t8s4y4s' /* Type in your mobile number to ... */,
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Jaldi',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.2,
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
                                  alignment: AlignmentDirectional(0, 0.28),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 66,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: _showCountryPicker, // Show the country picker on tap
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    selectedCountryFlag, // Display the flag
                                                    style: const TextStyle(fontSize: 20),
                                                  ),
                                                  // const SizedBox(width: 8.0),
                                                  // Text(
                                                  //   selectedCountryCode, // Display the selected country code
                                                  //   style: FlutterFlowTheme.of(context)
                                                  //       .bodyMedium
                                                  //       .override(
                                                  //     fontFamily: 'Readex Pro',
                                                  //     letterSpacing: 0.0,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller: _model.textController,
                                                focusNode: _model.textFieldFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(context).alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  hintText: FFLocalizations.of(context).getText(
                                                    'o0oqu2if' /* Mobile Number */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                    fontFamily: 'Jaldi',
                                                    color: const Color(0xFFD2D2D2),
                                                    letterSpacing: 0.0,
                                                  ),
                                                  prefixText: selectedCountryCode.isNotEmpty ? '+$selectedCountryCode' : '', // Show country code with +
                                                  prefixStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                                  enabledBorder: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder: InputBorder.none,
                                                ),
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),

                                                keyboardType: TextInputType.phone,
                                                textAlign: Directionality.of(context) == TextDirection.RTL
                                                    ? TextAlign.right
                                                    : TextAlign.left, // Adjust alignment based on locale
                                                validator: _model.textControllerValidator.asValidator(context),
                                                inputFormatters: [
                                                  _model.textFieldMask
                                                ],
                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                        child: FFButtonWidget(
                          onPressed: _isLoading
                              ? null // Disable button while loading
                              : () async {
                            setState(() {
                              _isLoading = true;
                            });
                            safeSetState(() {});

                            // Get the phone number entered by the user
                            String enteredPhoneNumber = _model.textController.text.trim();
                            print('Country Code: "${selectedCountryCode}-", Phone Number: "$enteredPhoneNumber"');
                            final cleanedPhoneNumber = enteredPhoneNumber.replaceAll(RegExp(r'\D'), '');

                            // Check if the phone number has 10 digits
                            if (cleanedPhoneNumber.isEmpty || cleanedPhoneNumber.length != 10) {
                              // Show a SnackBar message if the phone number is not 10 digits
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a valid 10-digit phone number.'),
                                ),
                              );
                              setState(() {
                                _isLoading = false; // Hide loading animation
                              });
                              return; // Exit the function early
                            }

                            // Format the phone number with country code
                            final phoneNumberVal = '+' + selectedCountryCode + '-' + cleanedPhoneNumber;

                            // Store the formatted phone number in FFAppState
                            FFAppState().Phonenumber = phoneNumberVal;

                            // Check if the phone number starts with '+'
                            if (phoneNumberVal.isEmpty || !phoneNumberVal.startsWith('+')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Phone Number is required and has to start with +.'),
                                ),
                              );
                              setState(() {
                                _isLoading = false; // Hide loading animation
                              });
                              print(
                                  'Formatted Phone Number: $phoneNumberVal');
                              return;

                            }
                            print('Formatted Phone Number: $phoneNumberVal');
                            await authManager.beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberVal,
                              onCodeSent: (context) async {
                                setState(() {
                                  _isLoading = false; // Hide loading animation
                                });
                                context.goNamedAuth(
                                  'otp',
                                  context.mounted,
                                  ignoreRedirect: true,
                                );
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '0tfpy6v1' /* Confirm */,
                          ),
                          options: FFButtonOptions(
                            width: 390.0,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFFDA900),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                            ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ),
                    if (_isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}