
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
class signpage extends StatefulWidget {

  const signpage({Key? key}) : super(key: key);

  @override
  State<signpage> createState() => _signpageState();
}

class _signpageState extends State<signpage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
   TextEditingController ussernamecontroller =TextEditingController();
   TextEditingController surnamecontroller =TextEditingController();
   TextEditingController telcontroller =TextEditingController();
   TextEditingController emailcontroller =TextEditingController();
   TextEditingController passwordcontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');


    return  Scaffold (
      appBar: AppBar(title: const Text("Üye Ol"),) ,
      body: SafeArea(
        child: Stack(
            children:[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Center(child: Text("Üye Ol" , style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 20),
                    textekle("Kullanıcı Adı", ussernamecontroller),

                     textekle("Soyadı:", surnamecontroller),

                      textekle("Tel:", telcontroller),
                       TextField(
                        controller: emailcontroller,
                         keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Mail adresi",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),
                       TextField(
                        controller: passwordcontroller,
                         keyboardType: TextInputType.visiblePassword,
                         obscureText: true,
                         enableSuggestions: false,
                         autocorrect: false,
                        decoration: InputDecoration(
                            hintText: "Parola",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),
                    
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const SizedBox(width: 15),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                if (emailcontroller.text.isNotEmpty & passwordcontroller.text.isNotEmpty) {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                      email: emailcontroller.text.trim(),
                                      password: passwordcontroller.text.trim())
                                      .then((value) =>
                                  {
                                   users.add({
                                     'name':ussernamecontroller.text,
                                      'surname':surnamecontroller.text,
                                     'tel':telcontroller.text,
                                   }) ,

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => loginpage())),

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(content: Text(
                                        "Kullanıcı Oluşturuldu"))),
                                  });
                                }
                                else { print("bos");  };
                              },
                              label: const Text('Üye Ol'),
                              icon: const Icon(Icons.thumb_up),
                              backgroundColor: Colors.blue,
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}




Widget textekle (String text , TextEditingController controller) {
  return
    TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          )
      ),
    );
}