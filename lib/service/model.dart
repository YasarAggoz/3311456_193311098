import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class ModelAdapter extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String resimadres;
  @HiveField(3)
  int fiyat;
  @HiveField(4)
  int adet;

  ModelAdapter(this.id, this.name, this.resimadres, this.fiyat, this.adet);
  factory ModelAdapter.olustur(
      {required String name,
      required String resimAdres,
      required int fiyat,
      required int adet}) {
    return ModelAdapter(const Uuid().v1(), name, resimAdres, fiyat, adet);
  }
}
