import '../../../../index.dart';

class ApiInterceptor extends Interceptor {
  final String? secretKey;
  final String? accessToken;

  ApiInterceptor({this.secretKey, this.accessToken}) : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      // TODO: Add headers here
    });
    return handler.next(options);
  }
}
