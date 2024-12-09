import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'editname_model.dart';
export 'editname_model.dart';

class EditnameWidget extends StatefulWidget {
  const EditnameWidget({super.key});

  @override
  State<EditnameWidget> createState() => _EditnameWidgetState();
}

class _EditnameWidgetState extends State<EditnameWidget> {
  late EditnameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditnameModel());

    _model.yourNameTextController ??= TextEditingController();
    _model.yourNameFocusNode ??= FocusNode();

    _model.lastnameTextController ??= TextEditingController();
    _model.lastnameFocusNode ??= FocusNode();

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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ucymnd5e' /* Update Your Name */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Jaldi',
                                      color: Colors.black,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 40.0, 16.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.yourNameTextController,
                                      focusNode: _model.yourNameFocusNode,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'zmdo9xns' /* First Name */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Jaldi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFD2D2D2),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFF183835),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 22.0, 0.0, 22.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .yourNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 40.0, 16.0),
                                  child: TextFormField(
                                    controller: _model.lastnameTextController,
                                    focusNode: _model.lastnameFocusNode,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '23uj34j1' /* Last Name */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Jaldi',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD2D2D2),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFF183835),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 22.0, 0.0, 22.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .lastnameTextControllerValidator
                                        .asValidator(context),
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
                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                      child: StreamBuilder<List<CustomerRecord>>(
                        stream: queryCustomerRecord(
                          queryBuilder: (customerRecord) =>
                              customerRecord.where('uid', isEqualTo: currentUserUid),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }

                          // If no record exists for the given UID, create one.
                          if (snapshot.data!.isEmpty) {
                            return FFButtonWidget(
                              onPressed: () async {
                                // Create a new CustomerRecord if none found
                                await FirebaseFirestore.instance.collection('customer').add({
                                  'uid': currentUserUid,
                                  'customerName': '${_model.yourNameTextController.text}  ${_model.lastnameTextController.text}',
                                  'firstName': _model.yourNameTextController.text,
                                  'lastName': _model.lastnameTextController.text,
                                  'displayName': '${_model.yourNameTextController.text}  ${_model.lastnameTextController.text}',
                                });

                                // Also update the user reference
                                await currentUserReference!.update(createUserRecordData(
                                  displayName: '${_model.yourNameTextController.text}  ${_model.lastnameTextController.text}',
                                ));

                                // Navigate to the profile edit page
                                context.pushNamed('editprofile');
                              },
                              text: FFLocalizations.of(context).getText('xgdpnc9y' /* Confirm */),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 44.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFFFA800),
                                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Jaldi',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                                elevation: 3.0,
                                borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            );
                          }

                          // If the record exists, update it.
                          List<CustomerRecord> buttonCustomerRecordList = snapshot.data!;
                          final buttonCustomerRecord = buttonCustomerRecordList.isNotEmpty
                              ? buttonCustomerRecordList.first
                              : null;

                          return FFButtonWidget(
                            onPressed: () async {
                              await currentUserReference!
                                  .update(createUserRecordData(
                                displayName: '${_model.yourNameTextController.text}  ${_model.lastnameTextController.text}',
                              ));

                              await buttonCustomerRecord!.reference.update(createCustomerRecordData(
                                customerName: '${_model.yourNameTextController.text}  ${_model.lastnameTextController.text}',
                                firstName: _model.yourNameTextController.text,
                                lastName: _model.lastnameTextController.text,
                                displayName: '${_model.yourNameTextController.text}  ${_model.lastnameTextController.text}',
                              ));

                              context.pushNamed('editprofile');
                            },
                            text: FFLocalizations.of(context).getText('xgdpnc9y' /* Confirm */),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 44.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFFFA800),
                              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Jaldi',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                              elevation: 3.0,
                              borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          );
                        },
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
