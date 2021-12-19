import 'dart:async';
import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class veri {
  final int? id;
  final int partiNo;
  final String tarihBaslama;
  final String tarihBitis;
  veri({this.id, required this.partiNo,required this.tarihBaslama, required this.tarihBitis});
  factory veri.fromJson(Map<String, dynamic>json){
    return veri(
      id:  json['id'],
      partiNo: json['partiNo'],
      tarihBaslama: json['tarihBaslama'],
      tarihBitis: json['tarihBitis'],
    );
  }
}
class veriListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<veri>>(
      future: _fetchveri(),
        builder:(context, snapshot){
        if (snapshot.hasData) {
          List<veri> data = snapshot.data!;
          return _veriListView(data);
        }  else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
        },
    );
  }
    Future<List<veri>> _fetchveri() async {
    final veriListAPIUrl ='http://185.33.234.201:8085/MostApi/top10/';
    final response = await http.get(Uri.parse(veriListAPIUrl));
    if(response.statusCode==200){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((Top10List) => new veri.fromJson(Top10List)).toList();
  }else {
      throw Exception('Failed to load jobs from API');
  }
}
ListView _veriListView(data){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index){
        return _tile(data[index].tarihBaslama, data[index].tarihBitis,Icons.calendar_today);
    }
    );
}
ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
  title: Text(title,
  style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
  )),
  subtitle: Text(subtitle),
  leading:  Icon(
    icon,
    color: Colors.blueAccent[500],
  ),
);
}