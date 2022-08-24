import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LogSymptoms extends StatefulWidget {
  const LogSymptoms({Key? key}) : super(key: key);

  @override
  State<LogSymptoms> createState() => _LogSymptomsState();
}

class _LogSymptomsState extends State<LogSymptoms> {
  var month_name = "August";
  var day_name = "Monday";
  var date = "01";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Log Symptoms'),
          elevation: 0,
          backgroundColor: const Color(0xFF707A8A),
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              //Open Menu DrawerN
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );

                      //Set Date
                      setState(() {
                        date = "${DateTime.now().day}";
                        month_name = "${DateTime.now().month}";
                        day_name = "${DateTime.now().day}";
                      });
                    },
                    readOnly: true,
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_month,
                          size: 25, color: Colors.white),
                      hintText: '$day_name, $month_name $date',
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "2 weeks ago",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          //List View of Symptoms
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              ListTile(
                leading: Icon(Icons.sick),
                title: Text('Fever'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sick),
                title: Text('Nausea'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_dissatisfied),
                title: Text('Vomiting'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_neutral),
                title: Text('Sad'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_neutral),
                title: Text('Anxious'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_dissatisfied),
                title: Text('Appetite loss'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_neutral),
                title: Text('Short of breath'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_dissatisfied),
                title: Text('Constipation'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sick),
                title: Text('Diarrahoea'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_neutral),
                title: Text('Cough'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_dissatisfied),
                title: Text('pins and needles'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sick),
                title: Text('Painful urination'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sick),
                title: Text('Hot flashes'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_dissatisfied),
                title: Text('Reflux'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sick),
                title: Text('Drowsy'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sentiment_dissatisfied),
                title: Text('Other'),
                trailing: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
        ));
  }
}
