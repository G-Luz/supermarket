import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/repositories/local_storage/local_storage_controller.dart';
import 'package:supermarket_app/app/utils/mappers.dart';

part 'app_client_repository.g.dart';

class AppClientRepository = AppClientRepositoryBase with _$AppClientRepository;

abstract class AppClientRepositoryBase with Store {
  final localStorage = Modular.get<LocalStorageController>();

  final dio = Dio();

  AppClientRepositoryBase() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          final accessToken =
              await localStorage.getValueByKey(localStorage.webTokenKey);
          if (accessToken != null) {
            options.headers["Authorization"] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Future<T?> get<T>({
    required String endpoint,
    required JsonMapper<T> jsonMapper,
    Map<String, dynamic>? queryParameters,
  }) async {
    print('Endpoint: $endpoint');
    print('Query Mapper: $queryParameters');
    final response = await dio.get<Map<String, dynamic>>(
      '${ApiEndpoints.baseURL}$endpoint',
      queryParameters: queryParameters,
    );

    print('API response: $response');
    if (response.data != null) {
      return jsonMapper(response.data!);
    }
    return null;
  }

  Future<T?> getLists<T>({
    required String endpoint,
    required ListMapper<T> listMapper,
    Map<String, dynamic>? queryParameters,
  }) async {
    print('Endpoint: $endpoint');
    print('Query Mapper: $queryParameters');
    final response = await dio.get<List<dynamic>>(
      '${ApiEndpoints.baseURL}$endpoint',
      queryParameters: queryParameters,
    );
    if (response.data != null) {
      return listMapper(response.data!);
    }
    return null;
  }

  Future<Response<T>?> post<T>({
    required String endpoint,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response = await dio.post<T>('${ApiEndpoints.baseURL}$endpoint',
          data: bodyMapper,
          queryParameters: queryMapper,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      return response;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }

  Future<T?> mappedPost<T>({
    required String endpoint,
    required JsonMapper<T> jsonMapper,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response = await dio.post<Map<String, dynamic>>(
          '${ApiEndpoints.baseURL}$endpoint',
          data: bodyMapper,
          queryParameters: queryMapper,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));

      if (response.data != null) {
        return jsonMapper(response.data!);
      }
      return null;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }

  Future<Response<T>?> put<T>({
    required String endpoint,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response = await dio.put<T>('${ApiEndpoints.baseURL}$endpoint',
          data: bodyMapper,
          queryParameters: queryMapper,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      return response;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }

  Future<Response<T>?> delete<T>({
    required String endpoint,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response = await dio.delete<T>(
        '${ApiEndpoints.baseURL}$endpoint',
        data: bodyMapper,
        queryParameters: queryMapper,
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
      return response;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }
}
