import 'package:belindaproje/Sekmeler/homepage.dart';
import 'package:belindaproje/Sekmeler/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class main_page extends StatelessWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Bağlantıda bir Sorun var."),) ;
          }
          else if (snapshot.hasData){
            print("Çalıştı");
            return Homapage();

          } else {
            print("çalssss") ;
            return loginpage();

          }
        },

      ),
    );
  }
}
