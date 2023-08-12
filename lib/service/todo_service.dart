import 'package:dio/dio.dart';
import 'package:theproject/models/todo_model.dart';

class todoService {
  String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ToDoModel>> gettodos() async {
    List<ToDoModel> todolist = [];
    final response = await Dio().get(url);
    var data = response.data;
    data.forEach((element) {
      ToDoModel todos = ToDoModel.fromJson(element);
      todolist.add(todos);
    });
    return todolist;
  }
}
