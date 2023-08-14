

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_application_firstt/views/pages/account.dart';
import 'package:flutter_application_firstt/views/pages/chat.dart';
import 'package:flutter_application_firstt/views/pages/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Mainscreen extends StatefulWidget {
  String email;
  
 Mainscreen ({super.key, required this.email});

  @override
  State<Mainscreen > createState() => _Mainscreen();
  
}

class _Mainscreen extends State<Mainscreen > {

  int _currentIndex = 0;
  final screen = [
    HomeScreen(),
    ChatScreen(),
    AccountScreen(),
  ];

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
        style: 
               TextStyle( color: Colors.white, ), 
               ),
               backgroundColor: Colors.purple,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //      onPressed: (){},
        //   ),
        actions: [
          IconButton(
          icon: Icon(Icons.search),
             onPressed: (){},
          ),
          IconButton(
          icon: Icon(Icons.settings),
             onPressed: (){},   
          )
        ], 
      
      ),
      body: screen[_currentIndex],
    //   Center(child:
    //    Text(widget.email, style: TextStyle(color: Colors.blue, fontSize: 35),
    // ) ,),

    bottomNavigationBar: GNav(
     
    selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

      backgroundColor: Colors.purple,
      color:Colors.white,
      activeColor: Color.fromARGB(255, 133, 87, 141),
      tabBackgroundColor: Color.fromARGB(255, 219, 170, 228),
      tabs: [
        GButton(
        icon: Icons.home,
        text: "Home", 
        ),
        
        GButton(
        icon: Icons.chat,
        text:"Chat",
              ),

        
        GButton(
          icon: Icons.account_circle,
          text:"Account"),
        
        
      ]
      ),
    
     
    );





  
  }
}