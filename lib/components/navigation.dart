// ignore: file_names
import 'package:active_kidney/components/log_symptoms.dart';
import 'package:active_kidney/pages/about.dart';
import 'package:active_kidney/pages/account.dart';
import 'package:active_kidney/pages/add_campaign.dart';
import 'package:active_kidney/pages/bug.dart';
import 'package:active_kidney/pages/champions.dart';
import 'package:active_kidney/pages/terms.dart';
import 'package:active_kidney/pages/track.dart';
import 'package:active_kidney/pages/community.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
   late SharedPreferences prefs;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Community(),
    Track(),
    Champions(),
    Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF707A8A),
        
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogSymptoms()),
          );
        },
        label: Text('Add'),
        icon: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF707A8A),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.pond5.com/human-kidney-hologram-footage-133282224_iconl.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Active Kidney',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Edit my profile'),
              onTap: () {
                //Open Profile page with editable fields
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Account(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Active Kidney'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Terms & Conditions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Terms()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: const Text('Report a bug'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bug()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              onTap: () async {
                prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.switch_account),
            label: 'Champions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[700],
        unselectedItemColor: const Color(0xFF707A8A),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
