import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/changegender_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'editprofile_model.dart';
export 'editprofile_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditprofileWidget extends StatefulWidget {
  const EditprofileWidget({
    super.key,
    this.password,
  });

  final int? password;

  @override
  State<EditprofileWidget> createState() => _EditprofileWidgetState();
}

class _EditprofileWidgetState extends State<EditprofileWidget> {
  late EditprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    loadDatesFromLocal();

    super.initState();
    _model = createModel(context, () => EditprofileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }
  Future<void> saveDateToLocal(String key, DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, date.toIso8601String());
  }
  Future<void> loadDatesFromLocal() async {
    final prefs = await SharedPreferences.getInstance();

    final date1String = prefs.getString('datePicker1');
    final date2String = prefs.getString('datePicker2');

    safeSetState(() {
      _model.datePicked1 = date1String != null ? DateTime.parse(date1String) : null;
      _model.datePicked2 = date2String != null ? DateTime.parse(date2String) : null;
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '6hdryxxp' /* Profile Settings */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 73.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('editname');
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('editname');
                                            },
                                            child: Icon(
                                              Icons.person_2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'l0haqnkw' /* Name */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      53.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          currentUserDisplayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Jaldi',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 67.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('editmobilenumber');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context
                                                .pushNamed('editmobilenumber');
                                          },
                                          child: Icon(
                                            Icons.phone_android,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'g1nkcokr' /* Mobile Number */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      46.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            currentPhoneNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Jaldi',
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
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
                          Container(
                            width: double.infinity,
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor: Colors.transparent,
                                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(Directionality.of(context)),
                                                  child: GestureDetector(
                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                    child: const SizedBox(
                                                      height: 285.0,
                                                      width: 316.0,
                                                      child: ChangegenderWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.people_sharp,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor: Colors.transparent,
                                                alignment: const AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                  child: const SizedBox(
                                                    height: 285.0,
                                                    width: 316.0,
                                                    child: ChangegenderWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'piw14v36' /* Gender */,
                                          ),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(55.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<CustomerRecord>>(
                                        stream: queryCustomerRecord(
                                          queryBuilder: (customerRecord) => customerRecord.where(
                                            'uid',
                                            isEqualTo: currentUserUid,
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
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
                                          List<CustomerRecord> textCustomerRecordList = snapshot.data!;
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textCustomerRecord = textCustomerRecordList.isNotEmpty
                                              ? textCustomerRecordList.first
                                              : null;

                                          return Text(
                                            valueOrDefault<String>(
                                              textCustomerRecord?.gender,
                                              'gender',
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'Jaldi',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
              Container(
                width: double.infinity,
                height: 64.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () async {
                        final datePicked1Date = await showDatePicker(
                          context: context,
                          initialDate: getCurrentTimestamp,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2050),
                          builder: (context, child) {
                            return wrapInMaterialDatePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                              headerForegroundColor: FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Outfit',
                                fontSize: 32.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                              pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );


                        if (datePicked1Date != null) {
                          safeSetState(() {
                            _model.datePicked1 = datePicked1Date;

                            // Update the `dob` field in the `customer` collection
                            FirebaseFirestore.instance
                                .collection('customer')
                                .where('uid', isEqualTo: currentUserUid)
                                .get()
                                .then((querySnapshot) {
                              for (var doc in querySnapshot.docs) {
                                // Update the `dob` field in each matching document
                                doc.reference.update({'dob': _model.datePicked1}).then((_) {
                                  saveDateToLocal('datePicker1', _model.datePicked1!);

                                  Fluttertoast.showToast(
                                    msg: "Date of Birth updated successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                  );
                                }).catchError((error) {
                                  Fluttertoast.showToast(
                                    msg: "Failed to update Date of Birth: $error",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                  );
                                });
                              }
                            })
                                .catchError((error) {
                              Fluttertoast.showToast(
                                msg: "Failed to retrieve documents: $error",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            });
                          });
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () async {
                                final datePicked2Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: getCurrentTimestamp,
                                  lastDate: DateTime(2050),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor: FlutterFlowTheme.of(context).info,
                                      headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                        fontFamily: 'Outfit',
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                      pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                      selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                      iconSize: 24.0,
                                    );
                                  },
                                );


                                if (datePicked2Date != null) {
                                  safeSetState(() {
                                    _model.datePicked2 = datePicked2Date;

                                    // Query the `user` collection for documents where `uid` matches `currentUserUid`
                                    FirebaseFirestore.instance
                                        .collection('user')
                                        .where('uid', isEqualTo: currentUserUid)
                                        .get()
                                        .then((querySnapshot) {
                                      for (var doc in querySnapshot.docs) {
                                        // Update the `dob` field in each matching document
                                        doc.reference.update({'dob': _model.datePicked2}).then((_) {
                                          saveDateToLocal('datePicker2', _model.datePicked2!);

                                          Fluttertoast.showToast(
                                            msg: "Date of Birth updated successfully",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                          );
                                        }).catchError((error) {
                                          Fluttertoast.showToast(
                                            msg: "Failed to update Date of Birth: $error",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                          );
                                        });
                                      }
                                    })
                                        .catchError((error) {
                                      Fluttertoast.showToast(
                                        msg: "Failed to retrieve documents: $error",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                      );
                                    });
                                  });
                                }

                              },
                              child: Icon(
                                Icons.calendar_today,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date of Birth',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  _model.datePicked1 != null
                                      ? DateFormat('yyyy-MM-dd').format(_model.datePicked1!)
                                      : _model.datePicked2 != null
                                      ? DateFormat('yyyy-MM-dd').format(_model.datePicked2!)
                                      : 'Select a Date',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Jaldi',
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),                        ],
                      ),
                    ),
                    // Align(
                    //   child: Padding(
                    //     padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    //     child: Text(
                    //       _model.datePicked1 != null
                    //           ? DateFormat('yyyy-MM-dd').format(_model.datePicked1!)
                    //           : _model.datePicked2 != null
                    //           ? DateFormat('yyyy-MM-dd').format(_model.datePicked2!)
                    //           : 'Select a Date',
                    //       style: FlutterFlowTheme.of(context).bodyMedium.override(
                    //         fontFamily: 'Jaldi',
                    //         fontSize: 13.0,
                    //         letterSpacing: 0.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
                          Align(
                            alignment: const AlignmentDirectional(-0.47, -0.15),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE5E5E5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 46.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'eeptzq1r' /* Login Settings */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 52.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('editemailid');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('editemailid');
                                          },
                                          child: Icon(
                                            Icons.email_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'grd6o64f' /* Email  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      55.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<CustomerRecord>>(
                                        stream: queryCustomerRecord(
                                          queryBuilder: (customerRecord) =>
                                              customerRecord.where(
                                            'uid',
                                            isEqualTo: currentUserUid,
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CustomerRecord>
                                              textCustomerRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textCustomerRecord =
                                              textCustomerRecordList.isNotEmpty
                                                  ? textCustomerRecordList.first
                                                  : null;

                                          return Text(
                                            valueOrDefault<String>(
                                              textCustomerRecord?.email,
                                              'user@email.comg',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Jaldi',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          );
                                        },
                                      ),
                                    ],
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
