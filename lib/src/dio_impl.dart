import 'package:dio/dio.dart';
import 'package:forall_http_client/src/dio_helper.dart';
import 'package:forall_http_client/src/interceptor.dart';

class DioImpl extends DioHelper {
  final void Function(RequestOptions)? onRequestCallback;
  final void Function(Response)? onResponseCallback;
  final void Function(DioError)? onErrorCallback;
  final List<Interceptor> otherInterceptors;
  final BaseOptions? baseOptions;
  static BaseOptions? options;
  DioImpl({
    this.onRequestCallback,
    this.onResponseCallback,
    this.onErrorCallback,
    this.otherInterceptors = const [],
    this.baseOptions,
  }) {
    _dio.interceptors
      ..add(UserInterceptor(
        onRequestCallback: onRequestCallback,
        onResponseCallback: onResponseCallback,
        onErrorCallback: onErrorCallback,
      ))
      ..addAll(
        otherInterceptors,
      )
      ..add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));

    if (baseOptions != null) {
      options = baseOptions;
    }
  }

  final _dio = Dio(options ??
      BaseOptions(
        baseUrl: 'https://forall.4all.ltd/',
        contentType: 'application/json',
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        validateStatus: (status) {
          return status! < 500;
        },
      ));

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) {
    return _dio.get(
      path,
      queryParameters: params,
      options: options,
    );
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    data,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: params,
      options: options,
    );
  }

  @override
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    data,
  }) {
    return _dio.patch(
      path,
      data: data,
      queryParameters: params,
      options: options,
    );
  }

  @override
  Future<Response> put(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    data,
  }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: params,
      options: options,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    data,
  }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: params,
      options: options,
    );
  }
}
