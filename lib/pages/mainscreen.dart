

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  String email;
  
 Mainscreen ({super.key, required this.email});

  @override
  State<Mainscreen > createState() => _Mainscreen();
}

class _Mainscreen extends State<Mainscreen > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
        style: 
               TextStyle( color: Colors.white),
               ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
             onPressed: (){},
          ),
        actions: [
          IconButton(
          icon: Icon(Icons.search),
             onPressed: (){},
          ),
          IconButton(
          icon: Icon(Icons.comment),
             onPressed: (){},   
          )
        ], 
      
      ),
      body: Center(child:
       Text(widget.email, style: TextStyle(color: Colors.blue, fontSize: 35),

       
    
    
    ) ,),




    );
  }
}