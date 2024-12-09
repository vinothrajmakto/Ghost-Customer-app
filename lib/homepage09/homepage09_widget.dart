import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'homepage09_model.dart';
export 'homepage09_model.dart';
import 'package:customer/profilemenu/profilemenu_widget.dart';

class Homepage09Widget extends StatefulWidget {
  const Homepage09Widget({super.key});

  @override
  State<Homepage09Widget> createState() => _Homepage09WidgetState();
}

class _Homepage09WidgetState extends State<Homepage09Widget> {
  late Homepage09Model _model;
  bool _isLoading = true; // Define a loading state
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Homepage09Model());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          _isLoading = false; // Set loading to false once done
        });
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<bool> _onWillPop() async {
    // Return false to prevent back navigation
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFDA900),
        body: SafeArea(
          top: true,
          child: _isLoading // If loading, show CircularProgressIndicator
              ? Center(
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          )
              :SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'assets/images/H_symbol.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(25, 20, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      opaque: false, // Makes the background partially visible
                                      pageBuilder: (context, animation, secondaryAnimation) => Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Navigator.of(context).pop(), // Close the menu on tap
                                            child: Container(
                                              color: Colors.black.withOpacity(0.5), // Dark overlay with transparency
                                            ),
                                          ),
                                          FractionallySizedBox(
                                            widthFactor: 0.8, // Set the profile menu to 80% width
                                            alignment: Alignment.centerLeft, // Align to the left side of the screen
                                            child: SlideTransition(
                                              position: Tween<Offset>(
                                                begin: Offset(-1.0, 0.0), // Slide in from the left
                                                end: Offset.zero,
                                              ).animate(CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.easeInOut,
                                              )),
                                              child: ProfilemenuWidget(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );

                                },
                                child: FractionallySizedBox(
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1.06, 0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                          child: Container(
                                            width: 53,
                                            height: 53,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(0, 0),
                                              child: Icon(
                                                Icons.density_medium,
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                size: 24,
                                              ),
                                            ),
                                          ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, MediaQuery.of(context).size.height * 0.05, 20.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.all(20.0), // Inner padding for the container
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Adjust height based on content
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '7x3he5h6' /* Delivery anything, anywhere */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.0 * MediaQuery.of(context).textScaleFactor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0), // Adjust spacing between text widgets
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5lebftu9' /* Sit back and relax, we will do... */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 9.0 * MediaQuery.of(context).textScaleFactor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: 16.0), // Space between text and button
                                FFButtonWidget(
                                  onPressed: () {
                                    context.pushNamed('homepage08');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '7vlw381h' /* Select Pickup and Delivery Loc... */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity, // Full width to align with container
                                    height: 42.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                    color: const Color(0xFF596273),
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 13.0 * MediaQuery.of(context).textScaleFactor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 268.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEDEDED),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'z69d6cnd' /* Hassle free delivery  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
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
                                    10.0, 0.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 0.0),
                                        child: Container(
                                          width: 252.0,
                                          height: 210.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF014F48),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFF263E3B),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              'assets/images/image01.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 20.0, 0.0),
                                        child: Container(
                                          width: 252.0,
                                          height: 210.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF014F48),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFF263E3B),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              'assets/images/image02.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 20.0, 0.0),
                                        child: Container(
                                          width: 252.0,
                                          height: 210.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF014F48),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFF263E3B),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              'assets/images/image03.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 20.0, 0.0),
                                        child: Container(
                                          width: 252.0,
                                          height: 210.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF014F48),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFF263E3B),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
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
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
