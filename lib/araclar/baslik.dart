
import 'package:flutter/material.dart';
Widget BasLik(String baslik , context) {

  return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),

        GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, size: 29,)),
        const SizedBox(height: 25,),
         Text( baslik, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ],
    );
}


