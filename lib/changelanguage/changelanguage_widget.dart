import '../flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'changelanguage_model.dart';
export 'changelanguage_model.dart';

class ChangelanguageWidget extends StatefulWidget {
  const ChangelanguageWidget({super.key});

  @override
  State<ChangelanguageWidget> createState() => _ChangelanguageWidgetState();
}

class _ChangelanguageWidgetState extends State<ChangelanguageWidget> {
  late ChangelanguageModel _model;
  String? selectedLanguage;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangelanguageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            110.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ecchrrdr' /* Language */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(-0.13, -0.32),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(color: FlutterFlowTheme.of(context).primaryText),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(shape: BoxShape.circle),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1678371271544-d7394c57b3a4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8ZW5nbGlzaCUyMGZsYWd8ZW58MHx8fHwxNzI2NDY4MjIwfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context).getText('zdbhyuy3' /* English */),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Jaldi',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile<String>(
                                              value: 'en',
                                              groupValue: selectedLanguage,
                                              onChanged: (value) {
                                                safeSetState(() {
                                                  selectedLanguage = value;
                                                  setAppLanguage(context, 'en');
                                                });
                                              },
                                              activeColor: FlutterFlowTheme.of(context).primaryText,
                                              dense: true,
                                              controlAffinity: ListTileControlAffinity.trailing,
                                            ),
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
                      ),

                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(-0.13, -0.1),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(color: const Color(0xF4BCBCBC)),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(shape: BoxShape.circle),
                                              child: Image.asset(
                                                'assets/images/united-arab-emirates.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context).getText('p8908p5n' /* Arabic */),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Jaldi',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile<String>(
                                              value: 'ar',
                                              groupValue: selectedLanguage,
                                              onChanged: (value) {
                                                safeSetState(() {
                                                  selectedLanguage = value;
                                                  setAppLanguage(context, 'ar');
                                                });
                                              },
                                              activeColor: FlutterFlowTheme.of(context).primaryText,
                                              dense: true,
                                              controlAffinity: ListTileControlAffinity.trailing,
                                            ),
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
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(-0.04, 0.12),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        border: Border.all(
                                          color: const Color(0xF4BCBCBC),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/united-arab-emirates.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context).getText(
                                                'p6wlvha6' /* Urdu */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Jaldi',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile<String>(
                                              value: 'ur',
                                              groupValue: selectedLanguage,
                                              onChanged: (value) {
                                                safeSetState(() {
                                                  selectedLanguage = value;
                                                  setAppLanguage(context, 'ur');
                                                });
                                              },
                                              activeColor: FlutterFlowTheme.of(context).primaryText,
                                              dense: true,
                                              controlAffinity: ListTileControlAffinity.trailing,
                                            ),
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
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        context.pushNamed(
                          'profilemenu',
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
                        'l5f0ntq6' /* Back */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFFA800),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Jaldi',
                          color: Colors.white,
                          fontSize: 18.0,
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
                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}
