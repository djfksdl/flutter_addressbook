import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'addressbookVo.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F0E36),

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF81D1FB),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로가기 버튼 클릭 시 이전 화면으로 이동
          },
        ),
      ),
      body: Container(
        color: Color(0xFF0f0e36),
        padding: EdgeInsets.all(30),
        child: _DetailPage()
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          selectedIconTheme: IconThemeData(),
          backgroundColor: Color(0xFF0F0E36),
          selectedItemColor: Color(0xFFFFFC75),
          // 선택된 아이템의 색상
          unselectedItemColor: Color(0xFF81D1FB),
          // 선택되지 않은 아이템의 색상
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: '즐겨찾기 추가',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/modifyform');
                },
                child: Icon(Icons.edit),
              ),
              label: '수정',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              label: '삭제',
            ),
          ],
          // selectedItemColor: Colors.amber[800],
          onTap: (index) {
            if (index == 2) {
              showDialog(
                  context: context, // 현재 BuildContext를 넘겨줘야 합니다.
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 600, 0, 0),
                      child: AlertDialog(
                        backgroundColor: Color(0xff0f0e36),
                        content: Container(
                          width: 600,
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                width: 500,
                                height: 40,
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 12),
                                child:
                                  ElevatedButton(
                                    onPressed: (){
                                      print("삭제");
                                      //removePerson(aNo);
                                    },
                                    child: Text("삭제하기", style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Color(
                                    0xff888888)),),
                              ),
                              Container(
                                width: 500,
                                height: 40,
                                child:
                                  ElevatedButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                    },
                                      child:
                                        Text("취소", style: TextStyle(color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Color(
                                    0xff888888))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            } //if
          },
        ),
      ),
    );
  }
}//class


//---------------------동적인 내용 설정----------------------------
//등록
class _DetailPage extends StatefulWidget {
  const _DetailPage({super.key});

  @override
  State<_DetailPage> createState() => _DetailPageState();
}

//할일
class _DetailPageState extends State<_DetailPage> {

  //공통변수 -data()같은 개념
  late Future<AddressbookVo> detailPageFuture;

  //초기화
  @override
  void initState() {
    super.initState();
    //detailPageFuture = getPersonDetail(aNo);
  }

  //그림그리는곳(build)
  @override
  Widget build(BuildContext context) {
    // ModalRoute를 통해 현재 페이지에 전달된 arguments를 가져옵니다.
    late final args = ModalRoute.of(context)!.settings.arguments as Map;
    // 'aNo' 키를 사용하여 값을 추출합니다.
    late final aNo = args['aNo'];

    //aNo 데이터를 서버로 부터 가져오기
    detailPageFuture = getPersonDetail(aNo);

    return FutureBuilder(
      future: detailPageFuture, //Future<> 함수명, 으로 받은 데이타
      builder: (context, snapshot) {
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
                    width: 450,
                    height: 350,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: BoxDecoration(
                        color: Color(0xFF161443),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Container(
                              width: 90,
                              height: 90,
                              color: Colors.cyanAccent,
                            )
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text("${snapshot.data!.name}",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),

                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("휴대전화 ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),),
                            Text("${snapshot.data!.hp}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: IconButton(onPressed: () {
                                print("영상통화 버튼 누름");
                              }, icon: Icon(Icons.call_rounded, color: Color(
                                  0xFFffffff),),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(
                                      0xffE7CA14)),
                                ),),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: IconButton(onPressed: () {
                                print("메세지 버튼 누름");
                                showDialog(
                                    context: context, // 현재 BuildContext를 넘겨줘야 합니다.
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('제목'),
                                      );
                                    }
                                );
                              }, icon: Icon(Icons.message_rounded, color: Color(
                                  0xFFffffff)),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(
                                      0xffE8952F)),
                                ),),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: IconButton(onPressed: () {
                                print("영상통화 버튼 누름");
                              }, icon: Icon(Icons.video_call_rounded, color: Color(
                                  0xFFffffff)),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(
                                      0xffE7CA14)),
                                ),),
                            )
                          ],
                        )
                      ],
                    ),

                  ),
                  Container(
                    width: 450,
                    height: 250,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                    decoration: BoxDecoration(
                        color: Color(0xFF161443),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text("그룹", style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white
                              ),),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                              child: Text("친구", style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 25, 20, 25),
                          padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                          decoration: BoxDecoration(border: Border(
                              top: BorderSide(color: Colors.white12),
                              bottom: BorderSide(color: Colors.white12))),
                          child: Row(
                            children: [
                              Container(
                                child: Text("이메일", style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white
                                ),),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                child: Text("${snapshot.data!.email}", style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white
                                ),),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Container(
                              child: Text("메모", style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white
                              ),),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                              child: Text("${snapshot.data!.memo}", style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
        } // 데이터가있으면
      },
    );
  }// 그림그리기

//상세정보 데이터 가져오기 return
  Future<AddressbookVo> getPersonDetail(int aNo) async {
    print("getPersonDetail(): 상세정보 가져오기");
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      // 서버 요청
      final response = await dio.get(
        'http://localhost:9099/api/hsdetail/${aNo}',
      );

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        //print(response.data); // json->map 자동변경
        AddressbookVo detailVo = AddressbookVo.fromJson(response.data["apiData"]);

        print("===");

        return detailVo;
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  }//정보가져오기함수

  //현재 데이타 삭제
  Future<void> removePerson(int aNo) async {

    print(aNo);
    print("removePerson(): 삭제 중");
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      // 서버 요청
      final response = await dio.delete(
        'http://localhost:9099/api/hsdelete/${aNo}',
      );

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data); // json->map 자동변경
        Navigator.pushNamed( context, '/addresspage', );
        //return PersonVo.fromJson(response.data["apiData"]);

      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  }//삭제함수


}