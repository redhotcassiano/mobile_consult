import 'package:flutter/material.dart';
import 'package:mobile_consult/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text('voltar', style: TextStyle(fontSize: 15.0)),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contxte)=>HomeScreen())
              );
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nome'
              ),
              keyboardType: TextInputType.text,
              validator: (text){
                if(text.isEmpty || text.length < 3) return 'Nome Invalido';
              },
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-mail'
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty || !text.contains('@')) return 'E-mail Invalido';
              },
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Senha'
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (pass){
                if(pass.isEmpty || pass.length < 6) return 'Senha Invalida';
              },
            ),            
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text('Salvar', style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center),
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (contxte)=>HomeScreen())
                    );
                  }
                },
                padding: EdgeInsets.zero,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              )
            ),
          ],
        ),
      )
    );
  }
}