import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
export 'deliveryaddress_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'deliveryaddress_model.dart';

class DeliveryaddressWidget extends StatefulWidget {
  final String? selectedAddress; // Optional if you want
  final int? FirstIndex;

  const DeliveryaddressWidget({
    Key? key,
    this.selectedAddress,
    this.FirstIndex,

  }) : super(key: key);

  @override
  State<DeliveryaddressWidget> createState() => _DeliveryaddressWidgetState();
}

class _DeliveryaddressWidgetState extends State<DeliveryaddressWidget> {
  late DeliveryaddressModel _model;
  bool _isSubmitted = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryaddressModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
    int Findex = widget.FirstIndex as int;

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
    Fluttertoast.showToast(
      msg: "Final: $Findex",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // Retrieve the orderId from SharedPreferences
  Future<String?> getStoredOrderId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('orderId');
  }

  // Update the existing order in Firestore
  void handleSubmit() async {
    try {
      // Retrieve the stored orderId
      String? orderId = await getStoredOrderId();

      if (orderId == null) {
        throw Exception('No order ID found in local storage.');
      }

      int Findex = widget.FirstIndex as int;

      // Get the selected address and text field values
      String selectedAddress = widget.selectedAddress ?? 'No address found';
      String field1 = _model.textController1.text;
      String field2 = _model.textController2.text;
      String field3 = _model.textController3.text;
      String field4 = _model.textController4.text;

      // Check if any field is empty
      if (field1.isEmpty ||
          field2.isEmpty ||
          field3.isEmpty ||
          field4.isEmpty) {
        Fluttertoast.showToast(
          msg: "Please fill in all required fields.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
        );
        return; // Exit function if validation fails
      }

      // Create the updated order data dynamically based on Findex
      Map<String, dynamic> updatedOrderData = {
        'Findex': Findex,
        'selectedDropAddress$Findex': selectedAddress,
        'DropAddress$Findex': field1,
        'DropLandmark$Findex': field2,
        'DropSendername$Findex': field3,
        'Dropmobileno$Findex': field4,
        'updatedAt$Findex': FieldValue.serverTimestamp(),
      };

      // Reference to Firestore document
      var documentReference =
      FirebaseFirestore.instance.collection('orders').doc(orderId);

      // Update the Firestore document
      await documentReference.update(updatedOrderData);

      Fluttertoast.showToast(
        msg: "Order successfully updated with Findex $Findex!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Navigate to the homepage or another screen
      context.pushNamed(
        'homepage08',
        queryParameters: {
          'selectedAddress': selectedAddress,
        },
      );
    } catch (e) {
      // Show error message in a Toast
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
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
        resizeToAvoidBottomInset: true, // Set this to true to adjust layout when keyboard appears
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 758.0,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'yk07j9e5' /* Enter the Address */,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 241.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          FlutterFlowGoogleMap(
                                            controller: _model.googleMapsController,
                                            onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                                            initialLocation: _model.googleMapsCenter ??= const LatLng(13.106061, -59.613158),
                                            markerColor: GoogleMarkerColor.violet,
                                            mapType: MapType.normal,
                                            style: GoogleMapStyle.dark,
                                            initialZoom: 14.0,
                                            allowInteraction: false,
                                            allowZoom: false,
                                            showZoomControls: false,
                                            showLocation: true,
                                            showCompass: false,
                                            showMapToolbar: false,
                                            showTraffic: false,
                                            centerMapOnMarkerTap: true,
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(-1.0, 1.0),
                                            child: PointerInterceptor(
                                              intercepting: isWeb,
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                    width: 316.0,
                                                    height: 51.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                      borderRadius: const BorderRadius.only(
                                                        bottomLeft: Radius.circular(10.0),
                                                        bottomRight: Radius.circular(10.0),
                                                        topLeft: Radius.circular(10.0),
                                                        topRight: Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                          child: Icon(
                                                            Icons.location_on,
                                                            color: Color(0xFFEA6E0E),
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            widget.selectedAddress ?? 'No address found', // Use the selected address here
                                                            style: FlutterFlowTheme.of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily: 'Readex Pro',
                                                              letterSpacing: 0.0,
                                                            ),
                                                            overflow: TextOverflow.ellipsis, // Handles long text
                                                            maxLines: 1, // Limits the text to one line
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0), // Adjust padding as needed
                                                          child: TextButton(
                                                            onPressed: () async {
                                                              context.pushNamed('Pickuppoint');
                                                            },
                                                            child: Text(
                                                              FFLocalizations.of(context).getText('2thuuxj9' /* Edit */),
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Readex Pro',
                                                                color: const Color(0xFFEA6E0E),
                                                                letterSpacing: 0.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )

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
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 10.0, 20.0, 0.0),
                                            child: SizedBox(
                                              width: 294.0,
                                              child: TextFormField(
                                                controller:
                                                _model.textController1,
                                                focusNode:
                                                _model.textFieldFocusNode1,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: FFLocalizations.of(
                                                      context)
                                                      .getText(
                                                    '751mafbf' /* Enter Address */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Jaldi',
                                                    color: Colors.black, // Ensure label is visible
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                    fontFamily: 'Jaldi',
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  enabledBorder:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFD2D2D2),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(5.0),
                                                      bottomRight:
                                                      Radius.circular(5.0),
                                                      topLeft:
                                                      Radius.circular(5.0),
                                                      topRight:
                                                      Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFD2D2D2),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(5.0),
                                                      bottomRight:
                                                      Radius.circular(5.0),
                                                      topLeft:
                                                      Radius.circular(5.0),
                                                      topRight:
                                                      Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    const BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(5.0),
                                                      bottomRight:
                                                      Radius.circular(5.0),
                                                      topLeft:
                                                      Radius.circular(5.0),
                                                      topRight:
                                                      Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    const BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(5.0),
                                                      bottomRight:
                                                      Radius.circular(5.0),
                                                      topLeft:
                                                      Radius.circular(5.0),
                                                      topRight:
                                                      Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  filled: false,
                                                  fillColor:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                  errorText: _isSubmitted && _model.textController1.text.isEmpty
                                                      ? 'Address is required'
                                                      : null,
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                                maxLines: 2,
                                                cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
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
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 10.0, 20.0, 0.0),
                                          child: SizedBox(
                                            width: 294.0,
                                            child: TextFormField(
                                              controller:
                                              _model.textController2,
                                              focusNode:
                                              _model.textFieldFocusNode2,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'scmfm2y1' /* Landmark (Optional) */,
                                                ),
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily: 'Jaldi',
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'Jaldi',
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                enabledBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD2D2D2),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(5.0),
                                                    bottomRight:
                                                    Radius.circular(5.0),
                                                    topLeft:
                                                    Radius.circular(5.0),
                                                    topRight:
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD2D2D2),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(5.0),
                                                    bottomRight:
                                                    Radius.circular(5.0),
                                                    topLeft:
                                                    Radius.circular(5.0),
                                                    topRight:
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(5.0),
                                                    bottomRight:
                                                    Radius.circular(5.0),
                                                    topLeft:
                                                    Radius.circular(5.0),
                                                    topRight:
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(5.0),
                                                    bottomRight:
                                                    Radius.circular(5.0),
                                                    topLeft:
                                                    Radius.circular(5.0),
                                                    topRight:
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                filled: false,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              maxLines: 2,
                                              cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                                          child: SizedBox(
                                            width: 294.0,
                                            child: TextFormField(
                                              controller: _model.textController3,
                                              focusNode: _model.textFieldFocusNode3,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: FFLocalizations.of(context).getText(
                                                  'gq7wk5zw' /* Sender’s Name */,
                                                ),
                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'Jaldi',
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                floatingLabelBehavior:
                                                FloatingLabelBehavior.auto, // Floating label effect
                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'Jaldi',
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD2D2D2),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                focusedBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD2D2D2),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                filled: false,
                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                errorText: _isSubmitted && _model.textController3.text.isEmpty
                                                    ? 'Receiver Name is required'
                                                    : null,
                                              ),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              maxLines: 2, // Single line for name input
                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                              validator: _model.textController3Validator.asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                                          child: SizedBox(
                                            width: 294.0,
                                            child: TextFormField(
                                              controller: _model.textController4,
                                              focusNode: _model.textFieldFocusNode4,
                                              autofocus: false,
                                              obscureText: false,
                                              keyboardType: TextInputType.number, // Restrict to numbers
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly
                                              ], // Digits only
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: FFLocalizations.of(context).getText(
                                                  'h5hrfow0' /* Sender’s Mobile number (Optional) */,
                                                ),
                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'Jaldi',
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                floatingLabelBehavior:
                                                FloatingLabelBehavior.auto, // Floating label effect
                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'Jaldi',
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD2D2D2),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                focusedBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD2D2D2),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                                ),
                                                filled: false,
                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                errorText: _isSubmitted && _model.textController4.text.isEmpty
                                                    ? 'Receiver Number is required'
                                                    : null,
                                              ),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Jaldi',
                                                letterSpacing: 0.0,
                                              ),
                                              maxLines: 2, // Single line for mobile number input
                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                              validator: _model.textController4Validator.asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.check_box_outline_blank,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'kk506vhf' /* Save to addresses */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Jaldi',
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
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
                    child: FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          _isSubmitted = true; // Mark form as submitted to trigger validation
                        });
                        handleSubmit(); // Call the submit function
                      },
                      text: FFLocalizations.of(context).getText('w27tl67v' /* Submit */),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        color: const Color(0xFFFDA900),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Jaldi',
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                        ),
                        elevation: 3.0,
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
