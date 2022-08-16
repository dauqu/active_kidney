// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Champions extends StatefulWidget {
  const Champions({Key? key}) : super(key: key);

  @override
  State<Champions> createState() => _ChampionsState();
}

class _ChampionsState extends State<Champions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: const Center(
        child: Text('Champions'),
      ),
    );
  }
}
