import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class veri {
  final int? id;
  final int partiNo;
  final String tarihBaslama;
  final String tarihBitis;
  veri(
      {this.id,
      required this.partiNo,
      required this.tarihBaslama,
      required this.tarihBitis});
  factory veri.fromJson(Map<String, dynamic> json) {
    return veri(
      id: json['id'],
      partiNo: json['partiNo'],
      tarihBaslama: json['tarihBaslama'],
      tarihBitis: json['tarihBitis'],
    );
  }
}

class veriListView extends StatelessWidget {
  var hSep = SizedBox(
    width: 10,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<veri>>(
      future: _fetchveri(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<veri> data = snapshot.data!;
          return _veriListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<List<veri>> _fetchveri() async {
    final veriListAPIUrl = 'http://185.33.234.201:8085/MostApi/top10/';
    final response = await http.get(Uri.parse(veriListAPIUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((Top10List) => new veri.fromJson(Top10List))
          .toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Padding _veriListView(data) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
        top: 12,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _tile(
                  data[index].id.toString(),
                  data[index].partiNo.toString(),
                  data[index].tarihBaslama.toString(),
                  data[index].tarihBitis.toString(),
                  Icons.calendar_today),
            );
          }),
    );
  }

  Card _tile(
          String id, String partiNo, String start, String end, IconData icon) =>
      Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )),
              Text('PartiNo ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )),
              Text('Start Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )),
              Text('End Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id),
              Text(partiNo),
              Text(start.split('T')[0]),
              Text(end.split('T')[0]),
            ],
          ),
          leading: Icon(
            icon,
            color: Colors.blueAccent[500],
          ),
        ),
      );
}
