// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'main_page_model.dart';
// export 'main_page_model.dart';
//
// class MainPageWidget extends StatefulWidget {
//   const MainPageWidget({super.key});
//
//   @override
//   State<MainPageWidget> createState() => _MainPageWidgetState();
// }
//
// class _MainPageWidgetState extends State<MainPageWidget> {
//   late MainPageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => MainPageModel());
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: const Color(0xFFF7EBA6),
//         body: SizedBox(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: [
//               Align(
//                 alignment: const AlignmentDirectional(0.0, 0.99),
//                 child: Container(
//                   width: double.infinity,
//                   height: 309.0,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFFFA800),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(0.0),
//                       bottomRight: Radius.circular(0.0),
//                       topLeft: Radius.circular(0.0),
//                       topRight: Radius.circular(0.0),
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Align(
//                         alignment: const AlignmentDirectional(-0.08, -0.55),
//                         child: Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               15.0, 0.0, 0.0, 0.0),
//                           child: FFButtonWidget(
//                             onPressed: () async {
//                               context.pushNamed(
//                                 'button',
//                                 extra: <String, dynamic>{
//                                   kTransitionInfoKey: const TransitionInfo(
//                                     hasTransition: true,
//                                     transitionType: PageTransitionType.fade,
//                                     duration: Duration(milliseconds: 0),
//                                   ),
//                                 },
//                               );
//                             },
//                             text: FFLocalizations.of(context).getText(
//                               'asqfopfs' /* Continue with Mobile number */,
//                             ),
//                             options: FFButtonOptions(
//                               width: 279.0,
//                               height: 59.0,
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   24.0, 0.0, 24.0, 0.0),
//                               iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 0.0, 0.0, 0.0),
//                               color: const Color(0xFFEE284B),
//                               textStyle: FlutterFlowTheme.of(context)
//                                   .titleSmall
//                                   .override(
//                                     fontFamily: 'Inter',
//                                     color: Colors.white,
//                                     fontSize: 15.0,
//                                     letterSpacing: 0.0,
//                                   ),
//                               elevation: 3.0,
//                               borderSide: const BorderSide(
//                                 color: Colors.transparent,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(6.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: const AlignmentDirectional(-0.04, 0.47),
//                         child: Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               20.0, 0.0, 0.0, 0.0),
//                           child: Container(
//                             width: 356.0,
//                             height: 59.0,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFFFFA800),
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(5.0),
//                                 bottomRight: Radius.circular(5.0),
//                                 topLeft: Radius.circular(5.0),
//                                 topRight: Radius.circular(5.0),
//                               ),
//                             ),
//                             child: Align(
//                               alignment: const AlignmentDirectional(0.0, 0.0),
//                               child: Stack(
//                                 children: [
//                                   Align(
//                                     alignment: const AlignmentDirectional(-0.88, 0.0),
//                                     child: Padding(
//                                       padding: const EdgeInsetsDirectional.fromSTEB(
//                                           0.0, 1.0, 0.0, 0.0),
//                                       child: ClipRRect(
//                                         borderRadius: const BorderRadius.only(
//                                           bottomLeft: Radius.circular(5.0),
//                                           bottomRight: Radius.circular(5.0),
//                                           topLeft: Radius.circular(5.0),
//                                           topRight: Radius.circular(5.0),
//                                         ),
//                                         child: Image.asset(
//                                           'assets/images/images.png',
//                                           width: 50.0,
//                                           height: 59.0,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Align(
//                                     alignment: const AlignmentDirectional(0.15, 0.0),
//                                     child: FFButtonWidget(
//                                       onPressed: () async {
//                                         GoRouter.of(context).prepareAuthEvent();
//                                         final user = await authManager
//                                             .signInWithGoogle(context);
//                                         if (user == null) {
//                                           return;
//                                         }
//
//                                         context.pushNamedAuth(
//                                           'HomePage01',
//                                           context.mounted,
//                                           extra: <String, dynamic>{
//                                             kTransitionInfoKey: const TransitionInfo(
//                                               hasTransition: true,
//                                               transitionType:
//                                                   PageTransitionType.fade,
//                                               duration:
//                                                   Duration(milliseconds: 0),
//                                             ),
//                                           },
//                                         );
//                                       },
//                                       text: FFLocalizations.of(context).getText(
//                                         'pwn11tb3' /*    Signin With Google */,
//                                       ),
//                                       options: FFButtonOptions(
//                                         width: 240.0,
//                                         height: 59.0,
//                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                             24.0, 0.0, 24.0, 0.0),
//                                         iconPadding:
//                                             const EdgeInsetsDirectional.fromSTEB(
//                                                 0.0, 0.0, 0.0, 0.0),
//                                         color: FlutterFlowTheme.of(context)
//                                             .primary,
//                                         textStyle: FlutterFlowTheme.of(context)
//                                             .titleSmall
//                                             .override(
//                                               fontFamily: 'Readex Pro',
//                                               color: Colors.white,
//                                               letterSpacing: 0.0,
//                                             ),
//                                         elevation: 3.0,
//                                         borderSide: const BorderSide(
//                                           color: Colors.transparent,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(6.0),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: const AlignmentDirectional(-0.07, -0.12),
//                         child: Container(
//                           width: 380.0,
//                           height: 100.0,
//                           decoration: const BoxDecoration(),
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: const AlignmentDirectional(-1.0, 0.0),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       50.0, 0.0, 0.0, 0.0),
//                                   child: Container(
//                                     width: 80.0,
//                                     height: 0.5,
//                                     decoration: BoxDecoration(
//                                       color: FlutterFlowTheme.of(context)
//                                           .primaryText,
//                                       border: Border.all(
//                                         color: FlutterFlowTheme.of(context)
//                                             .primaryText,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: const AlignmentDirectional(0.0, 0.0),
//                                 child: Text(
//                                   FFLocalizations.of(context).getText(
//                                     'kn6t0jiy' /* or Login using */,
//                                   ),
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                         fontFamily: 'Inter',
//                                         fontSize: 15.0,
//                                         letterSpacing: 0.0,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: const AlignmentDirectional(1.0, 0.0),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       0.0, 0.0, 45.0, 0.0),
//                                   child: Container(
//                                     width: 90.0,
//                                     height: 0.5,
//                                     decoration: BoxDecoration(
//                                       color: FlutterFlowTheme.of(context)
//                                           .primaryText,
//                                       border: Border.all(
//                                         color: FlutterFlowTheme.of(context)
//                                             .primaryText,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(0.0, -0.47),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.asset(
//                     'assets/images/Trucl_Login.png',
//                     width: double.infinity,
//                     height: 207.0,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Above is the original code

// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// import 'main_page_model.dart';
// export 'main_page_model.dart';
//
// class MainPageWidget extends StatefulWidget {
//   const MainPageWidget({super.key});
//
//   @override
//   State<MainPageWidget> createState() => _MainPageWidgetState();
// }
//
// class _MainPageWidgetState extends State<MainPageWidget> {
//   late MainPageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => MainPageModel());
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Color(0xFFF7EBA6),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: [
//               Align(
//                 alignment: AlignmentDirectional(0, -0.47),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     'assets/images/Trucl_Login.png',
//                     width: double.infinity,
//                     height: 207,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: AlignmentDirectional(0, 0.99),
//                 child: Container(
//                   width: double.infinity,
//                   height: 309,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFFFA800),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(0),
//                       bottomRight: Radius.circular(0),
//                       topLeft: Radius.circular(0),
//                       topRight: Radius.circular(0),
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Align(
//                         alignment: AlignmentDirectional(-0.08, -0.55),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
//                           child: FFButtonWidget(
//                             onPressed: () async {
//                               context.pushNamed(
//                                 'button',
//                                 extra: <String, dynamic>{
//                                   kTransitionInfoKey: TransitionInfo(
//                                     hasTransition: true,
//                                     transitionType: PageTransitionType.fade,
//                                     duration: Duration(milliseconds: 0),
//                                   ),
//                                 },
//                               );
//                             },
//                             text: FFLocalizations.of(context).getText(
//                               'asqfopfs' /* Continue with Mobile number */,
//                             ),
//                             options: FFButtonOptions(
//                               width: 279,
//                               height: 59,
//                               padding:
//                               EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
//                               iconPadding:
//                               EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                               color: Color(0xFFEE284B),
//                               textStyle: FlutterFlowTheme.of(context)
//                                   .titleSmall
//                                   .override(
//                                 fontFamily: 'Inter',
//                                 color: Colors.white,
//                                 fontSize: 15,
//                                 letterSpacing: 0.0,
//                               ),
//                               elevation: 3,
//                               borderSide: BorderSide(
//                                 color: Colors.transparent,
//                                 width: 1,
//                               ),
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(-0.04, 0.47),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                           child: Container(
//                             width: 356,
//                             height: 59,
//                             decoration: BoxDecoration(
//                               color: Color(0xFFFFA800),
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(5),
//                                 bottomRight: Radius.circular(5),
//                                 topLeft: Radius.circular(5),
//                                 topRight: Radius.circular(5),
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0, 0),
//                               child: Stack(
//                                 children: [
//                                   Align(
//                                     alignment: AlignmentDirectional(-0.88, 0),
//                                     child: Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 1, 0, 0),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(5),
//                                           bottomRight: Radius.circular(5),
//                                           topLeft: Radius.circular(5),
//                                           topRight: Radius.circular(5),
//                                         ),
//                                         child: Image.asset(
//                                           'assets/images/images.png',
//                                           width: 50,
//                                           height: 59,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Align(
//                                     alignment: AlignmentDirectional(0.15, 0),
//                                     child: FFButtonWidget(
//                                       onPressed: () async {
//                                         GoRouter.of(context).prepareAuthEvent();
//                                         final user = await authManager
//                                             .signInWithGoogle(context);
//                                         if (user == null) {
//                                           return;
//                                         }
//
//                                         context.pushNamedAuth(
//                                           'HomePage01',
//                                           context.mounted,
//                                           extra: <String, dynamic>{
//                                             kTransitionInfoKey: TransitionInfo(
//                                               hasTransition: true,
//                                               transitionType:
//                                               PageTransitionType.fade,
//                                               duration:
//                                               Duration(milliseconds: 0),
//                                             ),
//                                           },
//                                         );
//                                       },
//                                       text: FFLocalizations.of(context).getText(
//                                         'pwn11tb3' /*    Signin With Google */,
//                                       ),
//                                       options: FFButtonOptions(
//                                         width: 240,
//                                         height: 59,
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             24, 0, 24, 0),
//                                         iconPadding:
//                                         EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 0),
//                                         color: FlutterFlowTheme.of(context)
//                                             .primary,
//                                         textStyle: FlutterFlowTheme.of(context)
//                                             .titleSmall
//                                             .override(
//                                           fontFamily: 'Readex Pro',
//                                           color: Colors.white,
//                                           letterSpacing: 0.0,
//                                         ),
//                                         elevation: 3,
//                                         borderSide: BorderSide(
//                                           color: Colors.transparent,
//                                           width: 1,
//                                         ),
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(-0.07, -0.12),
//                         child: Container(
//                           width: 380,
//                           height: 100,
//                           decoration: BoxDecoration(),
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: AlignmentDirectional(-1, 0),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       50, 0, 0, 0),
//                                   child: Container(
//                                     width: 80,
//                                     height: 0.5,
//                                     decoration: BoxDecoration(
//                                       color: FlutterFlowTheme.of(context)
//                                           .primaryText,
//                                       border: Border.all(
//                                         color: FlutterFlowTheme.of(context)
//                                             .primaryText,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0, 0),
//                                 child: Text(
//                                   FFLocalizations.of(context).getText(
//                                     'kn6t0jiy' /* or Login using */,
//                                   ),
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                     fontFamily: 'Inter',
//                                     fontSize: 15,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(1, 0),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       0, 0, 45, 0),
//                                   child: Container(
//                                     width: 90,
//                                     height: 0.5,
//                                     decoration: BoxDecoration(
//                                       color: FlutterFlowTheme.of(context)
//                                           .primaryText,
//                                       border: Border.all(
//                                         color: FlutterFlowTheme.of(context)
//                                             .primaryText,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//above code arranged the image in correct way

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: Color(0xFFF7EBA6),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -0.47),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Trucl_Login.png',
                    width: double.infinity,
                    height: 207,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.99),
                child: Container(
                  width: double.infinity,
                  height: 309,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFA800),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Button: Continue with Mobile Number
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 279, // Unified button width
                          height: 59, // Unified button height
                          child: FFButtonWidget(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      strokeWidth: 5.0,
                                    ),
                                  );
                                },
                              );

                              await Future.delayed(Duration(milliseconds: 200));

                              Navigator.pop(context);

                              context.pushNamed(
                                'LoginPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'asqfopfs' /* Continue with Mobile number */,
                            ),
                            options: FFButtonOptions(
                              width: 279,
                              height: 59,
                              color: Color(0xFFEE284B),
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 0.0,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),

                      // Divider with "or Login using" Text
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.black,
                                indent: 20,
                                endIndent: 10,
                              ),
                            ),
                            Text(
                              'or Login using',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.black,
                                indent: 10,
                                endIndent: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Second Button: Sign in with Google
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 279, // Unified button width
                          height: 59, // Unified button height
                          child: ElevatedButton(
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              final user = await authManager.signInWithGoogle(context);
                              if (user == null) {
                                return;
                              }
                              context.pushNamedAuth(
                                'homepage09',
                                context.mounted,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google_logo.png',
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

