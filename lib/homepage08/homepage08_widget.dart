import 'package:dropdown_button2/dropdown_button2.dart';

import '../droppoint/Droppoint_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage08_model.dart';
export 'homepage08_model.dart';
import 'package:customer/profilemenu/profilemenu_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Homepage08Widget extends StatefulWidget {
  const Homepage08Widget({
    Key? key,
    this.selectedAddress, // Add selectedAddress as a parameter
  }) : super(key: key);

  final String? selectedAddress; // Declare the variable to hold the selected address
  @override
  State<Homepage08Widget> createState() => _Homepage08WidgetState();
}

class _Homepage08WidgetState extends State<Homepage08Widget> {
  late Homepage08Model _model;
  bool _isLoading = true; // Define a loading state
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _addressController = TextEditingController();
  int? selectedIndex;

  String? selectedAddress;
  String? _feild2Value;


  List<Widget> dropLocationButtons = [];

  TextEditingController dimensionController = TextEditingController();
  bool _isSubmitted = false;


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Homepage08Model());
    _addressController = TextEditingController(
        text: widget.selectedAddress ?? 'Select Pickup Location');

    _fetchPickupAddress().then((_) {
      _fetchOrderDetails(); // Fetch drop locations
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    selectedAddress = widget.selectedAddress ?? 'Select Pickup Location';
  }



  Future<void> validateAndProceed(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? orderId = prefs.getString('orderId');

    if (orderId != null) {
      // Retrieve document data from Firebase
      DocumentSnapshot orderSnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .get();

      if (orderSnapshot.exists) {
        var data = orderSnapshot.data() as Map<String, dynamic>;
        bool isPickupFilled = data['PickupselectedAddress'] != null &&
            data['PickupselectedAddress'].isNotEmpty;
        bool isDropFilled = data['selectedDropAddress0'] != null &&
            data['selectedDropAddress0'].isNotEmpty;

        if (_model.textController.text.isNotEmpty &&
            _model.dropDownValue != null &&
            isPickupFilled &&
            isDropFilled) {
          await updateOrderDetails(); // Update Firebase document
          context.pushNamed('paymentpage'); // Navigate to payment page
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please fill in all required fields')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Order not found')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order ID not found')),
      );
    }
  }

  Future<void> updateOrderDetails() async {
    try {
      // Retrieve the order ID from local storage
      final prefs = await SharedPreferences.getInstance();
      final orderId = prefs.getString('orderId');

      if (orderId != null) {
        // Update the order document in Firestore
        await FirebaseFirestore.instance.collection('orders')
            .doc(orderId)
            .update({

          'dimension': _model.textController.text, // Dimension
          'vehicleType': _model.dropDownValue, // Vehicle type
        });
        print('Order details updated successfully.');
      } else {
        print('Order ID not found in local storage');
      }
    } catch (error) {
      print('Error updating order details: $error');
    }
  }

  Future<void> _fetchPickupAddress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final orderId = prefs.getString('orderId');
      if (orderId != null) {
        DocumentSnapshot orderSnapshot = await FirebaseFirestore.instance
            .collection('orders')
            .doc(orderId)
            .get();

        if (orderSnapshot.exists) {
          setState(() {
            _addressController.text = orderSnapshot['PickupselectedAddress'] ?? 'Select Pickup Location';
          });
        }
      }
    } catch (error) {
      print('Error fetching pickup address: $error');
    }
  }

