// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:active_kidney/components/list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  late SharedPreferences prefs;

  //Remove SharedPreferences
  Future<void> removePrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');
  }

  var number = 10;

  //JSON Data
  var categories = [
    {
      'id': 1,
      'name': 'Atorvastatin',
    },
    {
      'id': 2,
      'name': 'Levothyroxine',
    },
    {
      'id': 3,
      'name': 'Lisinopril',
    },
    {
      'id': 4,
      'name': 'Metformin',
    },
    {
      'id': 5,
      'name': 'Metoprolol',
    },
    {
      'id': 6,
      'name': 'Amlodipine',
    },
    {
      'id': 7,
      'name': 'Albuterol',
    },
    {
      'id': 8,
      'name': 'Omeprazole',
    },
    {
      'id': 9,
      'name': 'Losartan',
    },
    {
      'id': 10,
      'name': 'Gabapentin',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: number,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF707A8A),
            elevation: 0,
            leading: IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.menu),
              onPressed: () {
                //Open Menu Drawer
                Scaffold.of(context).openDrawer();
              },
            ),
            title: const Text('Community'),
            actions: const [],
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              indicatorWeight: 1.0,
              isScrollable: true,
              splashBorderRadius: BorderRadius.circular(2),
              splashFactory: InkRipple.splashFactory,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: 4, color: Color.fromARGB(255, 219, 219, 215)),
                  insets: EdgeInsets.symmetric(horizontal: 1)),
              tabs: [
                for (var i = 0; i < categories.length; i++)
                  Tab(
                    text: categories[i]['name'].toString(),
                  ),
              ],
            ),
          ),
          body: Center(
            //Dynamic TabBar
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                for (var i = 0; i < categories.length; i++)
                  const Center(
                    child: HomeList(),
                  ),
              ],
            ),
          )),
    );
  }
}
