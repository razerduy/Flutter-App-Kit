import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const Map<String, String> _headerDefault = {"Content-Type": "application/json"};

class WebService {

  static String _domain = "https://jsonplaceholder.typicode.com";

  Future<http.Response> get(String subURL,
    {Map<String, String> headers = _headerDefault}) async {
//    print('url $_domain$subURL');
    final headersAPI = {
      ..._headerDefault,
      ...headers,
    };
    print('header ${json.encode(headersAPI)}');
    print('url $_domain$subURL');
    return await http.get('$_domain$subURL', headers: headersAPI);
  }

  Future<http.Response> post(String subURL,
    {Map<String, String> headers = _headerDefault,
      dynamic data,
      Encoding encoding}) async {
    final headersAPI = {
      ..._headerDefault,
      ...headers,
    };
    print('header ${json.encode(headersAPI)}');
    print('body ${json.encode(data)}');
    print('url $_domain$subURL');
    return await http.post('$_domain$subURL',
      headers: headersAPI, body: json.encode(data));
  }

  Future<http.Response> uploadFile(
    String subURL, File file, Map<String, String> data, Function(int, int) listener) async {
    final listString = file.path.split('/');
    final fileName = listString[listString.length - 1];
    final name = fileName.split('.').length > 0 ? fileName.split('.')[0] : "random string";
    String endpoint = _domain + subURL + name;
    Uri uri = Uri.parse(endpoint);
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      uri
    );
    request.headers.addAll(Map.from({
      'Content-Type': 'multipart/form-data; boundary=----WebKitFormBoundaryuL67FWkv1CA',
    }));
    request.fields.addAll(data);
    request.files.add(
      await http.MultipartFile.fromPath(
        'data', file.path, filename: name
      )
    );
    StreamSubscription<http.StreamedResponse> subcriptionResponse;
    StreamSubscription<List<int>> streamChunk;
    int progress = 0;
    try {
      Future<http.StreamedResponse> futureResponse = request.send();
      http.StreamedResponse response = await futureResponse;
      http.Response res = await http.Response.fromStream(response);
      subcriptionResponse?.cancel();
      streamChunk?.cancel();
      return res;
    } catch(e) {
      throw (e);
    } finally {
      subcriptionResponse?.cancel();
      streamChunk?.cancel();
    }
  }
}