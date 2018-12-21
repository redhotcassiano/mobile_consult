import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class UserModel extends Model {
  
  bool isLoading = false;  

  Map<String, dynamic> userData = Map();

  void signUp ({ @required Map<String, dynamic> userData, @required VoidCallback onSuccess, @required VoidCallback onFailed}) async {
    isLoading = true;
    notifyListeners();

    final authData =  await authApp();

    if(!authData.error){
      onSuccess();      
    }else{
      onFailed();
    }


    print('---------------- LOGADO ---------------------');
    print(authData);

    isLoading = false;
    notifyListeners();
    
  }

  void signIn () async {
    

    await Future.delayed(Duration(seconds: 3));

    
    
  }

  void recoverPass () {}

  void isLoggedIn () {}

  loginIn (Map<String, dynamic> userData, String pass) async {
    
    const baseUrl = "http://www.megaredhot.com:8080/";
    const baseUrlApi = "http://www.megaredhot.com:8080/api";
    const client_id = '5';
    const client_secret = 'Eydmlllzi51LEXIEkdU95cnRyl7COcJS3nWesDiI';
    const user = 'admin@email.com';
    const pass = '123456';     

    final response = await http.post(baseUrl + "/oauth/token", body: {
      'grant_type'    : 'password',
      'client_id'     : client_id,
      'client_secret' : client_secret,
      'username'      : user,
      'password'      : pass,
      'scope'         : '*'
    });
    
    return json.decode(response.body);    
  }

  authApp () async {    
    const baseUrl = "http://www.megaredhot.com:8080/";
    const client_id = '4';
    const client_secret = '2NPIwvhsOG8IMU2F5ZAaIzPQ1fRCcI7wl2YgRkDc';

    final response = await http.post(baseUrl + "/oauth/token", body: {
      'grant_type'    : 'client_credentials',
      'client_id'     : client_id,
      'client_secret' : client_secret,
      'scope'         : '*'
    });
    
    return json.decode(response.body);
  }

  saveUser (Map<String, dynamic> userData, String pass) async {
    const baseUrlApi = "http://www.megaredhot.com:8080/api";
    final body = userData;
    final header = {};

    final response = await http.post(baseUrlApi + "/oauth/token", body: body, headers: header);

    return json.decode(response.body);
  }

}