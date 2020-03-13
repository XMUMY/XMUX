import 'package:dio/dio.dart';

import 'authorization.dart';
import 'common.dart';
import 'models/v3_lost_and_found.dart';

class LostAndFoundApi {
  /// Client for sending HTTP requests.
  final Dio _dio;

  /// Contains user credentials.
  final Authorization _authorization;

  /// Will inherit [BaseOptions] and interceptors if [dio] specified.
  /// Else will create new client with address.
  LostAndFoundApi(this._authorization, {String address, Dio dio})
      : assert(address != null || dio != null),
        this._dio = Dio(
            dio?.options?.merge(baseUrl: dio.options.baseUrl + '/lost-found') ??
                BaseOptions(
                  baseUrl: '$address/v3/lost-found',
                  connectTimeout: 5000,
                  receiveTimeout: 10000,
                ))
          ..interceptors.addAll(dio.interceptors);

  Future<XmuxApiResponse<List<LostAndFoundBrief>>> getBriefs(
      {DateTime timestamp}) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/briefs',
      queryParameters: {
        if (timestamp != null) 'timestamp': timestampToJson(timestamp),
      },
    );
    return decodeList(resp, 'briefs', LostAndFoundBrief.fromJson);
  }

  Future<XmuxApiResponse<LostAndFoundDetail>> getDetail(String id) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/item',
      queryParameters: {
        'id': id,
      },
    );
    return decodeResponse(resp, LostAndFoundDetail.fromJson);
  }
}
