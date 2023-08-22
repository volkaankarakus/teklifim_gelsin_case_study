import 'package:teklifim_gelsin_case_study/model/network_dio_status_model.dart';
// https://jsonplaceholder.typicode.com/users
// String baseUrl = 'https://jsonplaceholder.typicode.com';

abstract class INetworkManager<T> {
  INetworkManager<T> addBaseUrl(String baseUrl);
  INetworkManager<T> addStatusModel(NetworkDioStatusModel? statusModel);
  INetworkManager<T> addBaseHeader(MapEntry<String, String> value);
  INetworkManager<T> addConnectionTimeout(int timeOut);
  INetworkManager<T> addLoggerRequest();

  T build();
}
