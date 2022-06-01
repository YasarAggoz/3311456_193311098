import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class AuthService  {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      girisyap (String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return
      user.user;
  }
  cikisyap () async {
    return
        await _auth.signOut();
  }

  kayitol ( String isim , String email , String password ) async {
   var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
   await _firestore
     .collection("person")
   .doc(user.user!.uid)
   .set({
     'userName' : isim,
     'email'   : email,
   });
   return
       user.user;
  }

}