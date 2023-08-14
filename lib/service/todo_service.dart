import 'package:dio/dio.dart';
import 'package:flutter_application_firstt/model/todo_model.dart';
class Todo {
  String url = "https://jsonplaceholder.typicode.com/todos";

   getTodos() async{
    List <Welcome> Welcome_List= [];
    final response = await Dio().get(url);
    var data = response.data;
    data.forEach( (element){
      Welcome todo=  Welcome.fromJson (element);
      Welcome_List.add(todo);
    });
    return Welcome_List;
  }
}
