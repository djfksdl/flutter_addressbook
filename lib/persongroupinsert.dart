import 'dart:async';
import 'package:flutter/material.dart';
import 'addressbookVo.dart';
import 'package:dio/dio.dart';

class PersonGroupInsert extends StatelessWidget {
  const PersonGroupInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0E36),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F0E36),
        title: Text(
          "그룹선택",
          style: TextStyle(fontSize: 18, color: Color(0xFF81D1FB)),
        ),
        leading: null
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 60, 40, 20),
          child: _PersonGroupInsert()

        ),
      ),
    );
  }
}

class _PersonGroupInsert extends StatefulWidget {
  const _PersonGroupInsert({super.key});

  @override
  State<_PersonGroupInsert> createState() => _PersonGroupInsertState();
}

class _PersonGroupInsertState extends State<_PersonGroupInsert> {

  //late List<bool> _isCheckedList;


  //변수
  late Future<List<AddressbookVo>> groupListFuture;
  late List<dynamic> _choiceGNoList =[];
  late List<int> _lastchoicegNoList = [];

  @override
  void initState() {
    super.initState();
    groupListFuture = getPersonGroupList();

  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
        future: groupListFuture, //Future<> 함수명, 으로 받은 데이타
        builder: (context, snapshot)
    {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('데이터를 불러오는 데 실패했습니다.'));
      } else if (!snapshot.hasData) {
        return Center(child: Text('데이터가 없습니다.'));
      } else { //데이터가 있으면
        return Column(
          children: [
            Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF161443),
                    borderRadius: BorderRadius.circular(20)),
                  child:ListView.builder(
                    itemExtent: 50,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {



                      //그룹갯수만큼 false로 초기세팅
                      return Column(
                            children: [
                              Container(
                                width: 370,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFF161443),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFF222457), // 테두리 색상
                                      width: 2, // 테두리 두께
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        checkColor: Color(0xFFffffff),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        side: BorderSide(
                                          color: Color(0xFFDB5C5C),
                                          width: 2,
                                        ),
                                        value: _choiceGNoList[index]["tf"],
                                        onChanged: (value) {
                                          //print(value);
                                          setState(() { //누르면 true로 변경
                                            if (index == 0 && value == true) {
                                              // 0번째 요소가 true인 경우에만 실행
                                              for (int i = 1; i < _choiceGNoList.length; i++) {
                                                // 나머지 요소들을 false로 변경
                                                _choiceGNoList[i]["tf"] = false;
                                              }
                                            }else if(index > 0 && value == true){
                                              _choiceGNoList[0]["tf"] = false;
                                            }
                                            _choiceGNoList[index]["tf"] = value ?? false;

                                            //print([index]);
                                          });
                                        }),
                                    Text("${_choiceGNoList[index]["gName"]}",
                                        style: TextStyle(color: Color(0xFFffffff)))
                                  ],
                                ),
                              ),


                            ],
                          );
                    },
                    shrinkWrap: true,
                  )
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(

                onPressed: (){
                  //print(_choiceGNoList);
                  for(int i = 0; i < _choiceGNoList.length; i++){
                    if(_choiceGNoList[i]["tf"] == true){


                      _lastchoicegNoList.add(_choiceGNoList[i]["gNo"]);
                    }
                  }
                  print(_lastchoicegNoList);

                  Navigator.pop(context, _lastchoicegNoList);
                  //Navigator.of(context).pop(_lastchoicegNoList);
                },
                child: Text("선택완료")),
            )
          ],
        );
      }
    },
    );
  }

  Future<List<AddressbookVo>> getPersonGroupList() async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      // 서버 요청
      final response = await dio.get(
        'http://localhost:9099/api/jh',
        /*
        queryParameters: {
          // 예시 파라미터
          'page': 1,
          'keyword': '홍길동',
        },
        data: {
          // 예시 data  map->json자동변경
          'id': 'aaa',
          'pw': '값',
        },
        */
      );

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data["apiData"]);
        print(response.data["apiData"][1]["cName"]); // json->map 자동변경

        List<AddressbookVo> persongroupList = [];
        for(int i=0;i<response.data["apiData"].length;i++){
          AddressbookVo addressbookVo = AddressbookVo.fromJson(response.data["apiData"][i]);
          persongroupList.add(addressbookVo);
        }
        print("sssss");
        print(persongroupList);


        List<dynamic> choiceGNoList = [];


        for(int i=0; i<persongroupList.length; i++){
          var vo = {
            "tf": false,
            "gNo": persongroupList[i].cNo,
            "gName":persongroupList[i].cName
          };
          choiceGNoList.add(vo);

        }

        _choiceGNoList = choiceGNoList;

        return persongroupList;
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  }



/*

  //저장하기
  Future<void> insertPersonGroup() async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      List<AddressbookVo> AddressbookList = [];
      List<int> checkedCNoList = [];
      for (int i = 0; i < _isCheckedList.length; i++){
        for(int z =0; z < AddressbookList.length; z++) {
          if (_isCheckedList[i] == true && i==z) {
            checkedCNoList.add(AddressbookList[i].cNo);
          }
        }
      }

      // 서버 요청
      final response = await dio.post(
        'http://localhost:9099/api/jh/persongroupinsert',

        data: {
          // 예시 data  map->json자동변경
          'aNo': 0,
          'cNo': checkedCNoList,
        },

      );

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data); // json->map 자동변경


        Navigator.pushNamed( context, "/list");
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  }
*/


/*
List<int> selectCheckGroup() {
  List<AddressbookVo> AddressbookList = [];
  List<int> checkedCNoList = [];
  for (int i = 0; i < _isCheckedList.length; i++){
    if (_isCheckedList[i] == true) {

      _choiceGNoList.add(persongroupList[i]);
    }



    for(int z =0; z < AddressbookList.length; z++) {
      if (_isCheckedList[i] == true && i==z) {
        checkedCNoList.add(AddressbookList[i].cNo);
      }
    }
  }
  print(checkedCNoList);
  return checkedCNoList;
}//
*/


}
