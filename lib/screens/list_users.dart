import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<ListUsers> {
 
  Future<List> getData() async {
      const baseUrl = "http://www.megaredhot.com:8080/api";
      const apiKey = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU2ZjBmZmUwYzYwYzk4ZWUwMjUyZWNhMGY3ZDcwNWJiMjE1OTM0YjEyMjY4ODVkNGEyMzc4YjkyYmQ3Y2U3NWVhNDRiMzIxNjQwYjZhZjQzIn0.eyJhdWQiOiIxIiwianRpIjoiZTZmMGZmZTBjNjBjOThlZTAyNTJlY2EwZjdkNzA1YmIyMTU5MzRiMTIyNjg4NWQ0YTIzNzhiOTJiZDdjZTc1ZWE0NGIzMjE2NDBiNmFmNDMiLCJpYXQiOjE1NDUxMzg0NDIsIm5iZiI6MTU0NTEzODQ0MiwiZXhwIjoxNTc2Njc0NDQyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.j1VmTiyN72TX2ak4WH14ThWS8X85cmFj6aT8nO53XRArOD-q8-ZpBM24P4Duw3pZCU0BYGzGgMXkHlFcKgNfHjteWtrV5QuunRbcV-051C1UXIIGQj9ECcyPvIVu_dLXX8FLdXrA4VKukTABBMtjy5Ci17hyJZb0meJC_bH3hP53YY5qN3aL53MgGi31eJcP_SITmBQq0Hw9yP2Hie2NL265xLWMbZvbKvE7SV21RIlyVCvli341vl-TRn6tLv1NKfp40hWWQ8trcpRW9AWy4zU82F9_Ksc2aslX_Vnfzvsx-_NW6CCTuhZwJA8cnJ-EEIbleBbOjk8BeZHNzQkbMcYP-JgmWeRvkb4AxDaAijMuCxqcl2yErX3G70jqdqZhjQsrLOQgkpTZdXMeqr_GhYITvAaU4Ey5U9J5h9aGPaewSRjIf09zBhbjEhJ183fxei_wbpqP7hCstKEkd8fIvJ3Vka86LvsjcWeytKUHv2DX16MsHfCqJKEiWUPIVthtrNdgkakWLSv4Ec8RQWN9nP38T9ZCe9a9wt3A3dH6y4is4nqW3PnwPA4fzdIhcXb7S-jtvJJrTZs2-UgVd3WDYOM34tNWmQjtpt2AJy0zZ-vJIkjTmGmlpF8wQnEPihCW7cK9hgVijDE3YLTJzhZezGN_31F2UGgcT9C6Q8CnGVE';
      const header =  {
        HttpHeaders.authorizationHeader: apiKey , 
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader : 'application/x-www-form-urlencoded'
      };

      final response = await http.get(baseUrl + "/users", headers: header);
      return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(      
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>{

            },
            child: new Card(

              child: new ListTile(
                title: new Text(list[i]['name']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Email : ${list[i]['email']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}