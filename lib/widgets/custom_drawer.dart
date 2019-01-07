import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_consult/widgets/drawer_tile.dart';
import 'package:mobile_consult/screens/login_screen.dart';
import 'package:mobile_consult/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget{

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {    
     Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red[50], Colors.white],
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
                        child: ScopedModelDescendant<UserModel>(
                          builder:(context, child, model) {                            
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[                                  
                                  FutureBuilder(
                                    future: model.getUserName(), // a previously-obtained Future<String> or null
                                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {                                                                   
                                      if(snapshot.data != null){
                                         return Text("Olá, ${snapshot.data}!",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        );
                                      }else{
                                        return Text("Olá, Visitante!",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        );
                                      }                                     
                                    }
                                  ),
                                  FutureBuilder(
                                    future: model.isLoadingIn(), // a previously-obtained Future<String> or null
                                    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) { 
                                      print(snapshot);                                                                  
                                      if(snapshot.data != null){
                                         return  GestureDetector(
                                        child: Text(
                                            !snapshot.data ?
                                            "Entre ou cadastre-se >"
                                            : "Sair",
                                            style:TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold
                                            )
                                          ) ,
                                          onTap: (){                                        
                                            if(!snapshot.data){
                                              Navigator.of(context).push(
                                                MaterialPageRoute(builder: (contxte)=>LoginScreen())
                                              );
                                            }else{
                                              model.singOut();
                                            }
                                          
                                          },
                                        );
                                      }else{
                                        return Text("Olá, Visitante!",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        );
                                      }                                     
                                    }
                                  ),                                 
                                ],
                              );
                          }
                        ),
                      )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              DrawerTile(Icons.home, 'Inicio', pageController, 0),
              DrawerTile(Icons.list, 'Consultórios', pageController, 1),
              DrawerTile(Icons.playlist_add_check, 'Consultas', pageController, 2),
            ],
          )
        ],
      ),
    );

  }
}