// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Champions extends StatefulWidget {
  const Champions({Key? key}) : super(key: key);

  @override
  State<Champions> createState() => _ChampionsState();
}

class _ChampionsState extends State<Champions> {
  var number = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: number,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Champions'),
          elevation: 0,
          backgroundColor: const Color(0xFF707A8A),
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.menu),
            onPressed: () {
              //Open Menu Drawer
              Scaffold.of(context).openDrawer();
            },
          ),
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
            tabs: const [
              Tab(
                text: 'My Champions',
              ),
              Tab(
                text: 'My Heroes',
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              Center(
                  child: Column(
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    label: const Text(
                      "Add Your Champion",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: const Color(0xFF707A8A),
                      fixedSize: const Size(300, 45),
                    ),
                  ),
                  const SizedBox(height: 40),
                  //Rounded image
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image:
                            AssetImage('assets/undraw_feeling_blue_4b7q.png'),
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
                      'Begin nominating your champions to help you along your journey!',
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
                      'You are not alone. Champions are your family, friends, and clinicians who are here to assist. To get started, tap the button below and invite your champion to join your journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(169, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              )),
             Center(
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
                        image:
                            AssetImage('assets/undraw_Showing_support_re_5f2v.png'),
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
                      'My Heroes',
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
                      'Here are those who have helped you along your journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(169, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
