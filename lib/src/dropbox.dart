import "package:http/http.dart" as http;
import "dart:convert" show json;
import "constants.dart";
import "api_client.dart";
import "mock_api_client.dart";

class Dropbox {
  String _accessToken;
  bool _stubResponses;
  http.Client _client;

  Dropbox(String accessToken, {bool stubResponses: false}) {
    _accessToken = accessToken;
    _stubResponses = stubResponses;

    if (_stubResponses) {
      _client = new MockApiClient();
    } else {
      _client = new ApiClient(_accessToken);
    }
  }

  String get accessToken {
    return _accessToken;
  }

  Future<dynamic> getCurrentAccount() {
    return _client
      .post(_apiUrl(dropboxEndpoints["users"]["getCurrentAccount"]))
      .then((response) {
        return {
          "body": json.decode(response.body),
          "statusCode": response.statusCode
        };
      })
      .whenComplete(_client.close);
  }

  String _apiUrl(String endpoint) {
    return "$dropboxApiBaseUrl/$dropboxApiVersion/$endpoint";
  }
}
