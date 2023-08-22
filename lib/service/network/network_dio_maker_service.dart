import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:teklifim_gelsin_case_study/constant/base_url_constant.dart';
import 'package:teklifim_gelsin_case_study/model/network_dio_status_model.dart';
import 'package:teklifim_gelsin_case_study/service/network/network_dio_manager.dart';

@lazySingleton
class NetworkDioMakerService {
  @protected
  Dio networkManager = Dio();

  Dio networkDioMaker({required connectionTimeOut}) {
    networkManager = NetworkDioManager()
        .addBaseUrl(BaseUrlConstant.instance.baseUrl)
        //.addLoggerRequest()
        .addConnectionTimeout(connectionTimeOut)
        .addStatusModel(NetworkDioStatusModel(
            minValue: HttpStatus.ok, maxValue: HttpStatus.found))
        .build();

    return networkManager;
  }
}
