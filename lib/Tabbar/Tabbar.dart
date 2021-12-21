import 'package:flutter/material.dart';
import 'package:flutter_most_test_project/core/models/data_response_model.dart';
import 'package:flutter_most_test_project/core/services/api_services.dart';
import 'package:flutter_most_test_project/screen/dashboard/home.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_most_test_project/veri/veri.dart';

class tabbar extends StatefulWidget {
  const tabbar(Scaffold scaffold, {Key? key}) : super(key: key);
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> with SingleTickerProviderStateMixin {
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  ApiServices _apiServices = ApiServices();

  List<DataResponseModel>? data;
  bool isLoading = false;

  getTop10List() async {
    var data = await _apiServices.getProductListTop10();
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          bottom: TabBar(
            indicatorColor: Colors.teal,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.amber),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.calendar_today),
                child: Text('Between Dates'),
              ),
              Tab(
                icon: Icon(Icons.list),
                child: Text('Top10 List'),
              ),
            ],
          ),
          title: Text('Most Automation Project'),
        ),
        body: TabBarView(children: [
          Container(
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
                        setState(() {
                          isLoading = true;
                        });
                        var res = await _apiServices.getProductList(
                            _startDate.text, _endDate.text);

                        setState(() {
                          isLoading = false;
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
                    !isLoading
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
                              data != null
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: data!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Container(
                                            width: context.width,
                                            height: 70,
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 20,
                                                  color: Colors.grey
                                                      .withOpacity(0.7),
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Id:',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                        data![index]
                                                            .id!
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black)),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'FormulNo:',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                        data![index]
                                                            .formulNo
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black)),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'FormulAd:',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                        data![index]
                                                            .formulAd
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : SizedBox(),
                            ],
                          )
                        : CircularProgressIndicator(),
                    context.emptySizedHeightBoxLow3x,
                  ],
                ),
              ),
            ),
          ),
          veriListView()
        ]),
      ),
    );
  }
}
