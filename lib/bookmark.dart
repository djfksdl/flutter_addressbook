import 'dart:html';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';




class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          Container(
            child: SliverAppBar(
              // centerTitle: true,
              pinned: true,
              expandedHeight: 150,
              automaticallyImplyLeading: false,
              leading: null,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final bool isExpanded = constraints.maxHeight > 80;
                  return
                    Container(
                      color: Color(0xFF0F0E36),
                      constraints: BoxConstraints.expand(),
                      child: FlexibleSpaceBar(
                        centerTitle: true,
                        titlePadding: EdgeInsets.fromLTRB(0,10,0,10),
                        title: isExpanded
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Color(0xFF0F0E36),
                                  margin: EdgeInsets.fromLTRB(0, 70, 0, 10) ,
                                  child: Text(
                                    "즐겨찾기",
                                    style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "저장된 연락처 38개",
                                    style: TextStyle(
                                      // color: Color(0xFFffffff),
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            )
                      : Expanded(

                          child: Container(



                          color: Color(0xff0F0E36),
                          child:
                          Container(
                            color:Color(0xFF0F0E36) ,
                            // padding: EdgeInsets.zero,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0) ,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("즐겨찾기"),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Color(0xFF81D1FB),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      background: Container(
                        color: Color(0xFF0F0E36),


                      ),
                                      ),
                    );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(30),
              color: Color(0xFF0F0E36),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("ㄱ",
                          style: TextStyle(
                              color: Color(0xFF5158F0),
                              fontSize: 20
                          ),),
                      ),
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.add,
                            color: Color(0xFF81D1FB),)
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF161443),
                      ),
                      // width: 430,
                      // height: 550,

                      child: Column(

                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(

                              children: [

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E),
                                        width: 1.0
                                    )
                                )
                            ),
                            margin: EdgeInsets.only(bottom: 20) ,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70) ,
                                  child: Image.asset(
                                    'assets/images/girl.png',
                                    width: 50,
                                    height: 50,

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("강나연", style: TextStyle(
                                      color: Color(0xFFffffff),
                                      fontSize: 20
                                  ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )

                  )

                ],

              ),
            ),
          )

        ],

      ),
    );
  }
}

