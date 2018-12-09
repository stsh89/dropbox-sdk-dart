import "package:http/http.dart" as http;

class BearerAuthenticationClient extends http.BaseClient {
	final String _bearerToken;
	final http.Client _inner;

	BearerAuthenticationClient(this._bearerToken, this._inner);

	Future<http.StreamedResponse> send(http.BaseRequest request) {
		request.headers['Authorization'] = "Bearer $_bearerToken";
		return _inner.send(request);
	}
}
