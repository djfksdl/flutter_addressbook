import 'dart:html';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';




class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0E36),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("ㄱ",
                          style: TextStyle(
                              color: Color(0xFF5158F0),
                              fontSize: 20
                          ),),
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/detailpage');
                              },
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

//---------------------동적인 내용 설정----------------------------
//등록
class _BookmarkList extends StatefulWidget {
  const _BookmarkList({super.key});

  @override
  State<_BookmarkList> createState() => _BookmarkListState();
}

//할일
class _BookmarkListState extends State<_BookmarkList> {

  //초기화
  @override
  void initState() {
    super.initState();

  }

  //그림그리는곳(build)
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  //리스트 가져오기
  Future<void> getBookmarkList() async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();
      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';
      // 서버 요청
      final response = await dio.put(
        'http://13.125.251.10:9099/api/ysGetList',
      );
      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data); // json->map 자동변경
        // return PersonVo.fromJson(response.data["apiData"]);
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  }


}


