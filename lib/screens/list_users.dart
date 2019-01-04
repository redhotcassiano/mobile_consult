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
      const apiKey = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImEzNGIxNTdhMDk5MWY2YzE4ZmExN2RkMzkyNTVmMzkxNTI5NmM1NDc5MDYyZTQwZGJkODgxNDFjODkyZTY5NWJjNThkYzgxMjcyMTM0OGZmIn0.eyJhdWQiOiI0IiwianRpIjoiYTM0YjE1N2EwOTkxZjZjMThmYTE3ZGQzOTI1NWYzOTE1Mjk2YzU0NzkwNjJlNDBkYmQ4ODE0MWM4OTJlNjk1YmM1OGRjODEyNzIxMzQ4ZmYiLCJpYXQiOjE1NDU4MzA1NDUsIm5iZiI6MTU0NTgzMDU0NSwiZXhwIjoxNTc3MzY2NTQ1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.toK8TIEEMMLoxuvQFptdVLAhJKLemIiEUdV3kuvfN2rN5ZzIeNZ7T2uJnVQoL09xAWQnNThkQctDeFxcO1dBqB1SIrY-9JFzv_iiVB77ViIvynf9v2KQytmDh6Ei9FKYVAc60JwMK_-7jYuryfJHfIVr8VX_ydpDq21XqJgZQO1KqQlqfOa3wUVROjRh3ATU3EzDG7Kxxa8a8Vz08P84K1qzntWTRUzjUGdGE62J2yUEUTq1yIZj8GqUFuVQd622ULqiA1qQZSwAxzJEsF836kxJtH9ZQp-NaJmgq1eT55o1czbCAdMg8wAqft6aKx0SLGERrEEwYGPSQ1s0Sy_xdS-ac31g1PpJGb8Py5awx_GCVlZHT6o5tubdNHJKH8SkZHWPeXFIOMNrwKc6G_wGX7f1SqpyUG4aymZf5uB9N7EPF4Erhj_aMdfqxRDOBjklwRI9eJX2bFPrqvLZxYut5foDg7hO8chazhaB3NqvQmx7XqFqhrcEauh7jtfZCfhTwv5IgOwujJcX4vEB_2AoEqUCIuH6XiEbbRlO-XVXvhWLBODdr_-XbQqWHs_sBZXe2AiJ9AMGZCRazCKNsw6__FGrWAO4bzk-zm1VzozGzDssBlQwY8GXlrll5Ql5uKJbfFGzGZzFK8WqtdEV3_VzAUAJ-lbbqF-ih0xdlbJqy-E';
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