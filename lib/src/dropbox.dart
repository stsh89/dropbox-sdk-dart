import "dart:convert" show json;
import 'constants.dart';
import "api_client.dart";
import "mock_api_client.dart";

class Dropbox {
	String _accessToken;
	bool _isMock;

	Dropbox(String accessToken, {bool isMock: false}) {
		_accessToken = accessToken;
		_isMock = isMock;
	}

	String get accessToken {
		return _accessToken;
	}

	Future<dynamic> getCurrentAccount() {
		var client;

		if (_isMock) {
			client = new MockApiClient();
		} else {
			client = new ApiClient(_accessToken);
		}

		return client
			.post(_apiUrl(dropboxEndpoints["users"]["getCurrentAccount"]))
			.then((response) {
				return {
					"body": json.decode(response.body),
					"statusCode": response.statusCode
				};
			})
			.whenComplete(client.close);
	}

	String _apiUrl(String endpoint) {
		return "$dropboxApiBaseUrl/$dropboxApiVersion/$endpoint";
	}
}
