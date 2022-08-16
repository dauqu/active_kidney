import 'package:flutter/material.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track'),
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
      body: Center(
        child: Text('Track'),
      ),
    );
  }
}
