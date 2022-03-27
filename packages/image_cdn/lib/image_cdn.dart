import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

const _imgtuUrl = 'https://imgtu.com';
const _headers = {
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36',
  'referer': 'https://imgtu.com/',
};

class Imgtu {
  final _dio = Dio(
    BaseOptions(
      baseUrl: _imgtuUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ),
  )..interceptors.add(CookieManager(CookieJar()));

  var _token = '';

  Future<void> getToken() async {
    final resp = await _dio.get(
      '/',
      options: Options(headers: _headers),
    );
    _token = RegExp('PF.obj.config.auth_token = "(.*?)"')
            .firstMatch(resp.data)
            ?.group(1) ??
        '';
  }

  Future<String?> uploadImage(String path) async {
    final form = FormData.fromMap({
      'type': 'file',
      'action': 'upload',
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
      'auth_token': _token,
      'nsfw': '0',
      'source': await MultipartFile.fromFile(path),
    });

    final resp = await _dio.post(
      '/json',
      data: form,
      options: Options(headers: _headers),
    );

    return resp.data?['image']?['url'];
  }
}
