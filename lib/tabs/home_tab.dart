
import 'package:flutter/material.dart';
import 'package:mobile_consult/screens/list_users.dart';

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
            //Add aqui o widget;
            SliverGrid(              
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 900.0,                
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,                    
                    child: ListUsers(),
                  );
                },
              childCount: 1,
              ),
            ), 
                                                
          ],
        ),
                    
      ],      
    );    
  }
   
}

