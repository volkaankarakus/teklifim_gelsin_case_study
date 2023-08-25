import 'package:teklifim_gelsin_case_study/model/network_dio_status_model.dart';

abstract class INetworkManager<T> {
  INetworkManager<T> addBaseUrl(String baseUrl);
  INetworkManager<T> addStatusModel(NetworkDioStatusModel? statusModel);
  INetworkManager<T> addBaseHeader(MapEntry<String, String> value);
  INetworkManager<T> addConnectionTimeout(int timeOut);
  INetworkManager<T> addLoggerRequest();

  T build();
}
