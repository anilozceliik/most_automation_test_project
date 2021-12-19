import 'package:flutter/material.dart';
import 'package:flutter_most_test_project/core/services/api_services.dart';
import 'package:flutter_most_test_project/screen/dashboard/home.dart';
import 'package:kartal/kartal.dart';



class tabbar extends StatefulWidget{
  const tabbar(Scaffold scaffold, {Key? key}) : super (key: key);
  _tabbarState createState() => _tabbarState();
}
class _tabbarState extends State<tabbar> with SingleTickerProviderStateMixin{
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
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2
      , child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        bottom: TabBar(
          indicatorColor: Colors.teal,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.amber
          ),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.calendar_today),
              child: Text(
                  'Between Dates'
              ),
            ),
            Tab(icon: Icon(Icons.list),
              child: Text(
                  'Top10 List'
              ),
            ),
          ],
        ),
        title: Text('Most Automation'),
      ),
      body: TabBarView(
        children: [
          Container(child: Icon(Icons.calendar_today),
            color: Colors.greenAccent,),
          Container(child: Icon(Icons.list),
            color: Colors.teal,),

        ],
      ),
    ),
    );

  }
}