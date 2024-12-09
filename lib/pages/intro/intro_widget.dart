// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'intro_model.dart';
// export 'intro_model.dart';
//
// class IntroWidget extends StatefulWidget {
//   const IntroWidget({super.key});
//
//   @override
//   State<IntroWidget> createState() => _IntroWidgetState();
// }
//
// class _IntroWidgetState extends State<IntroWidget> {
//   late IntroModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => IntroModel());
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
//       child: WillPopScope(
//         onWillPop: () async => false,
//         child: Scaffold(
//           key: scaffoldKey,
//           backgroundColor: const Color(0xFFFFA800),
//           body: SafeArea(
//             top: true,
//             child: SizedBox(
//               width: double.infinity,
//               height: double.infinity,
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, -0.56),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8.0),
//                       child: Image.asset(
//                         'assets/images/1215597_61_1.png',
//                         width: double.infinity,
//                         height: 362.0,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, 1.15),
//                     child: Container(
//                       width: double.infinity,
//                       height: 328.0,
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                       ),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: const AlignmentDirectional(-0.06, -0.42),
//                             child: Text(
//                               FFLocalizations.of(context).getText(
//                                 'veqfgedv' /* Get delivered,
// anything, anywh... */
//                                 ,
//                               ),
//                               textAlign: TextAlign.center,
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Jaldi',
//                                     color: Colors.black,
//                                     fontSize: 26.0,
//                                     letterSpacing: 1.5,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-0.02, -0.86),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8.0),
//                               child: Image.asset(
//                                 'assets/images/Rectangle_14.png',
//                                 width: 22.0,
//                                 height: 8.0,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-0.2, -0.86),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8.0),
//                               child: Image.asset(
//                                 'assets/images/Rectangle_12.png',
//                                 width: 22.0,
//                                 height: 8.0,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(0.16, -0.86),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8.0),
//                               child: Image.asset(
//                                 'assets/images/Rectangle_14.png',
//                                 width: 22.0,
//                                 height: 8.0,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, 1.0),
//                     child: Padding(
//                       padding:
//                           const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
//                       child: FFButtonWidget(
//                         onPressed: () async {
//                           context.pushNamed(
//                             'intro2',
//                             extra: <String, dynamic>{
//                               kTransitionInfoKey: const TransitionInfo(
//                                 hasTransition: true,
//                                 transitionType: PageTransitionType.fade,
//                                 duration: Duration(milliseconds: 0),
//                               ),
//                             },
//                           );
//                         },
//                         text: FFLocalizations.of(context).getText(
//                           'fb9d3aa9' /* Next */,
//                         ),
//                         options: FFButtonOptions(
//                           width: double.infinity,
//                           height: 59.0,
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               24.0, 0.0, 24.0, 0.0),
//                           iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                               0.0, 0.0, 0.0, 0.0),
//                           color: const Color(0xFF183835),
//                           textStyle:
//                               FlutterFlowTheme.of(context).titleSmall.override(
//                                     fontFamily: 'Inter',
//                                     color: Colors.white,
//                                     fontSize: 15.0,
//                                     letterSpacing: 0.0,
//                                   ),
//                           elevation: 3.0,
//                           borderSide: const BorderSide(
//                             color: Colors.transparent,
//                             width: 1.0,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Above is the original code
// After adding loader animation

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'intro_model.dart';
export 'intro_model.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({super.key});

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  late IntroModel _model;
  bool isLoading = false; // Add a variable to control the loader visibility

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _navigateToNext() async {
    setState(() {
      isLoading = true; // Show the loader
    });

    // Simulate some delay to mimic a loading process
    await Future.delayed(const Duration(milliseconds: 200));

    setState(() {
      isLoading = false; // Hide the loader
    });

    // Navigate to the next screen
    context.pushNamed(
      'intro2',
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFFFA800),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -0.56),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/1215597_61_1.png',
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
                                      'veqfgedv' /* Get delivered, anything, anywhere */
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Jaldi',
                                    color: Colors.black,
                                    fontSize: 26.0,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.02, -0.86),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Rectangle_14.png',
                                    width: 22.0,
                                    height: 8.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.2, -0.86),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Rectangle_12.png',
                                    width: 22.0,
                                    height: 8.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.16, -0.86),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Rectangle_14.png',
                                    width: 22.0,
                                    height: 8.0,
                                    fit: BoxFit.cover,
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
                          child: FFButtonWidget(
                            onPressed: () async {
                              await _navigateToNext();
                            },
                            text: FFLocalizations.of(context).getText(
                              'fb9d3aa9' /* Next */,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Rotating loader animation
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 4.0,
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
