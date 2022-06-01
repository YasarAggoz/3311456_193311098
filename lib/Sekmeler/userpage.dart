import 'package:belindaproje/Sekmeler/login.dart';
import 'package:belindaproje/Sekmeler/main_Page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userpage extends main_page {
  const userpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
   String getUserType() {
     String deneme = "Deneme" ;
      var ref = firestore.collection("users").doc("Y6UDa4oBH6Vm2N5cnOrAQM1dMu63").get();
      ref.then((DocumentSnapshot documentSnapshot) {
        deneme= documentSnapshot.get("name") ;

      });
      return deneme ;
    }

    var kullanici = users
        .doc("Y6UDa4oBH6Vm2N5cnOrAQM1dMu63")
        .get()
        .then((value) => value.get("name"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Sayfası"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Kullanıcı mail:",
                        style: TextStyle(
                            color: Color(0xFF1F1919),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        user!.email.toString(),
                        style: const TextStyle(
                            color: Color(0xFF1F1919),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      text("Kullanıcı Adı:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(getUserType(),),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      text("Kullanıcı Soyadı:"),
                      SizedBox(
                        width: 10,
                      ),
                      text("Deneme"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      text("Kayıtlı Tel No:"),
                      SizedBox(
                        width: 10,
                      ),
                      text("0555 555 55 55"),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const loginpage()));
                      });
                    },
                    child: const Text("Çıkış Yap"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget text(String txxt) {
  return Text(
    txxt,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

// class GetUserName extends StatelessWidget {
//   final String documentId;
//
//   GetUserName(this.documentId);
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }
//
//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }
//
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("Full Name: ${data['full_name']} ${data['last_name']}");
//         }
//
//         return Text("loading");
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// // Import the firebase_core and cloud_firestore plugin
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddUser extends StatelessWidget {
//   final String fullName;
//   final String company;
//   final int age;
//
//   AddUser(this.fullName, this.company, this.age);
//
//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//         'full_name': fullName, // John Doe
//         'company': company, // Stokes and Sons
//         'age': age // 42
//       })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//
//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }