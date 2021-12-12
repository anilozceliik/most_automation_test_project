import 'package:dio/dio.dart';

class ApiServices {
  Dio _dio = Dio();

  Future getUserLoginIsSuccess(String username, String password) async {
    var res = await _dio.get(
        'http://185.33.234.201:8085/MostApi/Login?userName=$username&pass=$password');
    return res;
  }

  Future getProductList(String startDate, String endDate) async {
    var res = await _dio.get(
        'http://185.33.234.201:8085/MostApi/GetByDate?strBasTarih=$startDate&strBitTarih=$endDate');

    return res.data[0];
  }

  Future getProductListTop10() async {
    var res = await _dio.get('http://185.33.234.201:8085/MostApi/top10');
    return res.data[0];
  }
}
