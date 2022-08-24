import 'dart:convert';

import 'package:active_kidney/pages/add_personal_journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PersonalJournal extends StatefulWidget {
  const PersonalJournal({Key? key}) : super(key: key);

  @override
  State<PersonalJournal> createState() => _PersonalJournalState();
}

class _PersonalJournalState extends State<PersonalJournal> {
  bool isLoading = false;
  var res;
  Future AddEntry() async {
    // ignore: prefer_typing_uninitialized_variables

    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();

    final response = await http.post(
        Uri.parse("https://kideny.harshaweb.com/api/v1/entries/all"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "token": prefs.getString('token').toString(),
        }));

    // setState(() {
    //   res = json.decode(response.body);
    //   print(res);
    //   isLoading = false;
    // });

    if (response.statusCode == 200) {
      setState(() {
        res = json.decode(response.body);
      });

      
      print(res);
      isLoading = false;
    } else {
      throw Exception('Failed to load post');
    }

    // if (response.statusCode == 200) {
    //   setState(() {
    //     res = json.decode(response.body);
    //   });
    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(res['message'].toString()),
    //       duration: const Duration(seconds: 2),
    //     ),
    //   );

    //   isLoading = false;
    // } else {
    //   setState(() {
    //     // message = res['message'].toString();
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(res['message'].toString()),
    //         duration: const Duration(seconds: 3),
    //       ),
    //     );
    //     isLoading = false;
    //   });
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddEntry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Journal'),
        elevation: 0,
        backgroundColor: const Color(0xFF707A8A),
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //Open Menu Drawer
            Navigator.pop(context);
          },
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: const Text(""),
              backgroundColor: Colors.transparent,
              expandedHeight: 100.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                titlePadding: const EdgeInsets.all(20),
                title: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPersonalJournal()),
                    );
                  },
                  label: const Text(
                    "Add Personal Journal",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xFF707A8A),
                    fixedSize: const Size(200, 30),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.all(10),
          child: res != null
              ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                  itemCount: res.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(res[index]['title']),
                        subtitle: Text(res[index]['category']),
                        trailing: IconButton(
                          splashRadius: 20,
                          icon: const Icon(Icons.remove_red_eye),
                          //Show botton sheet
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          res[index]['title'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          res[index]['category'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          res[index]['description'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  })
              : Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        //Rounded image
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/undraw_Showing_support_re_5f2v.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          transformAlignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            'My Personal Journal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          transformAlignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            'Record your experiences and thoughts about your journey here!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(169, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
