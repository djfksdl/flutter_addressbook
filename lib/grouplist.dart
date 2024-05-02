import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addressbook/addressbookVo.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0E36), // 전체 배경색 설정
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
        child: _GroupListPage(),
      ),
    );
  }
}

// 상태 변화를 감시하게 등록시키는 클래스
class _GroupListPage extends StatefulWidget {
  const _GroupListPage({Key? key}) : super(key: key);

  @override
  State<_GroupListPage> createState() => _GroupListPageState();
}

// 할일 정의 클래스(통신, 데이터 적용)
class _GroupListPageState extends State<_GroupListPage> {
  // 변수 (미래의 데이터가 담김)
  late Future<List<AddressbookVo>> addressbookVoFuture;
  late String cName="";

  // 초기화 함수 (1번만 실행됨)
  @override
  void initState() {
    super.initState();
  }

  // 화면 그리기
  @override
  Widget build(BuildContext context) {
    // 라우터로 전달받은 cNo
    late final args = ModalRoute.of(context)!.settings.arguments as Map;



    // 'cNo'키를 사용하여 값을 추출
    final cNo = args['cNo'];



    // 필요시 추가 코드  //데이터 불러오기 메소드 호출
    addressbookVoFuture = getCategoryByNo(cNo);

    print("-------------------------------------");
    print(cNo);
    print("-------------------------------------");
    print("build()그리기 작업");

    return FutureBuilder(
      future: addressbookVoFuture, // Future<> 함수명, 으로 받은 데이타
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('데이터를 불러오는 데 실패했습니다.'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('데이터가 없습니다.'));
        } else {
          return Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    "${cName}",
                    style: TextStyle(
                      color: Color(0xFFffffff),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 460,
                  child: Text(
                    "지정된 연락처 ${snapshot.data!.length}개",
                    style: TextStyle(
                      color: Color(0xFFffffff),
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "ㄱ",
                        style: TextStyle(
                          color: Color(0xFF5158F0),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print("그룹편집버튼클릭");
                        Navigator.pushNamed(
                          context,
                          '/groupeditform',
                           arguments: {"cNo": cNo}
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Color(0xFF81D1FB),
                      ),
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
                  child: ListView.builder(
                    itemExtent: 90,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF26295E),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(bottom: 20),
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
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.asset(
                                      'assets/images/girl.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      "${snapshot.data![index].name}",
                                      style: TextStyle(
                                        color: Color(0xFFffffff),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  //3번(정우성) 데이터 가져오기
  Future<List<AddressbookVo>> getCategoryByNo(int cNo) async {
    print(cNo);
    print("getCategoryByNo() : 데이터가져오기 중");
    try {
      var dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';

      final response = await dio.get(
        'http://localhost:9099/api/ayList/${cNo}',
      );

      if (response.statusCode == 200) {
        print(response.data["apiData"]);

        List<AddressbookVo> addressList = [];
        for (int i = 0; i < response.data["apiData"].length; i++) {
          print("==================");
          AddressbookVo addressbookVo =
          AddressbookVo.fromJson(response.data["apiData"][i]);
          addressList.add(addressbookVo);
        }
        // 데이터가 없으면 그룹명안나옴.
        cName=addressList[0].cName!;
        print(cName);

        return addressList;
      } else {
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      throw Exception('Failed to load address: $e');
    }
  }
}
