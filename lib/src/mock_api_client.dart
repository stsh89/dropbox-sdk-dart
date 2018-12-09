import "dart:io";
import "package:http/http.dart" as http;
import "package:http/testing.dart" as httpTest;

class MockApiClient extends httpTest.MockClient {
  static Future<http.Response> _handler(http.Request request) async {
    String payload;

    switch (request.url.path) {
      case "/2/users/get_current_account":
        payload = await new File("test/files/users/get_current_account.json").readAsString();
        break;
      default:
        throw "Unimplemented path $request.url.path";
    }

    return http.Response(payload, 200);
  }

  MockApiClient() : super(_handler);
}
