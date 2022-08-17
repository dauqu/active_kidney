import 'dart:async';
import 'dart:convert';

import 'package:active_kidney/components/list.dart';
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
          await http.post(Uri.parse("https://news.chatvait.com/api/v1/profile"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "token": token_var,
              }));

      setState(() {
        res_var = json.decode(response.body);
        print(res_var);
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
              ListTile(
                tileColor: Color.fromARGB(255, 236, 236, 236),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://www.w3schools.com/howto/img_avatar.png"),
                ),
                title: Text(
                  res_var != null
                      ? res_var['full_name'].toString()
                      : "Name Not Found",
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      res_var != null
                          ? "Email: ${res_var['email']}"
                          : "Email Not Found",
                    ),
                    const SizedBox(height: 5),
                    Text(
                      res_var != null
                          ? "Phone: ${res_var['phone']}"
                          : "Phone Not Found",
                    ),
                    const SizedBox(height: 5),
                    Text(
                      res_var != null
                          ? "Title: ${res_var['title']}"
                          : "Address Not Found",
                    ),
                  ],
                ),
                // onTap: () {},
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Edit my profile"),
                onTap: () {},
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () {
                  prefs.clear();
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text("About"),
                onTap: () {},
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Help"),
                onTap: () {},
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {},
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () {
                  prefs.clear();
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ));
  }
}
