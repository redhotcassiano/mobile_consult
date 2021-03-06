import 'package:flutter/material.dart';
import 'package:mobile_consult/tabs/home_tab.dart';
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
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}