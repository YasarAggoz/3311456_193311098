import 'package:hive/hive.dart';
import 'package:belindaproje/service/model.dart';


class Boxes{
  static Box<ModelAdapter> getModeladapter() =>
      Hive.box<ModelAdapter>('ModelAdapter');
}
