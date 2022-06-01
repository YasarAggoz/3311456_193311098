import 'package:belindaproje/Sekmeler/ARAC.dart';
import 'package:belindaproje/Sekmeler/BAY.dart';
import 'package:belindaproje/Sekmeler/BAYAN.dart';
import 'package:belindaproje/Sekmeler/Kolonya.dart';
import 'package:belindaproje/Sekmeler/SPREY.dart';
import 'package:belindaproje/Sekmeler/exlusive.dart';
import 'package:belindaproje/Sekmeler/iletisim.dart';
import 'package:belindaproje/Sekmeler/oda.dart';
import 'package:belindaproje/araclar/baslik.dart';
import 'package:flutter/material.dart';
class kategorisf extends StatelessWidget {
  late String secili ;
  final List<String> kategoriler = [
    "BAY",
    "BAYAN",
    "ODA KOKUSU",
    "ARAÇ PARFÜMÜ",
    "ODA İLE OTO SPREY",
    "EXLCLUSİVE",
    "KOLONYA",
    "BİZE ULAŞIN",
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold (
        body: SafeArea(
            child: Stack(
                children:[ Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          BasLik("Kategoriler", context),
                          //Kategoriler
                          const SizedBox(height: 17),
                          Expanded(
                            child: ListView(
                                children:

                                kategoriler.map((String title) => kategories(title , context)).toList()),
                          ),
                          SizedBox(height: 40),
                        ]
                    )
                ),
                const SizedBox(height: 40),
                ]
            )
        )
    );
  }
}

Widget kategories (String baslik ,  context) {
  var Page;
if (baslik == "BAY") { Page= Kategoripage(baslik);  }
if (baslik == "ARAÇ PARFÜMÜ") { Page=AracPage(baslik);   }
if (baslik == "BAYAN") { Page=BayanPage(baslik);   }
if (baslik == "ODA KOKUSU") { Page=odaPage(baslik);   }
if (baslik == "ODA İLE OTO SPREY") { Page=spreyPage(baslik);   }
if (baslik == "EXLCLUSİVE") { Page=exluPage(baslik);   }
if (baslik == "KOLONYA") { Page=koloPage(baslik);   }
if (baslik == "BİZE ULAŞIN") { Page=iletPage(baslik);   }

  return
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return
         Page;
        }
        ) );

      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0,4)
              ),
            ] ),
        child: Text(baslik ,style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),

      ),
    );

}