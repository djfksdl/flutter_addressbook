import 'package:flutter/material.dart';
import 'bookmark.dart';
import 'category.dart';
import 'grouplist.dart';
import 'app.dart';
import 'persongroupinsert.dart';
import 'personinsert.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/bookmartlist",
      routes:{
        '/':(context) => App(),
        '/category':(context) => CategoryPage(),
        '/grouplist':(context) => GroupListPage(),
        '/bookmarklist':(context)=> BookmarkPage(),
        '/persongroupinsert':(context)=> PersonGroupInsert(),
        '/personinsertform':(context)=> PersonInsertForm(),
      }
    );
  }
}
