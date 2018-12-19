import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget{
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text('Criar Conta', style: TextStyle(fontSize: 15.0)),
            color: Colors.white,
            onPressed: () {},
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
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text('Esqueci a Minha Senha', textAlign: TextAlign.right),
                onPressed: () {},
                padding: EdgeInsets.zero,
              )            
            ),
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text('Entrar', style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center),
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    
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