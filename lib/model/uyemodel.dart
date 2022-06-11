class usermap {
   String? id;
   String? name;
   String? surname;
   int? tel;

  usermap(
      {  this.id,   this.name,   this.surname,   this.tel});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'tel': tel,

    };
  }

  usermap.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        name = firestore['name'],
        surname = firestore['loginname'],
        tel = firestore['tel'];

}
