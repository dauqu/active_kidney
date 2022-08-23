import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPersonalJournal extends StatefulWidget {
  const AddPersonalJournal({Key? key}) : super(key: key);

  @override
  State<AddPersonalJournal> createState() => _AddPersonalJournalState();
}

class _AddPersonalJournalState extends State<AddPersonalJournal> {
  bool isLoading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Entry'),
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
      bottomSheet: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          setState(() {
                            isLoading = true;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xFF707A8A),
                    fixedSize: const Size(200, 40),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            valueColor:
                                AlwaysStoppedAnimation(Color(0xFF6D6D6D)),
                          ),
                        )
                      : const Text(
                          "Add Entry",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => AddPersonalJournal()),
                    // );
                    Navigator.pop(context);
                  },
                  label: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xFFFF2A2A),
                    fixedSize: const Size(200, 40),
                  ),
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: categoryController,
                  onTap: () {
                    //Show Dilog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Select Category'),
                            content: SizedBox(
                                height: 400,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        dense: true,
                                        title: const Text('Persona'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Persona';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Appointment'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Appointment';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Achievement'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Achievement';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Questions'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Questions';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Surgery'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Surgery';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Rediotherapy'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Rediotherapy';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Chemotherapy'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Chemotherapy';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Work'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Work';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Exercise'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Exercise';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: const Text('Nutrition'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            categoryController.text = 'Nutrition';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                )));
                      },
                    );
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.category),
                    isDense: true,
                    hintText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                //Big Text Field
                TextField(
                  controller: contentController,
                  maxLines: 20,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Entry',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}