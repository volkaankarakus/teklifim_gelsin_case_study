import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:teklifim_gelsin_case_study/app/locator/locator.dart';
import 'package:teklifim_gelsin_case_study/model/offers_model.dart';
import 'package:teklifim_gelsin_case_study/service/network/network_dio_maker_service.dart';

enum NetworkCreateCardPostPathEnums { api, prep, createCardPost }

class CreateCardPostRequest {
  // Dependency Injection Service
  NetworkDioMakerService _dioService = locator<NetworkDioMakerService>();

  int connectionTimeOut = 20000;

  // final data = {
  //   "age": "2",
  //   "bill": "8",
  //   "dining": "5",
  //   "grocery": "1",
  //   "installment": "5",
  //   "mile": "2",
  //   "online_shopping": "3",
  //   "other": "13",
  //   "point": "3",
  //   "sale_cashback": "1",
  //   "travel": "2"
  // };

  Dio createDio() {
    return _dioService.networkDioMaker(
      connectionTimeOut: connectionTimeOut,
    );
  }

  // ** POST METHOD
  Future<Response> implementGivenAPIResponse({required Map<String, String> data}) async {
    Response response;
    Dio dio = createDio();
    try {
      response = await dio.post(
        '/${NetworkCreateCardPostPathEnums.api.name}/${NetworkCreateCardPostPathEnums.prep.name}/${NetworkCreateCardPostPathEnums.createCardPost.name}',
        data: data,
      );
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  Future<OffersModel?> fetchOffers({required Map<String, String> data}) async {
    Response response = await implementGivenAPIResponse(data: data);
    if (response.statusCode == HttpStatus.ok) {
      String body = jsonEncode(response.data);
      OffersModel offersModel = OffersModel.fromJson(body);
      return offersModel;
    }
    return null;
  }
}
