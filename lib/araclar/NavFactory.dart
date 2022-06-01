import 'package:flutter/material.dart';


Widget navfactory({ required String text, required IconData icon,  required Widget widget , required BuildContext context }) {
  return
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }) );
      },
      child: Column(
        children: [
          Container(

            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFE0ECF8)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Icon (icon,color: const Color(0XFF0001FC) ,size: 20,
            ),
          ),
          Text(text),
        ],
      ),
    );}