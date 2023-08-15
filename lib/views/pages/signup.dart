// ignore_for_file: prefer_const_constructors, sort_child_properties_last, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firstt/views/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool insecurepass = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 270,
                  width: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/signup.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 340,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Icon(Icons.account_box_rounded),
                      ),
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value == null || value.contains("@") == false) {
                        return "Enter Valid Email";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passcontroller,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: togglePassword(),
                    ),
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 15,
                    ),
                    obscureText: insecurepass,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value == null || value.length <= 6) {
                        return "Enter Valid Password";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: togglePassword(),
                    ),
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 15,
                    ),
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value == null) {
                        return "Enter Valid password";
                      } else if (value != passcontroller.text) {
                        return " password mismatch";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      onPressed: () async {
                 
                        

                        if (_formKey.currentState!.validate()) { 
                           bool result =  await register(emailcontroller.text,passcontroller.text);
                              if(result==true){

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Successful registration")));

                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return Login();
                              
                                    }));

                              }
                                 else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error,try again"))
                                );
                                 }
                        }
                      },
  
                        

                         
                          
                    
                      child: Text("Register"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 79, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "assets/images/face.jpeg",
                        width: 70,
                        height: 40,
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/google.jpg",
                        width: 70,
                        height: 40,
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/twitter.jpg",
                        width: 70,
                        height: 40,
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showsnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text(message)));
  }

  Future<bool> register( String email, String password) async {
    try{
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text,
      password: passcontroller.text,
     
    );

     if(userCredential.user !=null){
    return true;
     }
  }
  
  on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
  showsnackbar(context,"The password provided is too weak.");
 } else if (e.code == 'email-already-in-use') {
    showsnackbar(context,"The account already exists for that email." );
                          }

  } 
    return false;
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          insecurepass = !insecurepass;
        });
      },
      icon: insecurepass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
