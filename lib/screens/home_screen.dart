import 'package:flutter/material.dart';
import 'package:mobile_consult/tabs/home_tab.dart';
import 'package:mobile_consult/tabs/consultorios_tab.dart';
import 'package:mobile_consult/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget{
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Consultórios'),
            centerTitle: true,
          ),          
          drawer: CustomDrawer(_pageController),
          body: ConsultoriosTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Consultas'),
            centerTitle: true,
          ),          
          drawer: CustomDrawer(_pageController),
          body: Container(color: Colors.orange,),
        ),
      ],
    );
  }
}