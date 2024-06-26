import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'addressbookVo.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    return _DetailPage();
  }
} //class

//---------------------동적인 내용 설정----------------------------
//등록
class _DetailPage extends StatefulWidget {
  const _DetailPage({super.key});

  @override
  State<_DetailPage> createState() => _DetailPageState();
}

//할일
class _DetailPageState extends State<_DetailPage> {


  //즐겨찾기 추가 삭제 바꾸기

  late bool favorite;

  late int ANo;


  Widget _buildIconWithLabel() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
        children: [
          Icon(Icons.star, color: _buildIconColor()), // 아이콘 색상 설정
          SizedBox(height: 3), // 아이콘과 라벨 사이 간격 조절
          Text(
            _buildLabel(),
            style: TextStyle(
              color: _buildLabelColor(), // 라벨 색상 설정
            ),
          ),
        ],
      ),
    );
  }

  String _buildLabel() {
    return favorite ? '즐겨찾기 삭제' : '즐겨찾기 추가';
  }

  Color _buildIconColor() {
    return favorite ? Colors.yellow : Color(0xffa0f2f2); // 상태에 따라 아이콘 색상 변경
  }

  Color _buildLabelColor() {
    return favorite ? Colors.yellow : Color(0xffa0f2f2); // 상태에 따라 라벨 색상 변경
  }


  /////////////////////여기까지 즐겨찾기

  //공통변수 -data()같은 개념
  late Future<List<AddressbookVo>> detailPageFuture;

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
        } else {
          //데이터가 있으면
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 830,
                      color: Color(0xFF0f0e36),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Container(
                            width: 450,
                            height: 350,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            decoration: BoxDecoration(
                                color: Color(0xFF161443),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Container(
                                      width: 90,
                                      height: 90,
                                      color: Colors.cyanAccent,
                                    )),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text(
                                    "${snapshot.data![0].name}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "휴대전화 ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      "${snapshot.data![0].hp}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      child: IconButton(
                                        onPressed: () {
                                          print("영상통화 버튼 누름");
                                        },
                                        icon: Icon(
                                          Icons.call_rounded,
                                          color: Color(0xFFffffff),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Color(0xffE7CA14)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      child: IconButton(
                                        onPressed: () {
                                          print("메세지 버튼 누름");
                                          showDialog(
                                              context: context,
                                              // 현재 BuildContext를 넘겨줘야 합니다.
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('제목'),
                                                );
                                              });
                                        },
                                        icon: Icon(Icons.message_rounded,
                                            color: Color(0xFFffffff)),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Color(0xffE8952F)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      child: IconButton(
                                        onPressed: () {
                                          print("영상통화 버튼 누름");
                                        },
                                        icon: Icon(Icons.video_call_rounded,
                                            color: Color(0xFFffffff)),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Color(0xffE7CA14)),
                                        ),
                                      ),
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
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [

                                Container(
                                  height: 30,
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:EdgeInsets.only(right: 20) ,
                                          child: Text(
                                            "그룹",
                                            style: TextStyle(
                                                fontSize: 17, color: Colors.white),
                                          ),
                                        ),
                                        Row(
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
                                          }
                                          ).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 25, 20, 25),
                                  padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(color: Colors.white12),
                                          bottom: BorderSide(color: Colors.white12))),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "이메일",
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                        child: Text(
                                          "${snapshot.data![0].email}",
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "메모",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                                      child: Text(
                                        "${snapshot.data![0].memo}",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 110,
              child: BottomNavigationBar(
                selectedIconTheme: IconThemeData(),
                backgroundColor: Color(0xFF0F0E36),
                selectedItemColor: Color(0xFFFFFC75),
                // 선택된 아이템의 색상
                unselectedItemColor: Color(0xFF81D1FB),
                // 선택되지 않은 아이템의 색상
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: (){

                        setState(() {
                          favorite = !favorite;
                          print("눌러어아아ㅏㅏㅏㅏㅏㅏㅏㅏ");
                          print(ANo);
                          getFavorite(ANo);
                          getPersonDetail(ANo);
                        } as VoidCallback);
                      },
                      child: _buildIconWithLabel(),
                    ),
                    label: '',
                  ),

                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/modifyform',
                            arguments: {"aNo": snapshot.data![0].aNo});
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
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print("삭제");
                                          removePerson(aNo);
                                        },
                                        child: Text(
                                          "삭제하기",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff888888)),
                                      ),
                                    ),
                                    Container(
                                      width: 500,
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "취소",
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              Color(0xff888888))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } //if
                },
              ),
            ),
          );
        } // 데이터가있으면
      },
    );
  } // 그림그리기

//상세정보 데이터 가져오기 return
  Future<List<AddressbookVo>> getPersonDetail(int aNo) async {
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
        print("wjqthr");
        print(response.data["apiData"]); // json->map 자동변경

        List<AddressbookVo> dList = [];
        for(int i = 0; i<response.data["apiData"].length; i++){
          AddressbookVo dNoByaNo = AddressbookVo.fromJson(response.data["apiData"][i]);
          print("반복중");
          print(dNoByaNo.toString());
          dList.add(dNoByaNo);
        }
        print("===여기확인하기237213");
        print(dList);

        print(response.data["apiData"][0]["favorite"]);

        favorite = response.data["apiData"][0]["favorite"];
        ANo = response.data["apiData"][0]["aNo"];

        return dList;
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  } //정보가져오기함수

  //현재 데이터 삭제
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
        Navigator.pushNamed(
          context,
          '/addresspage',
        );
        //return PersonVo.fromJson(response.data["apiData"]);
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  } //삭제함수

  // 즐겨찾기
  Future<AddressbookVo> getFavorite(int ANo) async {
    int Favorite=0;

    print("*********************즐겨찾기추가***********************");

    print(ANo);
    print(favorite);
    print("-----------------------------------------------------------");


    try {
      var dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';

      final response = await dio.put(
          'http://localhost:9099/api/hsModify',

          data: {
            'aNo' : ANo,
            'favorite': favorite,
          }
      );

      if (response.statusCode == 200) {
        print(response.data["apiData"]); // json->map 자동변경
        return AddressbookVo.fromJson(response.data["apiData"]);

      } else {
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      throw Exception('Failed to load person: $e');
    }
  }
}
