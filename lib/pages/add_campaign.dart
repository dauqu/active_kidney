
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddCampaign extends StatefulWidget {
  const AddCampaign({Key? key}) : super(key: key);

  @override
  State<AddCampaign> createState() => _AddCampaignState();
}

class _AddCampaignState extends State<AddCampaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Campaign'),
          elevation: 0,
          backgroundColor: const Color(0xFF707A8A),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ],
          ),
        ));
  }
}