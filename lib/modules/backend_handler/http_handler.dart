part of "backend_handler.dart";

/// Http handler which will add headers automatically.
class HttpHandler {
  static Future<http.Response> get(String address, String api) async {
    print("BackendHandler/HttpHandler: GET (Address: $address API: $api)");
    return await http.get(
      address + api,
      headers: {
        "Accept-Language": Platform.localeName.replaceAll("_", "-") +
            "," +
            Platform.localeName.substring(0, 2) +
            ";q=0.9",
      },
    );
  }

  static Future<http.Response> post(
      String address, String api, Map body) async {
    print("BackendHandler/HttpHandler: POST (Address: $address API: $api)");
    return await http.post(
      address + api,
      headers: {
        "Accept-Language": Platform.localeName.replaceAll("_", "-") +
            "," +
            Platform.localeName.substring(0, 2) +
            ";q=0.9",
      },
      body: body,
    );
  }
}
