import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_one/pages/create_card_page.dart';
import 'package:new_one/pages/card_list_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("Banking App");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardList(),
      routes: {
        CardList.id: (context) => CardList(),
        CreateCardPage.id: (context) => CreateCardPage(),
      },
    );
  }
}