// Fetch order details based on the order ID stored in local storage
  Future<void> _fetchOrderDetails() async {
    setState(() {
      _isLoading = true; // Start loading indicator
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      final orderId = prefs.getString('orderId');

      if (orderId != null) {
        DocumentSnapshot orderSnapshot = await FirebaseFirestore.instance
            .collection('orders')
            .doc(orderId)
            .get();

        if (orderSnapshot.exists) {
          final data = orderSnapshot.data() as Map<String, dynamic>;
          final addresses = data.keys
              .where((key) => key.startsWith('selectedDropAddress'))
              .toList();

          setState(() {
            dropLocationButtons.clear(); // Clear any existing buttons

            for (var addressKey in addresses) {
              final addressValue = data[addressKey] ?? 'Select Drop Location';
              dropLocationButtons.add(
                _buildDropLocationButton(
                  dropLocationButtons.length, // Pass index
                  addressValue, // Pass address value dynamically
                ),
              );
            }
          });
        } else {
          print('Order not found');
        }
      } else {
        print('Order ID not found in local storage');
      }
    } catch (error) {
      print('Error fetching order details: $error');
    } finally {
      setState(() {
        _isLoading = false; // Stop loading indicator
      });
    }
  }

  @override
  void dispose() {
    dimensionController.dispose();
    _model.dispose();
    _addressController?.dispose();

    super.dispose();
  }

  // Function to remove a drop location button

  void _removeDropLocationButton(int index) async {
    String? removedAddress; // To store the address being removed

    setState(() {
      // Remove the button from the list
      if (dropLocationButtons.length > 1) {
        dropLocationButtons.removeAt(index);
      }
    });

    try {
      // Retrieve the order ID from local storage
      final prefs = await SharedPreferences.getInstance();
      final orderId = prefs.getString('orderId');

      if (orderId != null) {
        // Fetch the order data
        DocumentSnapshot orderSnapshot = await FirebaseFirestore.instance
            .collection('orders')
            .doc(orderId)
            .get();

        if (orderSnapshot.exists) {
          var data = orderSnapshot.data() as Map<String, dynamic>;

          // Get the address of the selected index
          removedAddress = data['selectedDropAddress$index'];

          // Prepare updates to delete the fields for this index
          Map<String, dynamic> deleteUpdates = {
            'selectedDropAddress$index': FieldValue.delete(),
            'DropAddress$index': FieldValue.delete(),
            'DropLandmark$index': FieldValue.delete(),
            'DropSendername$index': FieldValue.delete(),
            'Dropmobileno$index': FieldValue.delete(),
            'Findex$index': FieldValue.delete(),
            'updatedAt$index': FieldValue.delete(),
          };

          // Update Firestore to delete the fields
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(orderId)
              .update(deleteUpdates);

          // Show a toast message with the removed address
          if (removedAddress != null) {
            Fluttertoast.showToast(
              msg: "Removed drop location: $removedAddress",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black,
              textColor: Colors.white,
            );
          }
        }
      }
    } catch (error) {
      // Show a toast in case of an error
      Fluttertoast.showToast(
        msg: "Error removing drop location.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // Function to build a drop location button with a minus button to remove it
  Widget _buildDropLocationButton(int index, String addressText) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.location_pin,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
            Container(
              width: 2,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFFFD683D),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 5, 5),
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FFButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DroppointWidget(),
                      settings: RouteSettings(arguments: {'index': index}),
                    ),
                  );
                },
                text: addressText, // Set the address text dynamically
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 52,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Jaldi',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 12,
                  ),
                  elevation: 0,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.remove_circle_outline_rounded,
            color: Colors.red,
            size: 24,
          ),
          onPressed: () => _removeDropLocationButton(index),
        ),
      ],
    );
  }

  // Function to add new drop location button
  void _addNewDropLocationButton() {
    setState(() {
      dropLocationButtons.add(
        _buildDropLocationButton(
          dropLocationButtons.length, // Pass index
          'Select Drop Location',    // Pass default text
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: Color(0xFFFDA900),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: _isLoading // If loading, show CircularProgressIndicator
              ? Center(
            child: CircularProgressIndicator(
              color: FlutterFlowTheme
                  .of(context)
                  .primary,
            ),
          )
              : Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image
                          .asset(
                        'assets/images/H_symbol.png',
                      )
                          .image,
                    ),
                  ),
                  child: SingleChildScrollView(
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
                              20, 80, 10, 0), // Padding for the container
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFD2D2D2),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),),
                            // child: SingleChildScrollView( // Make the entire area scrollable
                            child: Column(
                              children: [
                                // Pickup Location Button with Icon and Line
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 30), // Add space above the icon
                                        Icon(
                                          Icons.my_location_outlined,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          size: 24, // Size of the icon
                                        ),
                                        Container(
                                          width: 2,
                                          height: 30,
                                          // Length of the line connecting pickup icon to button
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFD683D), // Color of the line
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10), // Space between icon and line
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 50, 5),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed('Pickuppoint');
                                          },
                                          text: _addressController.text, // Display address from the controller
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 52,
                                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                              fontFamily: 'Jaldi',
                                              color: Colors.black,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            elevation: 0,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Dynamically add drop location buttons

                                ...dropLocationButtons,

                                // Plus button to add a new drop location
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: FlutterFlowTheme
                                        .of(context)
                                        .primaryText,
                                    size: 24,
                                  ),
                                  onPressed: _addNewDropLocationButton,
                                ),
                              ],
                            ),
                            // ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'h8y2gvsz' /* Dimension */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Jaldi',
                                  fontSize: 19,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Container(
                            width: double.infinity,
                            height: 63,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme
                                  .of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.diceD6,
                                    color: Color(0xFFD2D2D2),
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Container(
                                      width: 200,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme
                                              .of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'wompoitc' /* 0 */,
                                          ),
                                          hintStyle: FlutterFlowTheme
                                              .of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme
                                                  .of(context)
                                                  .error,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme
                                                  .of(context)
                                                  .error,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme
                                              .of(context)
                                              .secondaryBackground,
                                          errorText: _isSubmitted &&
                                              _model.textController.text.isEmpty
                                              ? 'Dimension is required'
                                              : null,
                                        ),
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                        textAlign: TextAlign.start,
                                        cursorColor: FlutterFlowTheme
                                            .of(context)
                                            .primaryText,
                                        keyboardType: TextInputType
                                            .number, // This will show the numeric keyboard
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '7gcb6ce5' /* Kg */,
                                    ),
                                    style: FlutterFlowTheme
                                        .of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Jaldi',
                                      color: Color(0xFF191D31),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      lineHeight: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0), // Adjusted for consistent spacing
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'wzvxya3q' /* Choose Vehicle type */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Jaldi',
                                  fontSize: 19,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: _model.dropDownValue,
                            onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
                            items: [
                              DropdownMenuItem(
                                value: 'Two Wheeler',
                                child: Row(
                                  children: [
                                    Icon(Icons.motorcycle, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text('Two Wheeler'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Car',
                                child: Row(
                                  children: [
                                    Icon(Icons.directions_car, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text('Car'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Truck',
                                child: Row(
                                  children: [
                                    Icon(Icons.local_shipping, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text('Truck'),
                                  ],
                                ),
                              ),
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            ),
                            isDense: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            dropdownColor: FlutterFlowTheme.of(context).secondaryBackground,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                            alignment: Alignment.centerLeft,
                            menuMaxHeight: 200,
                          ),
                        ],
                      ),
                    ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        //   child: FlutterFlowDropDown<String>(
                        //     controller: _model.dropDownValueController ??=
                        //         FormFieldController<String>(null),
                        //     options: [
                        //       FFLocalizations.of(context).getText(
                        //         '89v5t30v' /* Two Wheeler */,
                        //
                        //       ),
                        //       FFLocalizations.of(context).getText(
                        //         'fhll2fr9' /* Car */,
                        //       ),
                        //       FFLocalizations.of(context).getText(
                        //         'lmb1tb4p' /* Truck */,
                        //       )
                        //     ],
                        //     onChanged: (val) =>
                        //         safeSetState(() => _model.dropDownValue = val),
                        //     width: double.infinity,
                        //     height: 59,
                        //     textStyle:
                        //     FlutterFlowTheme
                        //         .of(context)
                        //         .bodyMedium
                        //         .override(
                        //       fontFamily: 'Readex Pro',
                        //       letterSpacing: 0.0,
                        //     ),
                        //     icon: Icon(
                        //       Icons.keyboard_arrow_down_rounded,
                        //       color: FlutterFlowTheme
                        //           .of(context)
                        //           .secondaryText,
                        //       size: 24,
                        //     ),
                        //     fillColor:
                        //     FlutterFlowTheme
                        //         .of(context)
                        //         .secondaryBackground,
                        //     elevation: 2,
                        //     borderColor: Colors.transparent,
                        //     borderWidth: 0,
                        //     borderRadius: 8,
                        //     margin: EdgeInsetsDirectional.fromSTEB(
                        //         12, 0, 12, 0),
                        //     hidesUnderline: true,
                        //     isOverButton: false,
                        //     isSearchable: false,
                        //     isMultiSelect: false,
                        //   ),
                        // ),

                        if (_isSubmitted && _model.dropDownValue == null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10, 0, 10, 0),
                            child: Text(
                              'Vehicle type is required',
                              style: TextStyle(
                                color: FlutterFlowTheme
                                    .of(context)
                                    .error,
                                fontSize: 14,
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          _isSubmitted =
                          true; // Mark form as submitted to trigger validation
                        });
                        await validateAndProceed(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'ds4gvinx' /* Submit */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44,
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF183835),
                        textStyle: FlutterFlowTheme
                            .of(context)
                            .titleSmall
                            .override(
                          fontFamily: 'Jaldi',
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(6),
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
