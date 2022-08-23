import 'package:active_kidney/pages/add_personal_journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonalJournal extends StatefulWidget {
  const PersonalJournal({Key? key}) : super(key: key);

  @override
  State<PersonalJournal> createState() => _PersonalJournalState();
}

class _PersonalJournalState extends State<PersonalJournal> {
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
    );
  }
}
