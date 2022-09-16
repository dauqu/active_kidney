import 'package:active_kidney/components/list.dart';
import 'package:active_kidney/pages/personal_journal.dart';
import 'package:flutter/material.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  TextEditingController campaignController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track'),
        elevation: 0,
        backgroundColor: const Color(0xFF173034),
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.menu),
          onPressed: () {
            //Open Menu Drawer
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              showDateRangePicker(
                context: context,
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
                useRootNavigator: false
              ).then((value) {
                setState(() {
                  _range = value.toString();
                  _rangeCount = value.toString();
                });
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.book_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PersonalJournal()),
              );
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      readOnly: true,
                      controller: campaignController,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: const Text('Select Your Campaign'),
                              children: <Widget>[
                                SimpleDialogOption(
                                  onPressed: () {
                                    setState(() {
                                      //Set Campaign Name
                                      campaignController.text =
                                          'Be specific and use names';
                                      //Close Dialog
                                      Navigator.pop(context);
                                    });
                                  },
                                  child:
                                      const Text('Be specific and use names'),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    setState(() {
                                      //Set Campaign Name
                                      campaignController.text =
                                          'Strike the right tone';
                                      //Close Dialog
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text('Strike the right tone'),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    setState(() {
                                      //Set Campaign Name
                                      campaignController.text =
                                          'Use a little creativity';
                                      //Close Dialog
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text('Use a little creativity'),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    setState(() {
                                      //Set Campaign Name
                                      campaignController.text =
                                          'Spark interest around your cause';
                                      //Close Dialog
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text(
                                      'Spark interest around your cause'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.campaign,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: 'Select Campaign',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        //Show DatePicker
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025),
                        );

                        if (newDate != null) {
                          setState(() {
                            _selectedDate = newDate.toString();
                            dateController.text = _selectedDate;
                            print(_selectedDate);
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: 'Select Date',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xFF173034),
                ),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/home');
              },
              child: const Text(
                'Track',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
