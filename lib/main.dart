import 'package:flutter/material.dart';

import 'addresslist.dart';
import 'app.dart';
import 'bookmark.dart';
import 'category.dart';
import 'detailPage.dart';
import 'groupeditform.dart';
import 'grouplist.dart';
import 'modifyform.dart';
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
      initialRoute: '/',
      routes:{
        '/':(context) => App(),
        '/category':(context) => CategoryPage(),
        '/grouplist':(context) => GroupListPage(),
        '/bookmarklist':(context)=> BookmarkPage(),
        '/persongroupinsert':(context)=> PersonGroupInsert(),
        '/personinsertform':(context)=> PersonInsertForm(),
        '/groupeditform':(context) => groupEditForm(),
        '/detailpage':(context) => DetailPage(),
        '/addresspage':(context) => AddressPage(),
        '/modifyform':(context) => ModifyForm(),

      }
    );
  }
}
