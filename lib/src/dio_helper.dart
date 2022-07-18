import 'package:dio/dio.dart';

abstract class DioHelper {
  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  });

  Future<Response> patch(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    dynamic data,
  });

  Future<Response> post(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    dynamic data,
  });

  Future<Response> put(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    dynamic data,
  });

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    dynamic data,
  });
}
