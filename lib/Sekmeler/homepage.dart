import 'package:belindaproje/Sekmeler/ARAC.dart';
import 'package:belindaproje/Sekmeler/BAY.dart';
import 'package:belindaproje/Sekmeler/BAYAN.dart';
import 'package:belindaproje/Sekmeler/deneme.dart';
import 'package:belindaproje/Sekmeler/login.dart';
import 'package:belindaproje/Sekmeler/userpage.dart';
import 'package:belindaproje/araclar/KatUrun.dart';
import 'package:belindaproje/araclar/urunler.dart';
import 'package:belindaproje/Sekmeler/kategori.dart';
import 'package:flutter/material.dart';
import '../araclar/NavFactory.dart';
import '../araclar/navigator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Homapage extends StatefulWidget {

  const Homapage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homapage> {

  @override
  Widget build(BuildContext context) {
    int _currentindex = 0 ;
    const colorizeColors = [
      Colors.indigo,
      Colors.blue,
      Colors.black38,
      Colors.blueGrey,
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 27.0,
      fontFamily: 'Smooch',
    );
    return Scaffold (
      body: SafeArea(
        child: Stack(
          children:[ Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children:[
                 Padding(
                  padding: const EdgeInsets.only(top: 18.0),

                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'BELİNDA',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        'PERFUME',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),

                    ],
                    isRepeatingAnimation: true,
                    onTap: () {

                    },
                  ),
                 ),


                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 22, top: 15,bottom: 15,right: 32 ),
                    decoration: BoxDecoration(color: const Color(0xFF706379), borderRadius: BorderRadius.circular(4) ),
                    child: Image.asset("assets/resimler/banner.png"),


                  ),
                ),

                Padding(padding: const EdgeInsets.only(top: 45) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      navfactory(text: "Kategoriler", icon: Icons.menu , widget:kategorisf(), context: context),
                      navfactory(text: "Bay", icon: Icons.people , widget: Kategoripage("BAY"), context: context),
                      navfactory(text: "Bayan", icon: Icons.people_alt_outlined , widget: BayanPage("BAYAN"), context: context),
                      navfactory(text: "Oto", icon: Icons.car_rental , widget: AracPage("ARAC"), context: context),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                //Ürünler

                const Center(
                  child: Text("ÜRÜNLER" , style: TextStyle(
                  fontWeight: FontWeight.bold , fontSize: 25, color: Color(0xFF0A1034),
                  ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      urunler("assets/resimler/genel.png", "Belinde (508) Erkek", 90 ,context ),
                      urunler("assets/resimler/oda1.png", "Belinde Oda Kokusu", 40,context ),

                ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    urunler("assets/resimler/kolonya.png", "Belinde Kolanya", 30 ,context),
                    urunler("assets/resimler/bayan.png", "Belinde (351) Bayan", 180,context ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    urunler("assets/resimler/arac.png", "Belinde Arac", 50,context),
                    urunler("assets/resimler/sprey.png", "Belinde Oda Sprey", 40 ,context ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    urunler("assets/resimler/erkek.png", "Belinde (102) Erkek", 180 ,context),
                    urunler("assets/resimler/bayan.png", "Belinde (350) Bayan", 180 ,context ),

                  ],
                ),
                const SizedBox(height: 40),
              ],

            ),
          ),
            const SizedBox(height: 40),
      Align(

        alignment: Alignment.bottomCenter,
        child:
        BottomNavigationBar(
          currentIndex: _currentindex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home ),
              label: 'homepage',
              // backgroundColor: Colors.blue,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search ),
              label: 'search',
              // backgroundColor: Colors.blue,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop ),
              label: 'shop',
              // backgroundColor: Colors.blue,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people ),
              label: 'loginpage',
              // backgroundColor: Colors.blue,

            ),
          ],
          onTap: (index){
            setState(() {
                 _currentindex = index ;
                 if (_currentindex == 3) {
                   Navigator.push (
                     context,
                     MaterialPageRoute(builder: (context) =>  userpage()),
                   );
                 }
                 if (_currentindex == 1) {
                   Navigator.push (
                     context,
                     MaterialPageRoute(builder: (context) => kategorisf()),
                   );
                 }
                 if (_currentindex == 2) {
                   Navigator.push (
                     context,
                     MaterialPageRoute(builder: (context) => Sepet()),
                   );
                 }
                 if (_currentindex == 0) {
                   Navigator.push (
                     context,
                     MaterialPageRoute(builder: (context) => const Homapage()),
                   );
                 }


            });
          },
        ),

      ),

      ],
        ),
      ),



    );
  }
}




