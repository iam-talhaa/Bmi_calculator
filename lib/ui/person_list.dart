import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonList extends StatefulWidget {
  final list_of_person;
  const PersonList({super.key, required this.list_of_person});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? p_wight = prefs.getString('P_weight');
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
