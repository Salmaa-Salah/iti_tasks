import 'package:flutter/material.dart';
import 'package:theproject/views/screens/page1.dart';
import 'package:theproject/views/screens/page2.dart';
import 'package:theproject/views/screens/page3.dart';

class homeScreen extends StatefulWidget {
  String email;
  homeScreen({
    super.key,
    required this.email,
  });

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int currentindex = 0;
  List<Widget> pages = [
    page1(),
    page2(),
    page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: pages[currentindex],
      /*Center(
        child: Text(widget.email),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'page1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'page2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'page3',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (value) {
          currentindex = value;
          setState(() {});
         // selectedItemColor:
          Colors.amber[800];
          print(value);
        },
      ),
    );
  }
}
