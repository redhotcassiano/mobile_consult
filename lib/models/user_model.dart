import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class UserModel extends Model {
  
  bool isLoading = false;  

  Map<String, dynamic> userData = Map();

  void signUp ({ @required Map<String, dynamic> userData, @required VoidCallback onSuccess, @required VoidCallback onFailed}) async {
    isLoading = true;
    notifyListeners();   

    const baseUrlApi = "http://www.megaredhot.com:8080/api";
    
    final header =  {
      HttpHeaders.authorizationHeader: 'Bearer ' + "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImEzNGIxNTdhMDk5MWY2YzE4ZmExN2RkMzkyNTVmMzkxNTI5NmM1NDc5MDYyZTQwZGJkODgxNDFjODkyZTY5NWJjNThkYzgxMjcyMTM0OGZmIn0.eyJhdWQiOiI0IiwianRpIjoiYTM0YjE1N2EwOTkxZjZjMThmYTE3ZGQzOTI1NWYzOTE1Mjk2YzU0NzkwNjJlNDBkYmQ4ODE0MWM4OTJlNjk1YmM1OGRjODEyNzIxMzQ4ZmYiLCJpYXQiOjE1NDU4MzA1NDUsIm5iZiI6MTU0NTgzMDU0NSwiZXhwIjoxNTc3MzY2NTQ1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.toK8TIEEMMLoxuvQFptdVLAhJKLemIiEUdV3kuvfN2rN5ZzIeNZ7T2uJnVQoL09xAWQnNThkQctDeFxcO1dBqB1SIrY-9JFzv_iiVB77ViIvynf9v2KQytmDh6Ei9FKYVAc60JwMK_-7jYuryfJHfIVr8VX_ydpDq21XqJgZQO1KqQlqfOa3wUVROjRh3ATU3EzDG7Kxxa8a8Vz08P84K1qzntWTRUzjUGdGE62J2yUEUTq1yIZj8GqUFuVQd622ULqiA1qQZSwAxzJEsF836kxJtH9ZQp-NaJmgq1eT55o1czbCAdMg8wAqft6aKx0SLGERrEEwYGPSQ1s0Sy_xdS-ac31g1PpJGb8Py5awx_GCVlZHT6o5tubdNHJKH8SkZHWPeXFIOMNrwKc6G_wGX7f1SqpyUG4aymZf5uB9N7EPF4Erhj_aMdfqxRDOBjklwRI9eJX2bFPrqvLZxYut5foDg7hO8chazhaB3NqvQmx7XqFqhrcEauh7jtfZCfhTwv5IgOwujJcX4vEB_2AoEqUCIuH6XiEbbRlO-XVXvhWLBODdr_-XbQqWHs_sBZXe2AiJ9AMGZCRazCKNsw6__FGrWAO4bzk-zm1VzozGzDssBlQwY8GXlrll5Ql5uKJbfFGzGZzFK8WqtdEV3_VzAUAJ-lbbqF-ih0xdlbJqy-E", 
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader : 'application/x-www-form-urlencoded'
    };

    final data =  await authApp();  

    final Map<String, dynamic> authData = data; 

    print('---------------- LOGADO ---------------------');
    print(authData['access_token']);
    print('---------------- Data --------------');
    print(userData);   

    print('---------------- user --------------------');
    print(userData['name']);   

    await http.post(baseUrlApi + "/users", body: {
      'name' : userData['name'],
      'email' : userData['email'],
      'password' : userData['password'],
      'type_acl'  : 'CL',
      'profiles_id' : '5'
    }, headers: header).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.body);
      print(response.request);

      if(response.statusCode == 200) {  
        _saveUserData(userData: userData, apiToken: authData['access_token']);      
        isLoading = false;
        notifyListeners();
        onSuccess();
      }else{
        isLoading = false;
        notifyListeners();
        onFailed(); 
      }      

    });     
    
  }

  void signIn () async {   

    await Future.delayed(Duration(seconds: 3));    
    
  }

  void recoverPass () {}

  bool isLoggedIn () {
    
    var isTrue = _isLoggadStore();

    if (isTrue != null) {
      return true;
    }else{
      return false;
    }

  }

  _isLoggadStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString('user_name');
    String validade;
    if(name != null) {
      validade= 'isLogadded'; 
    }else{
      validade = null;
    }

    return validade;
  }

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

  saveUser ({ @required Map<String, dynamic> userData, @required String apiKey}) async {
    const baseUrlApi = "http://www.megaredhot.com:8080/api";
    
    final header =  {
      HttpHeaders.authorizationHeader: 'Bearer ' + "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImEzNGIxNTdhMDk5MWY2YzE4ZmExN2RkMzkyNTVmMzkxNTI5NmM1NDc5MDYyZTQwZGJkODgxNDFjODkyZTY5NWJjNThkYzgxMjcyMTM0OGZmIn0.eyJhdWQiOiI0IiwianRpIjoiYTM0YjE1N2EwOTkxZjZjMThmYTE3ZGQzOTI1NWYzOTE1Mjk2YzU0NzkwNjJlNDBkYmQ4ODE0MWM4OTJlNjk1YmM1OGRjODEyNzIxMzQ4ZmYiLCJpYXQiOjE1NDU4MzA1NDUsIm5iZiI6MTU0NTgzMDU0NSwiZXhwIjoxNTc3MzY2NTQ1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.toK8TIEEMMLoxuvQFptdVLAhJKLemIiEUdV3kuvfN2rN5ZzIeNZ7T2uJnVQoL09xAWQnNThkQctDeFxcO1dBqB1SIrY-9JFzv_iiVB77ViIvynf9v2KQytmDh6Ei9FKYVAc60JwMK_-7jYuryfJHfIVr8VX_ydpDq21XqJgZQO1KqQlqfOa3wUVROjRh3ATU3EzDG7Kxxa8a8Vz08P84K1qzntWTRUzjUGdGE62J2yUEUTq1yIZj8GqUFuVQd622ULqiA1qQZSwAxzJEsF836kxJtH9ZQp-NaJmgq1eT55o1czbCAdMg8wAqft6aKx0SLGERrEEwYGPSQ1s0Sy_xdS-ac31g1PpJGb8Py5awx_GCVlZHT6o5tubdNHJKH8SkZHWPeXFIOMNrwKc6G_wGX7f1SqpyUG4aymZf5uB9N7EPF4Erhj_aMdfqxRDOBjklwRI9eJX2bFPrqvLZxYut5foDg7hO8chazhaB3NqvQmx7XqFqhrcEauh7jtfZCfhTwv5IgOwujJcX4vEB_2AoEqUCIuH6XiEbbRlO-XVXvhWLBODdr_-XbQqWHs_sBZXe2AiJ9AMGZCRazCKNsw6__FGrWAO4bzk-zm1VzozGzDssBlQwY8GXlrll5Ql5uKJbfFGzGZzFK8WqtdEV3_VzAUAJ-lbbqF-ih0xdlbJqy-E", 
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader : 'application/x-www-form-urlencoded'
    };

    print('---------------- user --------------------');
    print(userData['name']);
    var result = {};

    await http.post(baseUrlApi + "/users", body: {
      'name' : userData['name'],
      'email' : userData['email'],
      'password' : userData['password'],
      'type_acl'  : 'CL',
      'profiles_id' : '5'
    }, headers: header).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.body);
      print(response.request);

      if(response.statusCode == 200) {
        result = {'data': response.body};
      }else{
        result = {
          'error' : true,
          'info'  : response.body          
        };
      }
    });    

    return result;
  }  

  Future<Null> _saveUserData ({@required Map<String, dynamic> userData, @required String apiToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = userData['name'];
    String email = userData['email'];

    if (prefs.getString('user_name') == null){
      prefs.setString('user_name', name);
    }

    if (prefs.getString('user_email') == null){
      prefs.setString('user_email', email);
    }

    if (prefs.getString('apiKey') == null){
      prefs.setString('apiKey', apiToken.toString());
    }

    print('--------- salvo Memoria ------------');
    print(prefs.getString('user_name'));
  }

}