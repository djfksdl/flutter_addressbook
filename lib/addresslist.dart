import 'dart:html';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'addressbookVo.dart';




class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {

    _AddressListState _addressListState = _AddressListState();
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
                                "연락처",
                                style: TextStyle(
                                  color: Color(0xFFffffff),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: FutureBuilder<List<AddressbookVo>>(
                                future: _addressListState.getAddressList(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text(
                                            '데이터를 불러오는 데 실패했습니다.'));
                                  } else if (!snapshot.hasData ||
                                      snapshot.data!.isEmpty) {
                                    return Center(
                                        child: Text('데이터가 없습니다.'));
                                  } else {
                                    return Text(
                                      "저장된 연락처 ${snapshot.data!.length}개",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    );
                                  }
                                },
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
                                  Text("연락처"),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/personinsertform");
                                    },
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
                      IconButton(onPressed: (){
                        Navigator.pushNamed(context, '/personinsertform');
                      },
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
                      child: _AddressList()
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
class _AddressList extends StatefulWidget {
  const _AddressList({super.key});

  @override
  State<_AddressList> createState() => _AddressListState();
}

//할일
class _AddressListState extends State<_AddressList> {

  //공통변수 -data()같은 개념
  late Future<List<AddressbookVo>> addressListFuture;

  //초기화
  @override
  void initState() {
    super.initState();

    print("----initState-----");
  }

  //그림그리는곳(build)
  @override
  Widget build(BuildContext context) {
    print("----build-----");
    setState(() {
      print("----setState-----");
      addressListFuture = getAddressList();
    });

    return FutureBuilder(
      future: addressListFuture, //Future<> 함수명, 으로 받은 데이타
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('데이터를 불러오는 데 실패했습니다.'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('데이터가 없습니다.'));
        } else { //데이터가 있으면
          print("----FutureBuilder-----");
          return ListView.builder(

            itemExtent: 90, //충돌안나게 아이템 높이 설정 -> {}뒤에 shrinkWrap:true도 설정해야함
            itemCount: snapshot.data!.length, //몇개 가지고있는지 꼭 알려줘야함.
            itemBuilder: (BuildContext context, int index) {
              return Column(
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
                        Navigator.pushNamed(context, '/detailpage',
                            arguments: {
                              "aNo": snapshot.data![index].aNo
                            }
                        );
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
                            child: Text("${snapshot.data![index].name}", style: TextStyle(
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
              );
            }
            ,shrinkWrap: true, // ListView의 높이를 자식 위젯에 맞게 조절
          );
        } // 데이터가있으면
      },
    );
  }

//리스트 데이터 가져오기 return
  Future<List<AddressbookVo>> getAddressList() async {

    print("getAddressList(): 데이터 가져오기");
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      // 서버 요청
      final response = await dio.get(
        'http://localhost:9099/api/hsaddresslist',
      );

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data); // json->map 자동변경

        List<AddressbookVo> addressList =[];

        for(int i=0; i<response.data["apiData"].length; i++){
          AddressbookVo addressVo = AddressbookVo.fromJson(response.data["apiData"][i]);
          print(addressVo);
          addressList.add(addressVo);
          print("===");
        }

        return addressList;
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
