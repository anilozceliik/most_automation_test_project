import 'package:flutter/material.dart';
import 'package:flutter_most_test_project/core/services/api_services.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_most_test_project/veri/veri.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  ApiServices _apiServices = ApiServices();

  var data;

  getTop10List() async {
    var data = await _apiServices.getProductListTop10();
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: context.height * 0.07, left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: context.width * 0.4,
                      ),
                    ],
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: context.width * 0.45,
                        height: 55,
                        padding: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _startDate,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_today),
                            border: InputBorder.none,
                            hintText: '2021-05-21',
                            labelText: 'Start Date',
                          ),
                        ),
                      ),
                      Container(
                        width: context.width * 0.45,
                        height: 55,
                        padding: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _endDate,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_today),
                            border: InputBorder.none,
                            hintText: '2021-05-21',
                            labelText: 'End Date',
                          ),
                        ),
                      ),
                    ],
                  ),
                  context.emptySizedHeightBoxLow3x,
                  InkWell(
                    onTap: () async {
                      var res = await _apiServices.getProductList(
                          _startDate.text, _endDate.text);

                      setState(() {
                        data = res;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: context.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  data != null
                      ? Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Search Results',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      context.emptySizedHeightBoxLow,
                      Container(
                        width: context.width,
                        height: 70,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Id:',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(data['Id'].toString(),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'FormulNo:',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(data['FormulNo'].toString(),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'FormulAd:',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(data['FormulAd'].toString(),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                      : SizedBox(),
                  context.emptySizedHeightBoxLow3x,
                  Row(
                    children: [
                      Text(
                        'Top 10',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  context.emptySizedHeightBoxLow,
                  veriListView()
                ],
              ),
            ),
          ),
        ),
    );
  }
}

