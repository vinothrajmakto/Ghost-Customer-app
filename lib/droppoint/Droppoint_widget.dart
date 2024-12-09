import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../deliveryaddress/deliveryaddress_widget.dart';
import '../pickupaddress/pickupaddress_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DroppointWidget extends StatefulWidget {
  const DroppointWidget({super.key});

  @override
  _DroppointWidgetState createState() => _DroppointWidgetState();
}

class _DroppointWidgetState extends State<DroppointWidget> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final String _apiKey = 'AIzaSyDGcjE5VvycpVAgJ7Ck6sFShqAqg0A7fNo';
  int Bindex = 0;

  GoogleMapController? _mapController;
  LatLng _selectedLocation = const LatLng(24.4539, 54.3773); // Abu Dhabi as default
  String? _selectedAddress = 'Fetching address...';
  BitmapDescriptor? _customMarkerIcon;
  bool _isMapMoving = false;
  bool _locationEnabled = false; // Track if GPS is enabled
  late AnimationController _animationController;
  late Animation<double> _animation;
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  // Fetch location suggestions
  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          setState(() {
            _searchResults = data['predictions'];
          });
        }
      }
    } catch (e) {
      print('Error fetching search results: $e');
    }
  }

  // Get place details and update the map
  Future<void> _selectPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final location = data['result']['geometry']['location'];
          final latLng = LatLng(location['lat'], location['lng']);

          _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
          setState(() {
            _selectedLocation = latLng;
            _searchController.clear();
            _searchResults = [];
            _selectedAddress = data['result']['formatted_address'];
          });
        }
      }
    } catch (e) {
      print('Error fetching place details: $e');
    }
  }

  Future<String?> getOrderId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('orderId');
  }
  @override
  void initState() {
    super.initState();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    Bindex = args?['index'] ?? 0;
    _setCustomMarkerIcon();
    _initializePulsatingCircle();
    _checkAndRequestLocation();
  }


  // Check if location is enabled, if not prompt user to enable it
  Future<void> _checkAndRequestLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Prompt the user to enable location services
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location still disabled, set to default (Abu Dhabi)
        setState(() {
          _selectedAddress = 'Location services are disabled. Showing Abu Dhabi.';
          _selectedLocation = const LatLng(24.4539, 54.3773);
        });
        return;
      }
    }

    // Check and request permission if needed
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
      // Permissions are denied, use default location (Abu Dhabi)
      setState(() {
        _selectedAddress = 'Location permission denied. Showing Abu Dhabi.';
        _selectedLocation = const LatLng(24.4539, 54.3773);
      });
    } else {
      // Permission granted, get current position
      _locationEnabled = true;
      await _getCurrentLocation();
    }
  }

  // Get current location and update the map
  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _updateMapLocation(LatLng(position.latitude, position.longitude));
  }

  // Load custom marker icon
  Future<void> _setCustomMarkerIcon() async {
    final BitmapDescriptor markerIcon = await _getCustomMarker();
    setState(() {
      _customMarkerIcon = markerIcon;
    });
  }

  // Function to load custom marker image
  Future<BitmapDescriptor> _getCustomMarker() async {
    final Uint8List markerIcon = await _loadAssetImage('assets/custom_marker.png');
    return BitmapDescriptor.fromBytes(markerIcon);
  }

  // Load image from assets as Uint8List
  Future<Uint8List> _loadAssetImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  // Pulsating circle animation
  void _initializePulsatingCircle() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  // Update map location and address
  Future<void> _updateMapLocation(LatLng latLng) async {
    setState(() {
      _selectedLocation = latLng;
    });
    _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
    await _updateLocationText(latLng);
  }

  // Update location and reverse geocode address
  Future<void> _updateLocationText(LatLng latLng) async {
    setState(() {
      _selectedAddress = 'Fetching address...'; // Set loading text
    });
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          setState(() {
            _selectedAddress = data['results'][0]['formatted_address'];
          });
        } else {
          setState(() {
            _selectedAddress = 'No address found';
          });
        }
      } else {
        setState(() {
          _selectedAddress = 'Error retrieving address';
        });
      }
    } catch (e) {
      setState(() {
        _selectedAddress = 'Failed to load address';
      });
    }
  }
  Future<void> _updateLocationInFirebase(LatLng latLng) async {
    try {
      // Retrieve the order ID from local storage
      final prefs = await SharedPreferences.getInstance();
      final orderId = prefs.getString('orderId');

      if (orderId != null) {
        // Update the lat, lng, and address in Firebase
        await FirebaseFirestore.instance.collection('orders').doc(orderId).update({
          'latLng': GeoPoint(latLng.latitude, latLng.longitude),  // Store latLng as GeoPoint
        });
        print('Location updated successfully.');
      } else {
        print('Order ID not found in local storage');
      }
    } catch (error) {
      print('Error updating location in Firebase: $error');
    }
  }

  Future<void> _confirmLocation() async {
    LatLng selectedLocation = LatLng(_selectedLocation.latitude, _selectedLocation.longitude);
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    Bindex = args?['index'] ?? 0;
    // Update Firebase with the new location
    if (selectedLocation != null ) {
      await _updateLocationInFirebase(selectedLocation);
    } else {
      print('Location or address is missing');
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryaddressWidget(
          selectedAddress: _selectedAddress,
          FirstIndex: Bindex,

        ),
      ),
    );
  }

  // Center map to the user's current location when GPS icon is clicked
  void _centerMapOnCurrentLocation() {
    if (_locationEnabled) {
      _getCurrentLocation(); // Fetch current location and center the map
    } else {
      _checkAndRequestLocation(); // Ask for location permission if needed
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Select Location'),
        backgroundColor: const Color(0xFFFFA800),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            onCameraMove: (position) {
              setState(() {
                _isMapMoving = true;
              });
            },
            onCameraIdle: () async {
              _isMapMoving = false;
              final cameraPosition = await _mapController!.getLatLng(ScreenCoordinate(
                x: MediaQuery.of(context).size.width ~/ 2,
                y: MediaQuery.of(context).size.height ~/ 2,
              ));
              _updateLocationText(cameraPosition);
            },
            zoomControlsEnabled: false,
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for a location',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: _searchPlaces,
                ),
                if (_searchResults.isNotEmpty)
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_searchResults[index]['description']),
                          onTap: () {
                            _selectPlace(_searchResults[index]['place_id']);
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Container(
                          width: _animation.value * 100,
                          height: _animation.value * 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                    const Icon(
                      Icons.location_on,
                      size: 50,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // GPS Icon for re-centering map
          Positioned(
            top: 70,
            right: 20,
            child: FloatingActionButton(
              onPressed: _centerMapOnCurrentLocation,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.my_location,
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 15,
            right: 15,
            child: Container(
              width: 375,
              height: 168,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drop Point',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFFBCBCBC),
                        fontFamily: 'Jaldi',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _selectedAddress ?? 'Fetching address...',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Jaldi',
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: _confirmLocation,
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Jaldi',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA800),
                        minimumSize: const Size(double.infinity, 44),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
