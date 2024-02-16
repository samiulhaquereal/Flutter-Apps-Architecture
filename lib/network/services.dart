import 'package:mvc_format/network/endpoints_string.dart';

import 'rest_api_client.dart';

class Services {

  RestApi _restApiClient = RestApi();

  Future<Map<String, dynamic>?> getTask({required int projectId}) async {
    final response = await _restApiClient.getMap(endpoint: endpoint_name);
    print('Printing response: $response');
    return response;
  }

  Future<List> getNameList() async {
    final response = await _restApiClient.getList(endpoint: endpoint_name);
    print('Printing response: $response');
    return response;
  }

  Future<Map<String, dynamic>?> driverLogin({
        required String phoneNumber
      }) async {
    final response = await _restApiClient.postMap(
        endpoint: endpoint_name,
        needEncode: true,
        body: {
          'phone': phoneNumber,
        }
    );
    print('Printing response: $response');
    return response;
  }

  Future<Map<String, dynamic>?> profileUpdate({
    required String phoneNumber
  }) async {
    final response = await _restApiClient.putMap(
        endpoint: endpoint_name,
        needEncode: true,
        body: {
          'phone': phoneNumber,
        }
    );
    print('Printing response: $response');
    return response;
  }


}
