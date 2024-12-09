// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'intro2_model.dart';
// export 'intro2_model.dart';
//
// class Intro2Widget extends StatefulWidget {
//   const Intro2Widget({super.key});
//
//   @override
//   State<Intro2Widget> createState() => _Intro2WidgetState();
// }
//
// class _Intro2WidgetState extends State<Intro2Widget> {
//   late Intro2Model _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => Intro2Model());
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
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: double.infinity,
//                   child: Stack(
//                     children: [
//                       Align(
//                         alignment: const AlignmentDirectional(0.0, -0.41),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(0.0),
//                           child: Image.asset(
//                             'assets/images/vecteezy_delivery-flat-design_4530345_1_(1).png',
//                             width: double.infinity,
//                             height: 316.0,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: const AlignmentDirectional(0.0, 1.15),
//                         child: Container(
//                           width: double.infinity,
//                           height: 328.0,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context)
//                                 .secondaryBackground,
//                           ),
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: const AlignmentDirectional(-0.06, -0.42),
//                                 child: Text(
//                                   FFLocalizations.of(context).getText(
//                                     '8bwut1sv' /* Delivery at
// your doorstep */
//                                     ,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                         fontFamily: 'Jaldi',
//                                         color: Colors.black,
//                                         fontSize: 26.0,
//                                         letterSpacing: 1.5,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: const AlignmentDirectional(-0.03, -0.85),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   child: Image.asset(
//                                     'assets/images/Rectangle_12.png',
//                                     width: 22.0,
//                                     height: 8.0,
//                                     fit: BoxFit.none,
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: const AlignmentDirectional(0.17, -0.85),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   child: Image.asset(
//                                     'assets/images/Rectangle_14.png',
//                                     width: 22.0,
//                                     height: 8.0,
//                                     fit: BoxFit.none,
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: const AlignmentDirectional(-0.21, -0.85),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   child: Image.asset(
//                                     'assets/images/Rectangle_14.png',
//                                     width: 22.0,
//                                     height: 8.0,
//                                     fit: BoxFit.none,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: const AlignmentDirectional(0.0, 1.0),
//                         child: Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               15.0, 0.0, 15.0, 15.0),
//                           child: FFButtonWidget(
//                             onPressed: () async {
//                               context.pushNamed(
//                                 'intro3',
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
//                               '5l6vt599' /* Next */,
//                             ),
//                             options: FFButtonOptions(
//                               width: double.infinity,
//                               height: 59.0,
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   24.0, 0.0, 24.0, 0.0),
//                               iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 0.0, 0.0, 0.0),
//                               color: const Color(0xFF183835),
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
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
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

//Above is the original code
// Below adding animation

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'intro2_model.dart';
export 'intro2_model.dart';

class Intro2Widget extends StatefulWidget {
  const Intro2Widget({super.key});

  @override
  State<Intro2Widget> createState() => _Intro2WidgetState();
}

class _Intro2WidgetState extends State<Intro2Widget> {
  late Intro2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Intro2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Function to show the loading dialog
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Set color to white
          ),
        );
      },
    );
  }

  // Function to hide the loading dialog
  void _hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -0.41),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/vecteezy_delivery-flat-design_4530345_1_(1).png',
                            width: double.infinity,
                            height: 316.0,
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-0.06, -0.42),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8bwut1sv' /* Delivery at
your doorstep */
                                    ,
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
                                alignment: const AlignmentDirectional(-0.03, -0.85),
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
                                alignment: const AlignmentDirectional(0.17, -0.85),
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
                              Align(
                                alignment: const AlignmentDirectional(-0.21, -0.85),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 15.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _showLoadingDialog(context); // Show loading dialog
                              await Future.delayed(
                                const Duration(milliseconds: 200), // Simulate a delay
                              );
                              _hideLoadingDialog(context); // Hide loading dialog

                              context.pushNamed(
                                'intro3',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '5l6vt599' /* Next */,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
