part of "backend_handler.dart";

/// Http handler which will add headers automatically.
class _HttpHandler {
  static Future<http.Response> get(String address, String api,
      {Map<String, String> args}) async {
    print("BackendHandler/HttpHandler: GET (Address: $address API: $api)");
    if (args == null)
      return await http.get(
        address + api,
        headers: {
          "Accept-Language": Platform.localeName.replaceAll("_", "-") +
              "," +
              Platform.localeName.substring(0, 2) +
              ";q=0.9",
        },
      );
    else {
      var uri = address + api + "?";
      args.forEach(
          (key, value) => uri += key + "=" + Uri.encodeComponent(value) + "&");
      uri = uri.substring(0, uri.length - 1);
      return await http.get(
        uri,
        headers: {
          "Accept-Language": Platform.localeName.replaceAll("_", "-") +
              "," +
              Platform.localeName.substring(0, 2) +
              ";q=0.9",
        },
      );
    }
  }

  static Future<http.Response> post(
      String address, String api, Map<String, String> body) async {
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
