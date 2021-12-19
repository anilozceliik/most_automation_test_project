import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices {
  Dio _dio = Dio();

  Future getUserLoginIsSuccess(String username, String password) async {
    var res = await _dio.get(
        'http://185.33.234.201:8082/MostApi/Most/Login?userName=test&pass=123456');
    return res;
  }

  Future getProductList(String startDate, String endDate) async {
    var res = await _dio.get(
        'http://185.33.234.201:8082/MostApi/Most/GetByDate?strBasTarih=$startDate&strBitTarih=$endDate');

    return res.data[0];
  }

  Future getProductListTop10() async {
    var res = await _dio.get('http://185.33.234.201:8085/MostApi/top10');
    return res.data[0];
  }
}
