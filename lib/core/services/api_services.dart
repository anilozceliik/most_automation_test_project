import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_most_test_project/core/models/data_response_model.dart';

class ApiServices {
  Dio _dio = Dio();

  Future getUserLoginIsSuccess(String username, String password) async {
    var res = await _dio.get(
        'http://185.33.234.201:8082/MostApi/Most/Login?userName=test&pass=123456');
    return res;
  }

  Future getProductList(String startDate, String endDate) async {
    List<DataResponseModel> data = [];
    var res = await _dio.get(
        'http://185.33.234.201:8082/MostApi/Most/GetByDate?strBasTarih=$startDate&strBitTarih=$endDate');

    res.data.forEach((element) {
      print(element);
      data.add(DataResponseModel.fromJson(element));
    });
    print(data.length);

    return data;
  }

  Future getProductListTop10() async {
    var res = await _dio.get('http://185.33.234.201:8085/MostApi/top10');
    return res.data[0];
  }
}
