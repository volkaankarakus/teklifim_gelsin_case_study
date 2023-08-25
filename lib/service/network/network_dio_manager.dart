import 'package:dio/dio.dart';
import 'package:flutter_cache_manager_dio/flutter_cache_manager_dio.dart';
import 'package:logger/logger.dart';
import 'package:teklifim_gelsin_case_study/model/network_dio_status_model.dart';
import 'package:teklifim_gelsin_case_study/service/network/inetwork_manager.dart';

class NetworkDioManager implements INetworkManager<Dio> {
  String? _baseUrl;
  NetworkDioStatusModel? _statusModel;
  MapEntry<String, String>? _baseHeaders;
  int? _connectionTimeOutMilliSeconds;
  InterceptorsWrapper? _wrapper;

  Dio? _dio;

  @override
  INetworkManager<Dio> addBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  @override
  INetworkManager<Dio> addStatusModel(NetworkDioStatusModel? statusModel) {
    _statusModel = statusModel;
    return this;
  }

  @override
  INetworkManager<Dio> addBaseHeader(MapEntry<String, String> value) {
    _baseHeaders = value;
    return this;
  }

  @override
  INetworkManager<Dio> addConnectionTimeout(int timeOut) {
    _connectionTimeOutMilliSeconds = timeOut;
    return this;
  }

  @override
  INetworkManager<Dio> addLoggerRequest() {
    _wrapper = InterceptorsWrapper(
      onRequest: (options, handler) {
        Logger().i(options.data); // Log the data.
        handler.next(options);
      },
    );
    return this;
  }

  @override
  Dio build() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl ?? '',
      headers: Map.fromEntries([_baseHeaders ?? const MapEntry('', '')]),
      connectTimeout:
          Duration(milliseconds: _connectionTimeOutMilliSeconds ?? 0),
      validateStatus: (status) {
        if (status != null && _statusModel != null) {
          if (status >= _statusModel!.minValue &&
              status <= _statusModel!.maxValue) {
            return true;
          }
        }
        return false;
      },
    ));

    if (_wrapper != null) {
      _dio?.interceptors.add(_wrapper!);
    }

    return _dio!; // it can be forced, it already created in the previous step.
  }
}
