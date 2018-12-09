import "package:dropbox_sdk_dart/dropbox_sdk_dart.dart";
import "package:test/test.dart";

void main() {
	var dropbox = new Dropbox("secretToken", isMock: true);

  test("accessToken getter", () {
    expect(dropbox.accessToken, equals("secretToken"));
  });

	group("getCurrentAccount", () {
		test("returns 200 status code", () {
			dropbox.getCurrentAccount().then(expectAsync1((res) {
				expect(res["statusCode"], equals(200));
			}));
		});

		test("returns account_id", () {
			dropbox.getCurrentAccount().then(expectAsync1((res) {
				expect(res["body"]["account_id"], equals("dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"));
			}));
		});
	});
}
