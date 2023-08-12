// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_firstt/service/todo_service.dart';

import '../model/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List <Welcome>  Welcome_List= [];
  bool isLoading = true;

  getMyTodos() async{
    Welcome_List = await Todo().getTodos();
    isLoading =false;

    setState(() {});
  }

    @override
      void initState(){
    super.initState();
    getMyTodos();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?
        Center(child: CircularProgressIndicator(), ) :
        
         ListView.builder(
        itemCount: Welcome_List.length,

        itemBuilder: (BuildContext context , int index){
      return ListTile(
        title: Text (Welcome_List[index].title ?? "--"  ),

          trailing :Icon(Icons.title),
          leading: Text("${ index +1}"),

      );
        }

    );

  }
}
        
  