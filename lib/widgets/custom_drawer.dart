import 'package:flutter/material.dart';
import 'package:mobile_consult/widgets/drawer_tile.dart';

class CustomDrawer extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
     Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.white],
          begin: Alignment.topCenter, 
          end: Alignment.bottomCenter

        )
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 0.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 8.0),
                height: 130.0,
                child: Stack(
                  children: <Widget>[
                      Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text("Menu", 
                          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                      ),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Olá User!",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                  "Entre ou Cadastre-se >",
                                  style:TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                  )
                                ) ,
                                onTap: (){

                                },
                              )
                          ],
                        ),
                      )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              DrawerTile(Icons.home, 'Inicio'),
              DrawerTile(Icons.list, 'Consultórios'),
              DrawerTile(Icons.playlist_add_check, 'Consultas'),
            ],
          )
        ],
      ),
    );

  }
}