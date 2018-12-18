import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_consult/tools/api.dart';
import 'package:mobile_consult/models/user.dart';


class MyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   var users = new List<User>();

    API.getUsers().then((response) { 
      var list = json.decode(response.body);
      users = list.map((model) => User.fromJson(model)).toList();
    });

    return Stack(
      children: <Widget>[
          ListView.builder(            
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name));
          },
        )
      ]
    );
  }
  
}

/*class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        debugPrint(users.toString());
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name));
          },
        )
      ]
    );
  }     
  
}*/
