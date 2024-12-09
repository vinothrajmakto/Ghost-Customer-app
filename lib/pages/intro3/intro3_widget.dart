// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'intro3_model.dart';
// export 'intro3_model.dart';
//
// class Intro3Widget extends StatefulWidget {
//   const Intro3Widget({super.key});
//
//   @override
//   State<Intro3Widget> createState() => _Intro3WidgetState();
// }
//
// class _Intro3WidgetState extends State<Intro3Widget> {
//   late Intro3Model _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => Intro3Model());
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
//         backgroundColor: const Color(0xFFFFA800),
//         body: SafeArea(
//           top: true,
//           child: SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: const AlignmentDirectional(0.0, -0.43),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: Image.asset(
//                       'assets/images/vecteezy_covid-19-coronavirus-pandemic-delivery-service-hand-with_4420390_1_(1).png',
//                       width: double.infinity,
//                       height: 362.0,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: const AlignmentDirectional(0.0, 1.15),
//                   child: Container(
//                     width: double.infinity,
//                     height: 328.0,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                     ),
//                     child: Stack(
//                       children: [
//                         Align(
//                           alignment: const AlignmentDirectional(-0.06, -0.42),
//                           child: Text(
//                             FFLocalizations.of(context).getText(
//                               'osjj3x8q' /* Book your item to be
// delivere... */
//                               ,
//                             ),
//                             textAlign: TextAlign.center,
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Jaldi',
//                                   fontSize: 26.0,
//                                   letterSpacing: 1.5,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(0.15, -0.86),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.asset(
//                               'assets/images/Rectangle_12.png',
//                               width: 22.0,
//                               height: 8.0,
//                               fit: BoxFit.none,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(-0.03, -0.86),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.network(
//                               'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/courier-pokxy8/assets/l68ov3hgu81s/Rectangle_14.png',
//                               width: 22.0,
//                               height: 8.0,
//                               fit: BoxFit.none,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(-0.22, -0.85),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.asset(
//                               'assets/images/Rectangle_14.png',
//                               width: 22.0,
//                               height: 8.0,
//                               fit: BoxFit.none,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: const AlignmentDirectional(0.0, 1.0),
//                   child: Padding(
//                     padding:
//                         const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
//                     child: FFButtonWidget(
//                       onPressed: () async {
//                         context.pushNamed(
//                           'MainPage',
//                           extra: <String, dynamic>{
//                             kTransitionInfoKey: const TransitionInfo(
//                               hasTransition: true,
//                               transitionType: PageTransitionType.fade,
//                               duration: Duration(milliseconds: 0),
//                             ),
//                           },
//                         );
//                       },
//                       text: FFLocalizations.of(context).getText(
//                         'ihu27sqq' /* Next */,
//                       ),
//                       options: FFButtonOptions(
//                         width: double.infinity,
//                         height: 59.0,
//                         padding: const EdgeInsetsDirectional.fromSTEB(
//                             24.0, 0.0, 24.0, 0.0),
//                         iconPadding:
//                             const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                         color: const Color(0xFF183835),
//                         textStyle:
//                             FlutterFlowTheme.of(context).titleSmall.override(
//                                   fontFamily: 'Inter',
//                                   color: Colors.white,
//                                   letterSpacing: 0.0,
//                                 ),
//                         elevation: 3.0,
//                         borderSide: const BorderSide(
//                           color: Colors.transparent,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//The above is the original code
// Below is for checking onboarding

// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'intro3_model.dart';
// export 'intro3_model.dart';
//
// class Intro3Widget extends StatefulWidget {
//   const Intro3Widget({super.key});
//
//   @override
//   State<Intro3Widget> createState() => _Intro3WidgetState();
// }
//
// class _Intro3WidgetState extends State<Intro3Widget> {
//   late Intro3Model _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => Intro3Model());
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }
//
//   Future<void> _completeOnboarding() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isOnboardingCompleted', true);
//
//     // Navigate to the main page
//     context.pushNamed(
//       'MainPage',
//       extra: <String, dynamic>{
//         kTransitionInfoKey: const TransitionInfo(
//           hasTransition: true,
//           transitionType: PageTransitionType.fade,
//           duration: Duration(milliseconds: 0),
//         ),
//       },
//     );
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
//         backgroundColor: const Color(0xFFFFA800),
//         body: SafeArea(
//           top: true,
//           child: SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: const AlignmentDirectional(0.0, -0.43),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: Image.asset(
//                       'assets/images/vecteezy_covid-19-coronavirus-pandemic-delivery-service-hand-with_4420390_1_(1).png',
//                       width: double.infinity,
//                       height: 362.0,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: const AlignmentDirectional(0.0, 1.15),
//                   child: Container(
//                     width: double.infinity,
//                     height: 328.0,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                     ),
//                     child: Stack(
//                       children: [
//                         Align(
//                           alignment: const AlignmentDirectional(-0.06, -0.42),
//                           child: Text(
//                             FFLocalizations.of(context).getText(
//                               'osjj3x8q' /* Book your item to be
// delivere... */
//                               ,
//                             ),
//                             textAlign: TextAlign.center,
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                               fontFamily: 'Jaldi',
//                               fontSize: 26.0,
//                               letterSpacing: 1.5,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(0.15, -0.86),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.asset(
//                               'assets/images/Rectangle_12.png',
//                               width: 22.0,
//                               height: 8.0,
//                               fit: BoxFit.none,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(-0.03, -0.86),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.network(
//                               'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/courier-pokxy8/assets/l68ov3hgu81s/Rectangle_14.png',
//                               width: 22.0,
//                               height: 8.0,
//                               fit: BoxFit.none,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(-0.22, -0.85),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.asset(
//                               'assets/images/Rectangle_14.png',
//                               width: 22.0,
//                               height: 8.0,
//                               fit: BoxFit.none,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: const AlignmentDirectional(0.0, 1.0),
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
//                     child: FFButtonWidget(
//                       onPressed: () async {
//                         await _completeOnboarding();
//                       },
//                       text: FFLocalizations.of(context).getText(
//                         'ihu27sqq' /* Next */,
//                       ),
//                       options: FFButtonOptions(
//                         width: double.infinity,
//                         height: 59.0,
//                         padding: const EdgeInsetsDirectional.fromSTEB(
//                             24.0, 0.0, 24.0, 0.0),
//                         iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                             0.0, 0.0, 0.0, 0.0),
//                         color: const Color(0xFF183835),
//                         textStyle: FlutterFlowTheme.of(context)
//                             .titleSmall
//                             .override(
//                           fontFamily: 'Inter',
//                           color: Colors.white,
//                           letterSpacing: 0.0,
//                         ),
//                         elevation: 3.0,
//                         borderSide: const BorderSide(
//                           color: Colors.transparent,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Adding animation

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro3_model.dart';
export 'intro3_model.dart';

class Intro3Widget extends StatefulWidget {
  const Intro3Widget({super.key});

  @override
  State<Intro3Widget> createState() => _Intro3WidgetState();
}

class _Intro3WidgetState extends State<Intro3Widget> {
  late Intro3Model _model;
  bool _isLoading = false; // Loading state

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Intro3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> _completeOnboarding() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingCompleted', true);

    // Simulate a delay (optional, can be removed)
    await Future.delayed(const Duration(milliseconds: 200));

    // Navigate to the main page
    context.pushNamed(
      'MainPage',
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );

    setState(() {
      _isLoading = false; // Stop loading
    });
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
        backgroundColor: const Color(0xFFFFA800),
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -0.43),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/vecteezy_covid-19-coronavirus-pandemic-delivery-service-hand-with_4420390_1_(1).png',
                      width: double.infinity,
                      height: 362.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.15),
                  child: Container(
                    width: double.infinity,
                    height: 328.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.06, -0.42),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'osjj3x8q' /* Book your item to be
delivere... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Jaldi',
                              fontSize: 26.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.15, -0.86),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Rectangle_12.png',
                              width: 22.0,
                              height: 8.0,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.03, -0.86),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/courier-pokxy8/assets/l68ov3hgu81s/Rectangle_14.png',
                              width: 22.0,
                              height: 8.0,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.22, -0.85),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Rectangle_14.png',
                              width: 22.0,
                              height: 8.0,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                    child: _isLoading // Check loading state
                        ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Set color to white
                      ),
                    )
                        : FFButtonWidget(
                      onPressed: () async {
                        await _completeOnboarding();
                      },
                      text: FFLocalizations.of(context).getText(
                        'ihu27sqq' /* Next */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 59.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF183835),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.0,
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
    );
  }
}
