import 'dart:html';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   pinned: true
          //   ,expandedHeight: 100
          //   ,flexibleSpace:
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       FlexibleSpaceBar(
          //           title:Text(
          //               "즐겨찾기"
          //           ),
          //
          //       ),
          //       IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.add,
          //           color: Color(0xFF81D1FB),
          //         ),
          //       ),
          //     ],
          // ),
          // ),

          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: SampleHeaderDelegate(
          //     widget:
          //       Column(
          //         children: [
          //           Container(
          //             alignment: Alignment.center,
          //             margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          //             child: Text("즐겨찾기",
          //               style: TextStyle(
          //                   color: Color(0xFFffffff),
          //                   fontSize: 30,
          //                   fontWeight:FontWeight.bold
          //               ),
          //             ),
          //           ),
          //           Container(
          //             alignment: Alignment.center,
          //             width: 460,
          //             child: Text("저장된 연락처 38개",
          //               style: TextStyle(
          //                   color: Color(0xFFffffff),
          //                   fontSize: 20
          //               ),
          //             ),
          //           ),
          //         ],
          //       )
          //   ),
          // ),
          SliverAppBar(
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final bool isExpanded = constraints.maxHeight > 100;
                return FlexibleSpaceBar(
                  title: isExpanded
                      ? Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "즐겨찾기",
                            style: TextStyle(
                              color: Color(0xFFffffff),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "저장된 연락처 38개",
                            style: TextStyle(
                              color: Color(0xFFffffff),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                  : Row(
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
                  background: Container(
                      color: Color(0xFF0F0E36)
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(30),
              color: Color(0xFF0F0E36),
              child: Column(
                children: [
                  // Container(
                  //   alignment: Alignment.center,
                  //   margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  //   child: Text("즐겨찾기",
                  //     style: TextStyle(
                  //         color: Color(0xFFffffff),
                  //         fontSize: 30,
                  //         fontWeight:FontWeight.bold
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: 460,
                  //   child: Text("저장된 연락처 38개",
                  //     style: TextStyle(
                  //         color: Color(0xFFffffff),
                  //         fontSize: 20
                  //     ),
                  //   ),
                  // ),
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
                      width: 430,
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
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF0F0E36),
          selectedItemColor: Color(0xFFFFFC75), // 선택된 아이템의 색상
          unselectedItemColor: Color(0xFF81D1FB), // 선택되지 않은 아이템의 색상
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: '즐겨찾기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '연락처',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '그룹',
            ),
          ],
          // selectedItemColor: Colors.amber[800],
          // onTap: _onItemTapped,
        ),
      ),
    );
  }
}

// class SampleHeaderDelegate extends SliverPersistentHeaderDelegate {
//   SampleHeaderDelegate({required this.widget});
//
//   Widget widget;
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return widget;
//   }
//
//   @override
//   double get maxExtent => 50;
//
//   @override
//   double get minExtent => 50;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }