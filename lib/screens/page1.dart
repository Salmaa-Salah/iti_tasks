import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  String email = '';
  getcachedemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '--';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getcachedemail();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("page1 \n $email"),
    );
  }
}
