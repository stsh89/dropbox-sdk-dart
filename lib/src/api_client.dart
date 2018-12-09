import "package:http/http.dart" as http;
import "bearer_authentication_client.dart";

class ApiClient extends BearerAuthenticationClient {
  ApiClient(dropboxToken) : super(dropboxToken, new http.Client());
}
