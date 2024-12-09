import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _Phonenumber = '';
  String get Phonenumber => _Phonenumber;
  set Phonenumber(String value) {
    _Phonenumber = value;
  }

  LatLng? _location = const LatLng(25.2048493, 55.2707828);
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }

  String _uid = '';
  String get uid => _uid;
  set uid(String value) {
    _uid = value;
  }
}
