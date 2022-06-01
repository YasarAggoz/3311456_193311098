import 'package:belindaproje/Sekmeler/detay.dart';
import 'package:flutter/material.dart';

Widget KatUrun (String photourl , String baslik , String fiyat, context) {
  return
    GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
         return Detail(baslik,photourl,fiyat);
        },
        ));
      },

        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity((0.08),

              ),
            ),
          ],
        ),
        child: Column(

          children: [
          SizedBox(height: 15),
          Expanded(
            child:  Image.asset(photourl),

          ),
          Column(children: [
            SizedBox(height: 20),
            Text(baslik , style: TextStyle(color: Colors.black , fontSize: 12 , fontWeight:FontWeight.w500),),
            Text("TRY $fiyat",style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.w500),),
          ],
          ),
        ],
        ),
      ),
    );
}