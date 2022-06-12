import 'package:belindaproje/Sekmeler/homepage.dart';
import 'package:belindaproje/Sekmeler/sign.dart';
import 'package:belindaproje/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passawordController = TextEditingController();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {

    Future signIn() async {

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passawordController.text.trim(),


        );
        Navigator.
        push(context,
            MaterialPageRoute(builder: (context) => Homapage()));
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content : Text(e.message.toString(),)));

      }


    }
    return  Scaffold (
      appBar: AppBar(title: Text("Giriş Yap"),) ,
        body: SafeArea(
        child: Stack(
        children:[
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
          Center(child: Text("Giriş Yap" , style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20),
      TextField(
            controller: emailController,
        keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Mail Adresi ",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                )
              ),
                prefixIcon: Icon(Icons.email),
            ),
      ),
      TextField(
        controller: passawordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: "Şifre",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,


                )
            ),
            prefixIcon: Icon(Icons.vpn_key),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                )
            )
        ),
      ),
      SizedBox(height: 20),
         Row(
           crossAxisAlignment: CrossAxisAlignment.start,

           children: [
         Padding(padding:
         EdgeInsets.all(12),
            child: ElevatedButton(
                style:
                ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () async {

                 signIn().then((value) {
                   ScaffoldMessenger.of(context)
                       .showSnackBar(SnackBar(content : Text("Hoşgeldiniz")));
                 },
                 );
                },
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(fontSize: 25),
                )

            ),

         ),
             SizedBox(width: 15),
             Padding(
               padding: const EdgeInsets.all(12.0),
             child:  ElevatedButton(
                 style:
                 ElevatedButton.styleFrom(primary: Colors.blue),
                 onPressed: () async {

                     Navigator.push(
                         context, MaterialPageRoute(builder: (context) {
                       return
                         signpage();
                     }
                     ));

                 },
                 child: const Text(
                   "Üye Ol",
                   style: TextStyle(fontSize: 25),
                 )

             ),
             ),

           ],
         ),

      ],
    ),
    ),
      ]
    ),
    ),
    );
  }
}


