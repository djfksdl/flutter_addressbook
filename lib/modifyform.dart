import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ModifyForm extends StatelessWidget {
  const ModifyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0F0E36),
        padding: EdgeInsets.fromLTRB(40,40,30,20),
        child: _ModifyForm(),
      ),
      bottomNavigationBar: SizedBox(
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
                      Navigator.of(context).pop();
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
    );
  }
}


class _ModifyForm extends StatefulWidget {
  const _ModifyForm({super.key});

  @override
  State<_ModifyForm> createState() => _ModifyFormState();
}

class _ModifyFormState extends State<_ModifyForm> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hpController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  String men = "남성";

  //화면 그리기
  @override
  Widget build(BuildContext context) {
    // ModalRoute를 통해 현재 페이지에 전달된 arguments를 가져옵니다.
    late final args = ModalRoute.of(context)!.settings.arguments as Map;
    // 'aNo' 키를 사용하여 값을 추출합니다.
    late final aNo = args['aNo'];
    print("==============");
    print(aNo);
    print("==============");

    return Column(
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
                labelText:'이름',
                labelStyle: TextStyle(color: Color(0xFFffffff)),
                hintText: '이름을 입력하세요',
                hintStyle: TextStyle(color: Color(0xFFffffff)),
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
                labelText:'전화번호',
                labelStyle: TextStyle(color: Color(0xFFffffff)),
                hintText: '전화번호를 입력하세요',
                hintStyle: TextStyle(color: Color(0xFFffffff)),
                border: InputBorder.none
            ),
          ),
        ),

        Container(
          height: 60,
          color: Color(0xFF161443),
          margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
          child: Row(
              children: [
                Container(
                  width: 20,
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(Icons.wc,color: Color(0xFFffffff),),
                ),
                /*
              RadioListTile(
                title: Text('남성'),
                value: men,
                groupValue: _genderController.text,
                onChanged: (value){
                  Text("sss");
                  _genderController.text = men;
                },
              )
              */
              ]
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
                labelText:'Email',
                labelStyle: TextStyle(color: Color(0xFFffffff)),
                hintText: 'Email을 입력하세요',
                hintStyle: TextStyle(color: Color(0xFFffffff)),
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
              print("클릭");
              Navigator.pushNamed(context, '/persongroupinsert');
            },
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.group,color: Color(0xFFffffff),),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "그룹",
                      style: TextStyle(
                          color: Color(0xFFffffff),
                          fontSize: 16
                      ),
                    )
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
                labelText:'메모',
                labelStyle: TextStyle(color: Color(0xFFffffff)),
                hintText: '메모를 입력하세요',
                hintStyle: TextStyle(color: Color(0xFFffffff)),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }

  //특정 aNo의 데이터 가져오기
  Future<void> getPersonByNo(int aNo) async {
    try {
    /*----요청처리-------------------*/
    //Dio 객체 생성및 설정
    var dio = Dio();
    // 헤더설정:json으로 전송
    dio.options.headers['Content-Type'] = 'application/json';
    // 서버 요청
    final response = await dio.put
    ('http://localhost:9099/api/ysGetVo/${aNo}');
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
