import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'endpoints_string.dart';

// Get -> List , Map
// Put -> List , Map
// Post -> List , Map

class RestApi {

  Map<String, String> _buildHeaders({Map<String, String>? additionalHeaders}) {
    if (additionalHeaders != null) {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        ...additionalHeaders,
      };
      return headers;
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  void _printRequest(http.Response response) {
    print('Request: ${response.request}');
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

  Future<Map<String, dynamic>> getMap({required String endpoint, Map<String, dynamic>? parms}) async {
    EasyLoading.show(status: 'loading...');

    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(
        uri.replace(queryParameters: parms),
        headers: _buildHeaders(),
      );
      _printRequest(response);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse is Map<String, dynamic> &&
            decodedResponse.isNotEmpty) {
          EasyLoading.dismiss();
          return decodedResponse;
        } else {
          EasyLoading.showError("Error occurred while making GET Request");
          throw Exception('Unsupported type: ${decodedResponse.runtimeType}');
        }
      } else {
        if (kDebugMode) {
          print(
              'Request failed when status code is not 200 with status: ${response.statusCode}');
        }
        EasyLoading.showError("Error occurred while making GET Request");
        throw Exception('Failed to make GET request');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while making GET request: $e');
      }
      EasyLoading.showError("Error occurred while making GET Request");
      throw Exception('Failed to make GET request: $e');
    }
  }

  Future<List> getList({required String endpoint, Map<String, dynamic>? params}) async {
    EasyLoading.show(status: 'Loading...');
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(
        uri.replace(queryParameters: params),
        headers: _buildHeaders(),
      );
      _printRequest(response);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse is List<dynamic> && decodedResponse.isNotEmpty) {
          EasyLoading.dismiss();
          return decodedResponse;
        } else {
          EasyLoading.showError("Error occurred while making GET Request");
          throw Exception('Unsupported type: ${decodedResponse.runtimeType}');
        }
      } else {
        if (kDebugMode) {
          print(
              'Request failed when status code is not 200 with status: ${response.statusCode}');
        }
        EasyLoading.showError("Error occurred while making GET Request");
        throw Exception('Failed to make GET request');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while making GET request: $e');
      }
      EasyLoading.showError("Error occurred while making GET Request");
      throw Exception('Failed to make GET request: $e');
    }
  }

  Future<Map<String, dynamic>> postMap({required String endpoint, Map<String, dynamic>? parms}) async {
    EasyLoading.show(status: 'loading...');

    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(
        uri.replace(queryParameters: parms),
        headers: _buildHeaders(),
      );
      _printRequest(response);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse is Map<String, dynamic> &&
            decodedResponse.isNotEmpty) {
          EasyLoading.dismiss();
          return decodedResponse;
        } else {
          EasyLoading.showError("Error occurred while making GET Request");
          throw Exception('Unsupported type: ${decodedResponse.runtimeType}');
        }
      } else {
        if (kDebugMode) {
          print(
              'Request failed when status code is not 200 with status: ${response.statusCode}');
        }
        EasyLoading.showError("Error occurred while making GET Request");
        throw Exception('Failed to make GET request');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while making GET request: $e');
      }
      EasyLoading.showError("Error occurred while making GET Request");
      throw Exception('Failed to make GET request: $e');
    }
  }

}



