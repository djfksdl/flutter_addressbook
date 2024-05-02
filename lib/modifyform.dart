import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_addressbook/addressbookVo.dart';

class ModifyForm extends StatelessWidget {
  const ModifyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _ModifyForm(),
      ),

    );
  }
}

//---------------------동적인 내용 설정----------------------------
//등록
class _ModifyForm extends StatefulWidget {
  const _ModifyForm({super.key});

  @override
  State<_ModifyForm> createState() => _ModifyFormState();
}

//할일
class _ModifyFormState extends State<_ModifyForm> {

  //공통변수-data()같은 개념

  late Future<List<AddressbookVo>> mgListFuture;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hpController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();

  String men = "남성";


  //초기화
  @override
  void initState() {
    super.initState();
    // mgListFuture = getPersonByaNo(aNo);

  } //그림그리는곳(build)
  @override
  Widget build(BuildContext context) {
    // ModalRoute를 통해 현재 페이지에 전달된 arguments를 가져옵니다.
    late final args = ModalRoute.of(context)!.settings.arguments as Map;
    // 'aNo' 키를 사용하여 값을 추출합니다.
    late final aNo = args['aNo'];
    print("이거 확인해 이거:!!!!!");
    print(aNo);

    //aNo데이터를 서버로부터 가져오기 - 초기화에서 불러오면 안됨쓰: aNo를 인식못하니까
    mgListFuture = getPersonByaNo(aNo);

    return FutureBuilder(
      future: mgListFuture, //Future<> 함수명, 으로 받은 데이타
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('데이터를 불러오는데 실패했습니다.'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('데이터가 없습니다.'));
        } else { //데이터가 있으면 _nameController.text = snapshot.data!.name;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xFF0F0E36),
                  padding: EdgeInsets.fromLTRB(40,40,30,20),
                  child: Column(
                    children: [
                      Center(
                          child: Container(
                              width: 130,
                              height: 130,
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFF55FFAD),
                                borderRadius: BorderRadius.circular(300),
                              )
                          )
                      ),
                      Container(
                        color: Color(0xFF161443),
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                        child: TextFormField(
                          style: TextStyle(color: Color(0xFFffffff)),
                          controller: _nameController,
                          decoration: InputDecoration(
                              icon: Container(
                                width: 20,
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.person,color: Color(0xFFffffff),),
                              ),
                              // labelText:'${snapshot.data!.name}',
                              // labelStyle: TextStyle(color: Color(0xFFffffff)),
                              hintText: '${snapshot.data![0].name}',
                              hintStyle: TextStyle(color: Color(0xFFbbbbbb)),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xFF161443),
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                        child: TextFormField(
                          style: TextStyle(color: Color(0xFFffffff)),
                          controller: _hpController,
                          decoration: InputDecoration(
                              icon: Container(
                                width: 20,
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.call,color: Color(0xFFffffff),),
                              ),
                              hintText: '${snapshot.data![0].hp}',
                              hintStyle: TextStyle(color: Color(0xFFbbbbbb)),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xFF161443),
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                        child: TextFormField(
                          readOnly: true,
                          style: TextStyle(color: Color(0xFFffffff)),
                          controller: _genderController,
                          decoration: InputDecoration(
                              icon: Container(
                                width: 20,
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.wc,color: Color(0xFFffffff),),
                              ),
                              hintText: '${snapshot.data![0].gender}',
                              hintStyle: TextStyle(color: Color(0xFFbbbbbb)),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xFF161443),
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                        child: TextFormField(
                          style: TextStyle(color: Color(0xFFffffff)),
                          controller: _emailController,
                          decoration: InputDecoration(
                              icon: Container(
                                width: 20,
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.mail,color: Color(0xFFffffff),),
                              ),
                              hintText: '${snapshot.data![0].email}',
                              hintStyle: TextStyle(color: Color(0xFFbbbbbb)),
                              border: InputBorder.none
                          ),
                        ),
                      ),

                      Container(
                        height: 60,
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF161443),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.only(left:13),
                          ),
                          onPressed: (){
                            // print("클릭");
                            Navigator.pushNamed(context, '/persongroupinsert');
                          },
                          child: Row(
                            children: [
                              Container(
                                child: Icon(Icons.group,color: Color(0xFFffffff),),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Row(
                                  children: snapshot.data!.map((addressbook) {
                                    String cName = addressbook.cName ?? '';
                                    // print("공차공ㅊ라고창");
                                    // print(cName);
                                    // print("나와라");
                                    return Container(
                                      // width: 50, // 각 아이템의 폭을 지정합니다.
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(cName, style: TextStyle(
                                        color: Color(0xFFffffff)
                                      ), ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Container(
                        color: Color(0xFF161443),
                        height: 200,
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                        child: TextField(
                          style: TextStyle(color: Color(0xFFffffff)),
                          controller: _memoController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              icon: Container(
                                width: 20,
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.edit_document,color: Color(0xFFffffff),),
                              ),
                              hintText: '${snapshot.data![0].memo}',
                              hintStyle: TextStyle(color: Color(0xFFbbbbbb)),
                              border: InputBorder.none
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: BottomAppBar(
                    color: Color(0xFF0F0E36),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          height: 80,
                          margin: EdgeInsets.only(left: 15),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0F0E36)
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                  "취소",
                                  style: TextStyle(color: Color(0xFF81D1FB),fontSize: 20,fontWeight: FontWeight.bold)
                              )
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 80,
                          margin: EdgeInsets.only(left: 41),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0F0E36)
                              ),
                              onPressed: (){
                                updatemForm(aNo);
                              },
                              child: Text(
                                  "수정",
                                  style: TextStyle(color: Color(0xFF81D1FB),fontSize: 20,fontWeight: FontWeight.bold)
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } // 데이터가있으면
      },
    );



  }

  //특정 aNo의 데이터 가져오기 - 리스트
  Future<List<AddressbookVo>> getPersonByaNo(int aNo) async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성및 설정
      var dio = Dio();
      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';
      // 서버 요청
      final response = await dio.get
        ('http://localhost:9099/api/ysGetVo/${aNo}');
      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        // print(response.data); // json->map 자동변경
        List<AddressbookVo> mgList = [];
        for(int i = 0; i<response.data["apiData"].length; i++){
          AddressbookVo infoByaNo = AddressbookVo.fromJson(response.data["apiData"][i]);
          mgList.add(infoByaNo);
        }
        return mgList;

      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  }

  //수정하기
  Future<void> updatemForm(int aNo) async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성및 설정
      var dio = Dio();
      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';
      // 서버 요청
      final response = await dio.put
      (
      'http://localhost:9099/api/ysUpdate',

        data: {
          'aNo' : aNo,
          // 예시 data  map->json자동변경
          'name': _nameController.text,
          'hp': _hpController.text,
          'email': _emailController.text,
          'memo': _memoController.text
        },
      );
      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
      //접속성공 200 이면
      print(response.data["apiData"]); // json->map 자동변경
      Navigator.pushNamed(context , '/addresspage');
      // return AddressbookVo.fromJson(response.data["apiData"]);
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