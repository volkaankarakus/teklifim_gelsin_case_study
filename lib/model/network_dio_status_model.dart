class NetworkDioStatusModel {
  final int minValue;
  final int maxValue;
  NetworkDioStatusModel({required this.minValue, required this.maxValue})
      : assert(maxValue > minValue);
}