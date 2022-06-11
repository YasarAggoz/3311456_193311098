
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:belindaproje/model/uyemodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userstore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> Saveuser (usermap UserMap) {{
    return _db
        .collection("users")
        .doc(UserMap.id)
        .set(UserMap.toMap());

  }

  }
  Stream <List<usermap>> kullanicigetir() {
    return _db.collection('users').snapshots().map((snapshot) => snapshot
    .docs
        .map((document) => usermap.fromFirestore(document.data()))
        .toList()
    );
  }

  Future<void> kullanicisil (String id) {
    return _db
        .collection('users').doc(id).delete();
  }

}