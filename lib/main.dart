import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:active_kidney/components/Navigation.dart';
import 'package:active_kidney/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CheckLogin());
  }
}

class CheckLogin extends StatefulWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  late SharedPreferences prefs;
  bool isLogin = false;
  bool isloading = false;
  var token_var;
  var res_var;
  var error_var;

  @override
  Future getProfile() async {
    //Shared Preferences
    prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getString('token') == null) {
        isloading = false;
      } else {
        isloading = true;
        token_var = prefs.getString('token');
      }
    });
    try {
      final response = await http.post(
          Uri.parse("https://news.chatvait.com/api/v1/login/isLoggedIn"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "token": token_var,
          }));

      setState(() {
        res_var = json.decode(response.body);
      });

      if (response.statusCode == 200) {
        setState(() {
          isloading = false;
          setState(() {
            res_var = json.decode(response.body);
            print(res_var);
          });
        });
      } else {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(res_var['message'].toString()),
              duration: const Duration(seconds: 3),
            ),
          );
          isloading = false;
          res_var = false;
        });
      }
    } catch (err) {
      setState(() {
        error_var = err.toString();
        isloading = false;
        res_var = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: res_var == null
            ? const Center(child: CircularProgressIndicator())
            : res_var == false
                ? const Login()
                : const Navigation(),
      ),
    );
  }
}
