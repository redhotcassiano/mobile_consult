import 'package:flutter/material.dart';
import 'package:mobile_consult/screens/list_consultorios.dart';


class ConsultoriosTab extends StatelessWidget{

  @override  
  
  Widget build(BuildContext context) { 
    return Stack(
      children: <Widget>[
        ListConsultorios()
      ]);
  }
}