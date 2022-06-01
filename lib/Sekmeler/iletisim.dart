import 'package:belindaproje/araclar/navigator.dart';
import 'package:flutter/material.dart';
import 'package:belindaproje/araclar/baslik.dart';

class iletPage extends StatelessWidget {
  String KateBaslik ;
  iletPage(this.KateBaslik);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: Stack(
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasLik(KateBaslik, context),
                  const SizedBox(height: 15),

                  SizedBox(height: 40),
                ],
              ),

            ),
            const SizedBox(height: 30),
           Align(
             alignment: AlignmentDirectional.center,
             child: Container(
               width: 400,
               height: 400,
               decoration: BoxDecoration(
                 color: Colors.grey.shade200,
                 borderRadius: BorderRadius.circular(8),
                 boxShadow: [
                   BoxShadow (
                     color: Colors.white38.withOpacity(0.2),
                   )
                 ]

               ),
               child: Column(
                 children: [
                   SizedBox(height: 10,),
                   Text("İletişim" , style: TextStyle(
                     color: Colors.black,
                     fontSize: 25,
                     fontWeight: FontWeight.bold,
                   ),),
                   SizedBox(height: 20,),
                   Text("Konum Bilgilerimiz" , style: TextStyle(
                     color: Colors.black,
                     fontSize: 15,
                     fontWeight: FontWeight.bold,
                   ),),
                   Align(
                     alignment: AlignmentDirectional.centerStart,
                     child:  Column(
                       children: [
                         text("Adres:"),
                         SizedBox(height: 10,),
                         text("AŞAĞI EĞLENCE MAH. GİRESUN CAD. NO:31/A ETLİK/ANKARA"),
                         SizedBox(height: 40,),
                         text("Telefon :"),
                         SizedBox(width: 10,),
                         text("(0312) 528 25 55"),
                       ],
                     ),
                     

                   ),



                 ],
               ),
             ),
           )

          ],
        ),
      ),
    );
  }
}

Widget text (String txxt) {
  return
    Text(txxt , style: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,

    ),
    );

}