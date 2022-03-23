import 'package:flutter/material.dart';

class CharacterFilterPage extends StatefulWidget {
  const CharacterFilterPage({Key? key}) : super(key: key);

  @override
  _CharacterFilterPageState createState() => _CharacterFilterPageState();
}

class _CharacterFilterPageState extends State<CharacterFilterPage> {
  int statusSelectIndex = 0;
  int genderSelectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Filter',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                statusSelectIndex = 0;
                genderSelectIndex = 0;
              });
            },
            child: const Text(
              'Clear',
              style: TextStyle(color: Color(0xff5856D6)),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: statusSelectIndex,
                  onChanged: (int? val) {
                    setState(() {
                      statusSelectIndex = val!;
                    });
                  },
                  title: const Text('Alive'),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: statusSelectIndex,
                  onChanged: (int? val) {
                    setState(() {
                      statusSelectIndex = val!;
                    });
                  },
                  title: Text('Dead'),
                ),
                RadioListTile(
                  value: 3,
                  groupValue: statusSelectIndex,
                  onChanged: (int? val) {
                    setState(() {
                      statusSelectIndex = val!;
                    });
                  },
                  title: Text('Unknown'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: genderSelectIndex,
                  onChanged: (int? val) {
                    setState(() {
                      genderSelectIndex = val!;
                    });
                  },
                  title: const Text('Female'),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: genderSelectIndex,
                  onChanged: (int? val) {
                    setState(() {
                      genderSelectIndex = val!;
                    });
                  },
                  title: Text('Male'),
                ),
                RadioListTile(
                  value: 3,
                  groupValue: genderSelectIndex,
                  onChanged: (int? val) {
                    setState(() {
                      genderSelectIndex = val!;
                    });
                  },
                  title: Text('Genderless'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                print('sda');
              },
              child: Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff5856D6),
                ),
                child: const Text(
                  'APPLY',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
