import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'addressbookVo.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    _CategoryPageState _categoryPageState = _CategoryPageState();

    return Scaffold(
        backgroundColor: Color(0xFF0F0E36),
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
                    return Container(
                      color: Color(0xFF0F0E36),
                      child: FlexibleSpaceBar(
                        centerTitle: true,
                        titlePadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        title: isExpanded
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Color(0xFF0F0E36),
                              margin: EdgeInsets.fromLTRB(0, 70, 0, 10),
                              child: Text(
                                "그룹",
                                style: TextStyle(
                                  color: Color(0xFFffffff),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: FutureBuilder<List<AddressbookVo>>(
                                future: _categoryPageState.getCategoryList(),
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
                            child: Container(
                              color: Color(0xFF0F0E36),
                              // padding: EdgeInsets.zero,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("그룹추가"),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
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
                          child: Text(
                            "ㄱ",
                            style: TextStyle(
                                color: Color(0xFF5158F0), fontSize: 20),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              print("그룹추가");
                              TextEditingController _cNameController =
                              TextEditingController();
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: Text(
                                          "그룹추가",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 20),
                                        ),
                                        backgroundColor: Color(0xFF1E1E3F),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              child: TextField(
                                                controller: _cNameController,
                                                style: TextStyle(
                                                    color: Color(0xffffffff)),
                                                decoration: InputDecoration(
                                                  hintText: '추가할 그룹입력',
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff545151)),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("취소",
                                                style: TextStyle(
                                                    color: Color(0xffffffff))),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              print("등록");
                                              String cName =
                                                  _cNameController.text;
                                              print(cName);
                                              Navigator.pushNamed(context, "/category");
                                              _CategoryPageState()
                                                  .InsertCategory(cName);
                                              _CategoryPageState().getCategoryList();

                                            },
                                            child: Text(
                                              "등록",
                                              style: TextStyle(
                                                  color: Color(0xffffffff)),
                                            ),
                                          )
                                        ]);
                                  });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Color(0xFF81D1FB),
                            )),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF161443),
                        ),
                        child: _CategoryPage())
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

// 등록
class _CategoryPage extends StatefulWidget {
  const _CategoryPage({super.key});

  @override
  State<_CategoryPage> createState() => _CategoryPageState();
}

//할일
class _CategoryPageState extends State<_CategoryPage> {
  // 공통변수
  late Future<List<AddressbookVo>> categoryListFuture;
  final TextEditingController _cNameController = TextEditingController();

  // 초기화할때
  @override
  void initState() {
    super.initState();
    categoryListFuture = getCategoryList(); // 메소드사용

  }

  // 그림그릴 때
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryListFuture, //Future<> 함수명, 으로 받은 데이타
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('데이터를 불러오는 데 실패했습니다.'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('데이터가 없습니다.'));
        } else {
          //데이터가 있으면
          // _nameController.text = snapshot.data!.name; --> input사용할때
          // for문으로반복문 사용 X builder로 사용
          return ListView.builder(
            itemExtent: 90,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFF26295E), width: 1.0))),
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Container(
                            child: Icon(
                              Icons.group,
                              size: 40,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          width: 230,
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            "${snapshot.data![index].cName}",
                            style: TextStyle(
                                color: Color(0xFFffffff), fontSize: 20),
                          ),
                        ),
                        Container(
                          child: IconButton(
                              onPressed: () {
                                print("${snapshot.data![index].cNo}");
                                Navigator.pushNamed(
                                  context,
                                  '/grouplist',
                                  arguments: {"cNo": snapshot.data![index].cNo},
                                );
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Color(0xffffffff),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            shrinkWrap: true,
          );
        } // 데이터가있으면
      },
    );
  }

  // 리스트가져오기 dio통신
  Future<List<AddressbookVo>> getCategoryList() async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      // 서버 요청
      final response = await dio.get('http://localhost:9099/api/ayList');

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data["apiData"]); // json->map 자동변경
        // map -> {} Map 을 객체(빈 리스트)로 생성
        List<AddressbookVo> addressList = [];

        for (int i = 0; i < response.data["apiData"].length; i++) {
          AddressbookVo addressbookVo =
          AddressbookVo.fromJson(response.data["apiData"][i]);
          addressList.add(addressbookVo);
        }

        return addressList;
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load address: $e');
    }
  }

  // 그룹추가
  Future<void> InsertCategory(String cName) async {
    print(cName);
    try {
      print("=======================");
      print(cName);
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();
      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';
      print(cName);
      // 서버 요청
      final response = await dio.post(
        'http://localhost:9099/api/ayInsert',
        queryParameters: {
          'cName': cName,
        },
      );
      print("=====================");
      print(cName);
      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print("접속성공========================");
        print(cName); // json->map 자동변경
        // map -> {} Map 을 객체(빈 리스트)로 생성
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load address: $e');
    }
  }
}
