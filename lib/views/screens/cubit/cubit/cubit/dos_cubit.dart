import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:theproject/models/todo_model.dart';
import 'package:theproject/service/todo_service.dart';

part 'dos_state.dart';

class DosCubit extends Cubit<DosState> {
  DosCubit() : super(DosInitial()) {
    getmytodo();
  }

  List<ToDoModel> todos = [];

  getmytodo() async {
    try {
      (Dosloading());
      todos = await todoService().gettodos();
      emit(Dossuccess());
    } catch (e) {
      emit(DosIerror());
    }
  }
}
