import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'addressbookVo.dart';

class groupEditForm extends StatelessWidget {
  const groupEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f0e36),
      body: _groupEditForm(),
      // bottomNavigationBar: Container(
      //   child: Row(
      //     children: [
      //       Expanded(
      //         flex: 1,
      //         child: Container(
      //           width: 160,
      //           height: 80,
      //           padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      //           child: TextButton(
      //             onPressed: () {
      //               print("취소 버튼 클릭");
      //               Navigator.of(context).pop();
      //             },
      //             child: Text(
      //               "취소",
      //               style: TextStyle(color: Color(0xff81d1fb),
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold),
      //
      //             ),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         flex: 1,
      //         child: Container(
      //           width: 160,
      //           height: 80,
      //           padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      //           child: TextButton(
      //             onPressed: () {
      //               print("수정 버튼 클릭");
      //               putCategoryByNo(int cNo);
      //               Navigator.of(context).pop();
      //             },
      //             child: Text(
      //               "수정",
      //               style: TextStyle(color: Color(0xff81d1fb),
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

//등록
class _groupEditForm extends StatefulWidget {
  const _groupEditForm({super.key});

  @override
  State<_groupEditForm> createState() => _groupEditFormState();
}

//할 일
class _groupEditFormState extends State<_groupEditForm> {
  final TextEditingController _groupNameController = TextEditingController();

  late Future<AddressbookVo> voFuture;

  //초기화
  @override
  void initState() {
    super.initState();
  }

  //화면 그리기
  @override
  Widget build(BuildContext context) {
    //ModalRoute를 통해 현재 페이지에 전달된 arguments 가져오기
    //late final args=ModalRoute.of(context)!.settings.arguments as Map;

    //cNo를 사용하여 값 추출하기
    //cNo=args["cNo"];

    int cNo = 1;
    //cNo의 데이터를 서버로부터 가져오는 함수 실행
    voFuture = getCategoryByNo(cNo);

    return FutureBuilder(
        future: voFuture, //Future<> 함수명, 으로 받은 데이타
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('데이터를 불러오는 데 실패했습니다.'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('데이터가 없습니다.'));
          } else {
            //데이터가 있으면

            return Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [

                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                      child: Text(
                        "그룹 수정",
                        style: TextStyle(
                            color: Color(0xff81d1fb),
                            fontSize: 23
                        ),
                      )
                  ),

                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff161443),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Row(
                      children: [

                        Container(
                            margin: EdgeInsets.fromLTRB(17, 0, 0, 10),
                            child: Icon(
                              Icons.group,
                              size: 45,
                              color: Colors.white,
                            )
                        ),
                        Column(
                          children: [

                            Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 185, 0),
                              child: Text("${snapshot.data!.cName}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xfffffc75)
                                ),
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 35,
                              margin: EdgeInsets.fromLTRB(25, 5, 0, 10),
                              child: TextFormField(
                                controller: _groupNameController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "새로운 그룹 이름을 입력해 주세요",
                                  hintStyle: TextStyle(
                                    color: Color(0xff545151),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),

                  ),





                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 160,
                            height: 80,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: TextButton(
                              onPressed: () {
                                print("취소 버튼 클릭");
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "취소",
                                style: TextStyle(color: Color(0xff81d1fb),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),

                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 160,
                            height: 80,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: TextButton(
                              onPressed: () {
                                print("수정 버튼 클릭");
                                putCategoryByNo(cNo);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "수정",
                                style: TextStyle(color: Color(0xff81d1fb),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),





                ],
              ),

            );

          } //데이터가 있으면
        } //FutureBuilder - builder
    );

  } //화면 그리기

  //그룹 데이터 1개 받아오기
  Future<AddressbookVo> getCategoryByNo(int cNo) async {
    print("-------==");
    print(cNo);
    print("-------==");
    print("getCategoryByNo(): 데이터 가져오기 중");

    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      print("------------------서버 요청 전----------------");

      // 서버 요청
      final response = await dio.get(
        'http://localhost:9099/api/dsGroupedit/${cNo}',
      );

      print("------------------서버 요청 후----------------");

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data); // json->map 자동변경
        print("--------------------------");

        //서버로 부터 받은 값을 personVo로 변환
        AddressbookVo aVo = AddressbookVo.fromJson(response.data["apiData"]);
        print("---------ggg------------------");
        print(aVo);

        //받은값을 input의 변화를 감지하는 변수에 전달
        //value값은 _nameController.text = 값 으로 넣는다
        //_groupNameController.text = aVo.cName!; - !!!!!!!!!!!!!!!
        print("---------ggg------------------");
        return aVo;

      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  } //getCategoryByNo - 그룹 데이터 1개 받아오기

  //수정한 데이터 보내기
  Future<void> putCategoryByNo(int cNo) async {
    print("start");

    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      print("wara wara wara wara wara wara wara wara wara wara ");

      // 서버 요청
      final response = await dio.put(
        'http://localhost:9099/api/dsGroupedit/${cNo}',

        data: {
          // 예시 data  map->json자동변경
          'cName': _groupNameController.text
        },
      );

      print("plz plz plz plz plz plz plz plz");

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print("------------------응답 처리------------------");
        print(response.data); // json->map 자동변경
        print("------------------응답 처리------------------");

        Navigator.pushNamed(context, "/grouplist");
        print("해냈다");
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  } //putCategoryByNo - 수정한 데이터 보내기

} //_groupEditFormState