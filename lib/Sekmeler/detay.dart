import 'package:belindaproje/Sekmeler/deneme.dart';
import 'package:belindaproje/service/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../araclar/baslik.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Detail extends StatefulWidget {
  String urunAdi;
  String urunResmi;
  String unufiyat;
  Detail(this.urunAdi, this.urunResmi, this.unufiyat, {Key? key})
      : super(key: key);
  @override
  State<Detail> createState() => _DetailState();
}
class _DetailState extends State<Detail> {
  final List<ModelAdapter> model = [];
  int SeciliAdet = 1;
  @override
  Widget build(BuildContext context) {
    int fiyat = SeciliAdet * int.parse(widget.unufiyat);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasLik(widget.urunAdi, context),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 22, top: 15, bottom: 15, right: 32),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Image.asset(widget.urunResmi),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                        height: 22,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                          onPressed: () {
                            setState(() {
                              if (SeciliAdet > 0) {
                                SeciliAdet--;
                              }
                            });
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          SeciliAdet.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 22,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                          onPressed: () {
                            setState(() {
                              SeciliAdet++;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Row(
                        children: [
                          Text(
                            "Toplam Fiyat:",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            fiyat.toString(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                        height: 20,
                      ),
                      Text(
                        " Urun Fiyat:",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        widget.unufiyat.toString() + "L",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 58,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.blue)),
                          child: IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              try {
                                insert(
                                    widget.urunAdi.toString(),
                                    widget.urunResmi.toString(),
                                    fiyat,
                                    SeciliAdet);
                              } catch (e) {
                                print(e);
                              }
                              Navigator.push (
                                context,
                                MaterialPageRoute(builder: (context) => Sepet()),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 20,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white10.withOpacity(0.8),
                                )
                              ]
                            ),
                            child: Center(child: Text("SEPETE EKLE" , style:TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> insert(@required String name, @required String resimadres,
    @required int fiyat, @required int adet) async {
  ModelAdapter newModel =
      ModelAdapter(Uuid().v1(), name, resimadres, fiyat, adet);
  Box<ModelAdapter> hive = Hive.box<ModelAdapter>('model');
  hive.put(newModel.id, newModel);
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
          " ");
    },
  );

  return _all;
}

