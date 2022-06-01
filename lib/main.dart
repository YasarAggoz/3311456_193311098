import 'package:belindaproje/Sekmeler/main_Page.dart';
import 'package:belindaproje/service/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> hiveLoading() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdapterAdapter());
  await Hive.openBox<ModelAdapter>('model');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  hiveLoading();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: main_page(),
    );
  }
}
