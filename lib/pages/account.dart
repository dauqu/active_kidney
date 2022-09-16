import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late SharedPreferences prefs;
  bool isloading = false;
  var res_var;
  var token_var;
  var error_var;

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
      final response =
          await http.post(Uri.parse("https://kideny.harshaweb.com/api/v1/profile"),
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
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text("Profile Updated"),
            //     duration: Duration(seconds: 1),
            //   ),
            // );
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
        });
      }
    } catch (err) {
      setState(() {
        error_var = err.toString();
        isloading = false;
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF707A8A),
          elevation: 0,
          title: const Text("Account"),
          actions: [
            IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
            const SizedBox(),
            IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                prefs.clear();
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              //Profile Image
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://www.w3schools.com/howto/img_avatar.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ListTile(
                tileColor: Color.fromARGB(255, 236, 236, 236),
                leading: const Icon(Icons.person),
                title: Text(
                  res_var != null
                      ? res_var['full_name'].toString()
                      : "Name Not Found",
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  res_var != null
                      ? res_var['email'].toString()
                      : "Email Not Found",
                ),
                onTap: () {},
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  res_var != null
                      ? res_var['phone'].toString()
                      : "Phone Not Found",
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.tag),
                title: Text(
                  res_var != null
                      ? "@${res_var['username']}"
                      : "UserName Not Found",
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.title),
                title: Text(
                  res_var != null
                      ? res_var['title'].toString()
                      : "Title Not Found",
                ),
                onTap: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}
