// sized_box_for_whitespace, sort_child_properties_last

// import 'dart:js_util';

// ignore_for_file: prefer_const_constructors, sort_child_properties_last, body_might_complete_normally_nullable

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainscreen.dart';
// import 'package:flutter_application_firstt/pages/signup.dart';


// import 'welcome.dart';

class Welcome extends StatefulWidget {
  const Welcome ({super.key});

  @override
  State <Welcome> createState() =>  _WelcomeState();
}

class  _WelcomeState extends State <Welcome > {

final _formKey = GlobalKey<FormState>();
TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
   

    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stack(
                  
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Column(
                    children: [
                    
                      Image.asset(
                        "assets/images/welcome.jpg",
                        height: 360,
                        width: 1000,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: emailcontroller,
                            decoration:  InputDecoration(labelText: "Email", 
                            prefixIcon: Icon(Icons.email)),
                            style: const TextStyle(color: Colors.purple),
                            validator: (value) {
                              if(value==null|| value.contains("@")== false)
                              {
                                return "Enter Valid Email";
                              }
                            },
                            )
                          ),
                       
                       Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                            decoration: const InputDecoration(labelText: "Password",
                            prefixIcon: Icon(Icons.lock)),
                            style: const TextStyle(color: Colors.purple),
                            obscureText: true,
                            obscuringCharacter: "*",
                            validator: (value) {
                              if(value==null || value.length <=10){
                                return "Enter the password";
                              }
                            },
                            )
                       ),
                  
                        ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                return Mainscreen(email:emailcontroller.text,);
                              
                                    }));

                            }
                            
                          },
                          child:  Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purple),
                            padding: MaterialStateProperty.all(
                                 EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27))),
                            
                          )),
                      // SizedBox(
                      //   height: 22,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("forget Password? No Yawa, Tap me"),
                        ),
                  
                  
                  
                        Padding(
                          padding:  EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            child: Text(
                              'No Account? Sign Up',
                              style: TextStyle(color: Colors.purple),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey[50]),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                            )
                          ),
                        )
                            
                            
                             ]
                      )
                
                  
                    ],
                  ),
                  Positioned(
                      left: 0,
                      child: Image.asset(
                        "assets/images/main_top.png",
                        width: 100,
                      )),
                  Positioned(
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/main_bottom.png",
                        width: 100,
                      )),
                ]),
          ),
        ),
      )),
    );
  }
  
}
