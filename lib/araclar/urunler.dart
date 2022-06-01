import 'package:flutter/material.dart';

import '../Sekmeler/detay.dart';
Widget urunler( @required String photourl , @required String text , @required price ,context ) {
  return
    GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return Detail(text,photourl, price.toString());
        },
        ));
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.only(left: 12, top: 12 ,bottom: 21 ,right: 12),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              padding : const EdgeInsets.all(4),
              decoration: BoxDecoration (borderRadius: BorderRadius.circular(4), color: const Color(0xFFE0ECF8) ),

              child: Image.asset(photourl),

            ),
             SizedBox(height: 10),
            Center(

              child: Text(text, style: const TextStyle(fontSize: 15, color: Color(
                  0xFF04071A))),

            ),
            SizedBox(height: 2),
            Center(child: Text("TRY: $price" , style: const TextStyle(fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
}