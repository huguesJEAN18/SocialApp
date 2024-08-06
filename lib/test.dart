import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.email, required this.mdp});
  final TextEditingController email;
  final TextEditingController mdp;
 
  @override
  State<MyWidget> createState() => _MyWidgetState();

  
}

class _MyWidgetState extends State<MyWidget> {

  test(email,mdp){
    setState(() {
      print('ll $email  $mdp');
    });
  }

  Future<void>createUser(String email, String password)async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseC
    try {
  
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        await firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'role': role,
          'createdAt': Timestamp.now(),
        });

        print('User created and additional information stored in Firestore');}
    } catch (e) {
     print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Email'),
          TextField(controller: widget.email,),
          Text('mdp'),
          TextField(controller: widget.mdp,),
          InkWell(child: Text("tt"),
          onTap: () => test(widget.email.text, widget.mdp.text),)
        ],
      ),
    );
  }
}