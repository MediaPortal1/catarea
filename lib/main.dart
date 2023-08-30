import 'package:catarea/domain/cats/entity/cat_fact.dart';
import 'package:catarea/presentation/history/history_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/storage/client/storage_client.dart';
import 'presentation/main/main_page.dart';

void main() async{
  runApp(const CatsApp());
  await Hive.initFlutter();
  Hive.registerAdapter(CatFactAdapter());
  HiveStorageClient().initBox();
}

class CatsApp extends StatelessWidget {
  const CatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MainPage(),
        ROUTE_HISTORY: (context) => const CatFactsHistoryPage(),
      },
      title: 'Cats Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent, outline: Colors.white60),
        useMaterial3: true,
      ),
    );
  }
}
