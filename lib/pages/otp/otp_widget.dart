import 'package:cloud_firestore/cloud_firestore.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'otp_model.dart';
export 'otp_model.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({super.key});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late OtpModel _model;
  final Telephony telephony = Telephony.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpModel());

    // Request SMS permissions and start listening for SMS
    requestSmsPermissions();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> requestSmsPermissions() async {
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;

    if (permissionsGranted != null && permissionsGranted) {
      telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          if (message.body != null && message.body!.contains("is your verification code")) {
            final otp = extractOtp(message.body!);
            if (otp != null) {
              _model.pinCodeController.text = otp;
              Future.delayed(Duration(seconds: 1), () { // Delay before verifying
                _verifyOtp(otp); // Automatically verify the OTP
              });// Automatically verify the OTP
            }
          }
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('')),
      );
    }
  }


  String? extractOtp(String messageBody) {
    final regex = RegExp(r'(\d{6})'); // Assuming OTP is a 6-digit number
    final match = regex.firstMatch(messageBody);
    return match?.group(0);
  }
  void _verifyOtp(String smsCode) async {
    if (_isVerifying) return; // Prevent multiple verifications
    _isVerifying = true;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Verifying OTP: $smsCode')),
    );

    final phoneVerifiedUser = await authManager.verifySmsCode(
      context: context,
      smsCode: smsCode,
    );

    _isVerifying = false;

    if (phoneVerifiedUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('OTP verified successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // Proceed with user navigation or registration
      context.pushNamedAuth('homepage09', context.mounted);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('OTP verification failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7or123k0' /* Enter OTP Code */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                  fontFamily: 'Jaldi',
                                  color: Colors.black,
                                  fontSize: 31.0,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2obblxaf' /* OTP has been sent to */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Jaldi',
                                      color: const Color(0xFFB4BCBA),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentPhoneNumber,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Jaldi',
                                        color: const Color(0xFFB4BCBA),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, -0.65),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                              child: PinCodeTextField(
                                autoDisposeControllers: false,
                                appContext: context,
                                length: 6,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                enableActiveFill: false,
                                autoFocus: true,
                                enablePinAutofill: true,
                                errorTextSpace: 16.0,
                                showCursor: true,
                                cursorColor: FlutterFlowTheme.of(context).primary,
                                obscureText: false,
                                hintCharacter: '-',
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  fieldHeight: 50.0,
                                  fieldWidth: 50.0,
                                  borderWidth: 2.0,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(14.0),
                                    bottomRight: Radius.circular(14.0),
                                    topLeft: Radius.circular(14.0),
                                    topRight: Radius.circular(14.0),
                                  ),
                                  shape: PinCodeFieldShape.box,
                                  activeColor: const Color(0xFF183835),
                                  inactiveColor: const Color(0xFFAEAEAE),
                                  selectedColor: const Color(0xFFBBBBBB),
                                ),
                                controller: _model.pinCodeController,
                                onChanged: (value) {
                                  if (value.length == 6) {
                                    // Automatically trigger OTP verification when the full code is entered
                                    _verifyOtp(value);
                                  }
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: _model.pinCodeControllerValidator.asValidator(context),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.73, 1.13),
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.timerMilliseconds == 0) {
                                        final phoneNumberVal =
                                            FFAppState().Phonenumber;
                                        print('Phone number stored in FFAppState: ${FFAppState().Phonenumber}');
                                        if (phoneNumberVal == null ||
                                            phoneNumberVal.isEmpty ||
                                            !phoneNumberVal.startsWith('+')) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Phone Number is required and has to start with +.'),
                                            ),
                                          );
                                          return;
                                        }
                                        await authManager.beginPhoneAuth(
                                          context: context,
                                          phoneNumber: phoneNumberVal,
                                          onCodeSent: (context) async {
                                            context.goNamedAuth(
                                              'otp',
                                              context.mounted,
                                              ignoreRedirect: true,
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '65vcbxu5' /* Resend code in */,
                                          ),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Jaldi',
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(width: 4), // Add some spacing between text and timer
                                        FlutterFlowTimer(
                                          initialTime: _model.timerInitialTimeMs,
                                          getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval: const Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime, shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate) safeSetState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Montserrat',
                                            color: const Color(0xFF149CE8),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            lineHeight: 1.0,
                                          ),
                                        ),
                                        SizedBox(width: 4), // Optional spacing before 's'
                                        Text(
                                          's',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Jaldi',
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // child: Text(
                                    //   FFLocalizations.of(context).getText(
                                    //     '65vcbxu5' /* Resend code in             s */,
                                    //   ),
                                    //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //     fontFamily: 'Jaldi',
                                    //     fontSize: 15,
                                    //     letterSpacing: 0.0,
                                    //     fontWeight: FontWeight.normal,
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                              // Align(
                              //   alignment: const AlignmentDirectional(0.83, 0.59),
                              //   child: Padding(
                              //     padding: EdgeInsetsDirectional.fromSTEB(0, 7, 6, 0),
                              //     child: FlutterFlowTimer(
                              //       initialTime: _model.timerInitialTimeMs,
                              //       getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                              //         value,
                              //         hours: false,
                              //         milliSecond: false,
                              //       ),
                              //       controller: _model.timerController,
                              //       updateStateInterval: const Duration(milliseconds: 1000),
                              //       onChanged: (value, displayTime, shouldUpdate) {
                              //         _model.timerMilliseconds = value;
                              //         _model.timerValue = displayTime;
                              //         if (shouldUpdate) safeSetState(() {});
                              //       },
                              //       textAlign: TextAlign.start,
                              //       style: FlutterFlowTheme.of(context)
                              //           .headlineSmall
                              //           .override(
                              //         fontFamily: 'Montserrat',
                              //         color: const Color(0xFF149CE8),
                              //         fontSize: 15.0,
                              //         letterSpacing: 0.0,
                              //         fontWeight: FontWeight.normal,
                              //         lineHeight: 1.0,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          final smsCodeVal = _model.pinCodeController!.text;
                          if (smsCodeVal.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Enter SMS verification code.'),
                              ),
                            );
                            return;
                          }
                          final phoneVerifiedUser =
                          await authManager.verifySmsCode(
                            context: context,
                            smsCode: smsCodeVal,
                          );
                          if (phoneVerifiedUser == null) {
                            return;
                          }

                          if (phoneVerifiedUser != null && context.mounted) {
                            context.pushNamedAuth('homepage09',true);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to verify user.'),
                              ),
                            );
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          'p7p0kyna' /* confirm */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFFFA800),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Jaldi',
                            color: Colors.white,
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}