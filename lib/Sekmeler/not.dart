import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class not extends StatefulWidget {
  @override
  _notlar createState() => _notlar();
}

class _notlar extends State {


  Future<String> get getDosyaYolu async {
    Directory dosya = await getApplicationDocumentsDirectory();
    return dosya.path;
  }


  Future get dosyaOlustur async {
    var dosyakonumu = await getDosyaYolu;
    return File(dosyakonumu + "/notdosyasi.txt");
  }


  Future dosyaYaz(String dosyaninIcerigi) async {
    var myDosya = await dosyaOlustur;

    return myDosya.writeAsString(dosyaninIcerigi);
  }



  Future<String> okunacakDosya() async {
    try {
      var myDosya = await dosyaOlustur;

      String dosyaicergi = myDosya.readAsStringSync();
      return dosyaicergi;
    } catch (exception) {
      debugPrint("HATA :$exception");
    }
    return okunacakDosya();
  }



  TextEditingController notcontroller = TextEditingController();


  var gosterilecekYazi = "";


  var key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
          title: Text("Notunuz"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: notcontroller,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText:
                        "Saklamak İstediğiniz Notu Buraya Yazınız",
                        hintStyle: TextStyle(
                            letterSpacing: 2,
                            fontSize: 15,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: Yaz,
                        child: Text("Dosya'ya Yaz"),
                      ),
                      ElevatedButton(
                        onPressed: Oku,

                        child: Text("Dosya'dan oku"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("$gosterilecekYazi"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void Yaz() async {
    dosyaYaz(notcontroller.text.toString()).then((value) {
      setState(() {
        gosterilecekYazi=value.toString();
      });

    });
  }

  void Oku() async {
    okunacakDosya().then((String deger) {
      setState(() {
        gosterilecekYazi = deger;
        debugPrint("$gosterilecekYazi");
      });
    });
  }
}