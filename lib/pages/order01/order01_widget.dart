import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'order01_model.dart';
export 'order01_model.dart';

class Order01Widget extends StatefulWidget {
  const Order01Widget({super.key});

  @override
  State<Order01Widget> createState() => _Order01WidgetState();
}

class _Order01WidgetState extends State<Order01Widget> {
  late Order01Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Order01Model());

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
        resizeToAvoidBottomInset: false,
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
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 768.0,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        child: FlutterFlowPlacePicker(
                                          iOSGoogleMapsApiKey:
                                              'AIzaSyC2Vdj7JPSjSjs0g85GweGyZVgzJa-_3j4',
                                          androidGoogleMapsApiKey:
                                              'AIzaSyC2Vdj7JPSjSjs0g85GweGyZVgzJa-_3j4',
                                          webGoogleMapsApiKey:
                                              'AIzaSyC2Vdj7JPSjSjs0g85GweGyZVgzJa-_3j4',
                                          onSelect: (place) async {
                                            safeSetState(() => _model
                                                .placePickerValue = place);
                                          },
                                          defaultText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            '5ajum07d' /* Search Location */,
                                          ),
                                          icon: const Icon(
                                            Icons.search,
                                            color: Color(0xFFCCCCCC),
                                            size: 26.0,
                                          ),
                                          buttonOptions: FFButtonOptions(
                                            width: double.infinity,
                                            height: double.infinity,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Jaldi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 543.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FlutterFlowGoogleMap(
                                    controller: _model.googleMapsController,
                                    onCameraIdle: (latLng) =>
                                        _model.googleMapsCenter = latLng,
                                    initialLocation: _model.googleMapsCenter ??=
                                        const LatLng(13.106061, -59.613158),
                                    markerColor: GoogleMarkerColor.violet,
                                    markerImage: const MarkerImage(
                                      imagePath:
                                          'assets/images/kindpng_2760684.png',
                                      isAssetImage: true,
                                      size: 20.0 ?? 20,
                                    ),
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.standard,
                                    initialZoom: 14.0,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: true,
                                    showLocation: true,
                                    showCompass: false,
                                    showMapToolbar: false,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '9a76szv8' /* Delivery Point */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Jaldi',
                                                  color: const Color(0xFFBCBCBC),
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'r9vep871' /* 4014 Way CBD */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Jaldi',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                      onPressed: () {
                        context.pushNamed('deliveryaddress');
                      },
                      text: FFLocalizations.of(context).getText(
                        'yvs6muaj' /* Confirm */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFDA900),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Jaldi',
                                  color: Colors.white,
                                  fontSize: 17.0,
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
