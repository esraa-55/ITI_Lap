import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

   String email = "";
 getcachedEmail() async
 {

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  email= prefs.getString("email") ?? '--';
  setState(() { });
 }

 @override
  void initState() {
    super.initState();
    getcachedEmail();

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("chat \n $email"),
    );
      
      
  }
}