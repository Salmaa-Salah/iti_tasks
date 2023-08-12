import 'package:flutter/material.dart';
import 'package:theproject/models/todo_model.dart';
import 'package:theproject/service/todo_service.dart';

class page2 extends StatefulWidget {
  // const page2({super.key});

  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  List<ToDoModel> todos = [];
  bool isloading = true;

  getmytodo() async {
    todos = await todoService().gettodos();
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmytodo();
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(todos[index].title ?? "--"),
                //subtitle: Text((todos[index].userId ?? 0) as String),
                trailing: const Icon(Icons.data_usage_rounded),
                leading: Text("${index + 1}"),
              );
            });
  }
}
