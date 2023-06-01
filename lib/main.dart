import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odev/screens/home.dart';
import 'screens/counter.dart';
import 'screens/nalan.dart';
import 'screens/toplama.dart';
import 'screens/calc.dart';
import 'screens/counterplus.dart';
import 'screens/todolist_db.dart';
import 'screens/ortalamatik.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoList',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/todolistdb": (context) => const TodoListMysql(),
        "/ortalamatik": (context) => const Ortalamatik(),
        "/calc": (context) => const Calculator(),
        "/nalan": (context) => const Nalan(),
        "/counter": (context) => const Counter(),
        "/counterplus": (context) => const CounterPlus(),
        "/toplama": (context) => const Toplama(),
      },
      // home: const TodoListMysql(),
    );
  }
}
