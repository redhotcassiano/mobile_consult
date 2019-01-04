
import 'package:flutter/material.dart';
import 'package:mobile_consult/screens/list_users.dart';

class HomeTab extends StatelessWidget{

  @override  
  
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(200, 255, 17, 158), Color.fromARGB(1, 127, 108, 120)],
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
                title: const Text("Mobile Consult"),
                centerTitle: true,
              ),
            ),
                                         
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          margin: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
          color: Colors.transparent,
          child: ListUsers(),
        ),
           
      ], 
    );    
  }
   
}

