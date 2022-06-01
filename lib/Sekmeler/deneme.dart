
import 'package:belindaproje/Sekmeler/Satinal.dart';
import 'package:belindaproje/Sekmeler/userpage.dart';
import 'package:belindaproje/service/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'homepage.dart';
import 'kategori.dart';

class Sepet extends StatefulWidget {
  const Sepet({Key? key}) : super(key: key);

  @override
  State<Sepet> createState() => _Sepet();
}

class _Sepet extends State<Sepet> {
  final List<ModelAdapter> model = [];
  int _currentindex = 0 ;
  String urunresmi ="assets/resimler/arac.png";
  String urunadi ="";
  int urunfiyat = 1 ;
  int urunAdet = 1 ;


  @override
  Widget build(BuildContext context) {
    Box<ModelAdapter> hive = Hive.box<ModelAdapter>('model');

    return Scaffold(
      appBar: AppBar(title: Text("Sepet"),),
          body: SafeArea(
                  child: Stack(
                    children:[
                      WatchBoxBuilder(
                        box: hive,
                        builder: (context, box) {
                          Map<dynamic, dynamic> raw = box.toMap();
                          List list = raw.values.toList();

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              ModelAdapter personModel = list[index];
                              return sepeturun(personModel.resimadres, personModel.name, personModel.adet, personModel.fiyat);
                              //   ListTile(
                              //   title: Text(personModel.name),
                              //   leading: Text(personModel.id.toString()),
                              //   subtitle: Text(
                              //       personModel.resimadres.toString().toString()),
                              // );
                            },
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          child: IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            iconSize: 50,
                            color: Colors.green,
                            onPressed: (){
                              Navigator.push (
                                context,
                                MaterialPageRoute(builder: (context) => Satinal(),),
                              );
                            },
                          ),
                        ),
                      ),

                       SizedBox(height: 30),
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
                              _currentindex = index;
                              if (_currentindex == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      userpage()),
                                );
                              }
                              if (_currentindex == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      kategorisf()),
                                );
                              }
                              if (_currentindex == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      Sepet()),
                                );
                              }
                              if (_currentindex == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      Homapage()),
                                );
                              }
                            }
                            );
                          },
                        ),

                      ),

                    ],

                  ),
          ),
    );
  }
}

Future<List<ModelAdapter>> getAllModelAdapter() async {
  Box<ModelAdapter> hive = Hive.box<ModelAdapter>('model');
  List<ModelAdapter> _all = hive.values.toList();
  // hive.delete(_all[0].id);
  _all.forEach(
        (element) {


      print(element.name +
          " " +
          element.id +
          "  " +
          element.adet.toString() +
          " " +
          element.resimadres +
          ""+
          element.fiyat.toString()
      );
    },
  );

  return _all;
}

Widget sepeturun (String urunresmi , String urunadi , int adet , int fiyat){
  Box<ModelAdapter> hive = Hive.box<ModelAdapter>('model');
 return
  GestureDetector(
    onDoubleTap: (){
        print("2 kere bastı");
    },
    onLongPress: (){
      final List<ModelAdapter> _all = hive.values.toList();
      int lastIndex = hive.toMap().length - 1;
      if (lastIndex >= 0) hive.deleteAt(lastIndex);


    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 100,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Image.asset(urunresmi),

                ),
              ),
            ),

            Text(urunadi.toString() , style: TextStyle(fontSize: 15,color: Colors.black),

            ),

            SizedBox(width: 10,),
            Text("Adet:",style: TextStyle(fontSize: 15,color: Colors.black),),
            Text(adet.toString() ,style: TextStyle(fontSize: 15,color: Colors.black),),
            SizedBox(width: 20,),

            Text("Fiyat:" ,style: TextStyle(fontSize: 15,color: Colors.black),),
            Text(fiyat.toString() ,style: TextStyle(fontSize: 15,color: Colors.black),),
          ],
        ),
      ],
    ),
  );
}

