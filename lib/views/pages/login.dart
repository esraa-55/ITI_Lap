// sized_box_for_whitespace, sort_child_properties_last

// import 'dart:js_util';

// ignore_for_file: prefer_const_constructors, sort_child_properties_last, body_might_complete_normally_nullable

// import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firstt/views/pages/signup.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'mainscreen.dart';
// import 'package:flutter_application_firstt/pages/signup.dart';


// import 'welcome.dart';

class Login extends StatefulWidget {
  const Login ({super.key});

  @override
  State <Login> createState() =>  _LoginState();
}

class  _LoginState extends State <Login > {

final _formKey = GlobalKey<FormState>();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

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
                              controller: passwordcontroller,
                            decoration: const InputDecoration(labelText: "Password",
                            prefixIcon: Icon(Icons.lock)),
                            style: const TextStyle(color: Colors.purple),
                            obscureText: true,
                            obscuringCharacter: "*",
                            validator: (value) {
                              if(value==null || value.length <=6){
                                return "Enter the password";
                              }
                            },
                            )
                       ),
                  
                        ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                            bool result =  await FirebaseLogin(emailcontroller.text,passwordcontroller.text);
                              if(result==true){
                                 final SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setString('email', emailcontroller.text);
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return Mainscreen(email:emailcontroller.text,);
                              
                                    }));

                              }
                                 else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error, please Enter the valid email& password"))
                                );
                                 }
                        
                             


                              // final SharedPreferences prefs = await SharedPreferences.getInstance();
                              // await prefs.setString('email', emailcontroller.text);
                              // Navigator.push(context,MaterialPageRoute(builder: (context){
                              //   return Mainscreen(email:emailcontroller.text,);
                              
                              //       }));

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
                             Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SignUp();
                             }));
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
  Future<bool>FirebaseLogin(String email, String password)async{
    try  {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  if(userCredential.user !=null){
    return true;
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
return false;
  }
  
}
