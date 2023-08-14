import 'package:flutter/material.dart';
import 'package:flutter_application_firstt/model/todo_model.dart';
import 'package:flutter_application_firstt/service/todo_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()) {
    getMyTodos();
  }

  List<Welcome> Welcome_List = [];
  getMyTodos() async {
    try {
      emit(TodoLoading());
      Welcome_List = await Todo().getTodos();
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoError());
    }
  }
}
