// import 'package:belindaproje/Sekmeler/deneme.dart';
// import 'package:flutter/material.dart';
//
// Widget Spet (String photourl , String baslik , int fiyat,int Adet, context) {
//   return
//     GestureDetector(
//       onTap: (){
//         Navigator.push(context,MaterialPageRoute(builder: (context){
//           return Sepet(photourl,baslik,fiyat,Adet);
//         },
//         ));
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(4),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity((0.08),
//
//               ),
//             ),
//           ],
//         ),
//         child: Column(
//
//           children: [
//             SizedBox(height: 15),
//             Expanded(
//               child:  Image.asset(photourl),
//
//             ),
//             Column(children: [
//
//               Text(baslik , style: TextStyle(color: Colors.black , fontSize: 12 , fontWeight:FontWeight.w500),),
//               SizedBox(height: 10),
//               Text.rich(
//                 TextSpan(
//                   text: "\L${fiyat}",
//                   style: TextStyle(color: Colors.green),
//
//                   children: [
//                     TextSpan(text: "x${Adet}"),
//                   ],
//                 ),
//               )
//
//             ],
//             ),
//           ],
//         ),
//       ),
//     );
// }