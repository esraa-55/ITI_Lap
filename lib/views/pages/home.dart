// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_application_firstt/views/pages/cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},

        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoError) {
            return Center(
              child: Text("Error"),
            );
          }
          return ListView.builder(
              itemCount: context.watch<TodoCubit>().Welcome_List.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      context.watch<TodoCubit>().Welcome_List[index].title ??
                          "--"),
                  trailing: Icon(Icons.title),
                  leading: Text("${index + 1}"),
                );
              });
        },
      ),
    );
  }
}
