import 'package:flutter/material.dart';
import 'package:mobile_consult/tools/api.dart';
import 'package:mobile_consult/models/user.dart';
import 'dart:convert';

class HomeTab extends StatelessWidget{
  
  @override  

  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
          begin: Alignment.topLeft, 
          end: Alignment.bottomRight

        )
      ),
    );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Consultórios"),
                centerTitle: true,
              ),
            ),           
          ],
        )        
      ],      
    );    
  }
  createState() => _MyListScreenState(); 
}

class _MyListScreenState extends State {
    var users = new List<User>();

    _getUsers() {
      API.getUsers().then((response) {
        setState(() {
          Iterable list = json.decode(response.body);
          users = list.map((model) => User.fromJson(model)).toList();
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
    return Scaffold(        
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name));
          },
        ));
  }
}
