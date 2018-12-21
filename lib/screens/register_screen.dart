import 'package:flutter/material.dart';
import 'package:mobile_consult/screens/home_screen.dart';
import 'package:mobile_consult/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  
  final _formKey = GlobalKey<FormState>();

  final _nameController     = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController    = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,        
      ),
      body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){         

            if(model.isLoading) return Center(child: CircularProgressIndicator());

            return  Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                      child: Text('Criar Conta', style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center),
                      onPressed: () {
                        if(_formKey.currentState.validate()){

                          Map<String, dynamic> userData = {
                            'name' : _nameController.text,
                            'email' : _emailController.text,
                            'password' : _passwordController.text,
                            'type_acl'  : 'CL',
                            'profiles_id' : 5
                          };

                          model.signUp(userData: userData, onSuccess: _onSuccess, onFailed: _onFailed);
                        }
                      },
                      padding: EdgeInsets.zero,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    )
                  ),
                ],
            ),
          );
        }
      )
    );
  }

  void _onSuccess () {

  }

  void _onFailed () {
    
  }


}