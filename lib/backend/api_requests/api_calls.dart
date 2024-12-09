import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetlocationCall {
  static Future<ApiCallResponse> call({
    String? lat = '34.17941649999999',
    String? long = '-118.3790527',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getlocation',
      apiUrl: 'https://geocode.maps.co/reverse?lat=$lat&lon=$long',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? fulladress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.display_name''',
      ));
  static String? roadname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address.road''',
      ));
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address.city''',
      ));
  static String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address.state''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address.country''',
      ));
  static String? postcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address.postcode''',
      ));
  static String? countrycode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.address.country_code''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
