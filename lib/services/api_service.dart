import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';

class ApiService {
  final log = getLogger('ApiService');
  final client = RetryClient(http.Client());
  final _navigationService = locator<NavigationService>();

  final projectId = 'ft7xak3z';
  final dataset = 'production';

  //All GET calls both internally and externally goes through this method
  Future getData(
      {String? domain,
      String? subDomain,
      var failedResponseData,
      Map<String, dynamic>? queryParameter,
      Map<String, String>? header}) async {
    log.i('A GET call initiated');
    var url = Uri.https(
        '$projectId.api.sanity.io', '/v1/data/query/$dataset', queryParameter);
    log.v('Header: $header');
    log.v('Request URL: $url');

    var response = await client.get(url, headers: header);

    if (response.statusCode == 200) {
      log.i('GET call Successful!');
      String data = response.body;
      var decodedData = jsonDecode(data);
      log.v('Raw GET Response => $data');
      log.v('Decoded GET Response => $decodedData');
      return decodedData;
    } else {
      log.e('Request failed with status: ${response.statusCode}.');
      //TODO: Make sure you implement redirect to error 404 page
      if (failedResponseData) {
        _navigationService.popRepeated(1);
      }
    }
  }

  //All POST calls both internally and externally goes through this method
  Future postData(
      {required String domain,
      required String subDomain,
      required var body,
      required bool isJson,
      var failedResponseData,
      Map<String, String>? queryParameter,
      Map<String, String>? header}) async {
    log.i('A POST call initiated');
    var url = Uri.https(domain, subDomain, queryParameter);
    log.v('Header: $header');
    log.v('Request URL: $url');
    log.v('Payload: $body');
    var response = await client.post(url,
        headers: header, body: isJson ? jsonEncode(body) : body);
    log.v('Payload: $body');
    log.v('response: ${response.body}');

    if (response.statusCode == 200) {
      log.i('POST call Successful!');
      String data = response.body;
      var decodedData = jsonDecode(data);
      log.v('Raw POST Response => $data');
      log.v('Decoded POST Response => $decodedData');
      return decodedData;
    } else {
      log.e('Request failed with status: ${response.statusCode}.');
      //TODO: Make sure you implement redirect to error 404 page
      if (failedResponseData) {
        _navigationService.popRepeated(1);
      }
    }
  }
}
