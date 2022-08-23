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

  var number = 17;

  //JSON Data
  var categories = [
    {
      'id': 1,
      'name': 'Latest',
    },
    {
      'id': 2,
      'name': 'Wellbeing',
    },
    {
      'id': 3,
      'name': 'Care Giver',
    },
    {
      'id': 4,
      'name': 'Physiotherapy',
    },
    {
      'id': 5,
      'name': 'Exercise',
    },
    {
      'id': 6,
      'name': 'Diet',
    },
    {
      'id': 7,
      'name': 'Charity',
    },
    {
      'id': 8,
      'name': 'Dialysis Address',
    },
    {
      'id': 9,
      'name': 'Research',
    },
    {
      'id': 10,
      'name': 'Survivorship',
    },
    {
      'id': 11,
      'name': 'News',
    },
    {
      'id': 12,
      'name': 'Renal Transplant Hospital',
    },
    {
      'id': 13,
      'name': 'Medicine Order',
    },
    {
      'id': 14,
      'name': 'Doctor Consultant',
    },
    {
      'id': 15,
      'name': 'Blood Bank',
    },
    {
      'id': 15,
      'name': 'Home Dialysis',
    },
    {
      'id': 15,
      'name': 'Lab Test',
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
