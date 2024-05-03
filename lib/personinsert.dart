import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'addressbookVo.dart';
import 'package:dio/dio.dart';

class PersonInsertForm extends StatelessWidget {
  const PersonInsertForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: _PersonInsertForm(),
      ),

    );
  }
}

class _PersonInsertForm extends StatefulWidget {
  final List<int> lastChoiceGNoList;

  const _PersonInsertForm({Key? key, this.lastChoiceGNoList = const []})
      : super(key: key);

  @override
  State<_PersonInsertForm> createState() =>
      _PersonInsertFormState(lastChoiceGNoList);

  static final GlobalKey<_PersonInsertFormState> formKey = GlobalKey<_PersonInsertFormState>();
}


class _PersonInsertFormState extends State<_PersonInsertForm> {
  late List<int> lastChoiceGNoList;
  late int gender = 1;

  _PersonInsertFormState(this.lastChoiceGNoList);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  @override
   Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 830,
          color: Color(0xFF0F0E36),
          padding: EdgeInsets.fromLTRB(40, 40, 30, 20),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.asset(
                    'assets/images/greenman.jpg',
                    width: 130,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ),
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
                        child: Icon(
                          Icons.person,
                          color: Color(0xFFffffff),
                        ),
                      ),
                      labelText: '이름',
                      labelStyle: TextStyle(color: Color(0xFFffffff)),
                      hintText: '이름을 입력하세요',
                      hintStyle: TextStyle(color: Color(0xFFffffff)),
                      border: InputBorder.none),
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
                        child: Icon(
                          Icons.call,
                          color: Color(0xFFffffff),
                        ),
                      ),
                      labelText: '전화번호',
                      labelStyle: TextStyle(color: Color(0xFFffffff)),
                      hintText: '전화번호를 입력하세요',
                      hintStyle: TextStyle(color: Color(0xFFffffff)),
                      border: InputBorder.none),
                ),
              ),
              Container(
                height: 60,
                color: Color(0xFF161443),
                margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                padding: EdgeInsets.only(top:15),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(Icons.wc,color: Color(0xFFffffff),),
                        ),
                        SizedBox(width: 15,),
                        Text("성별",style: TextStyle(color: Color(0xFFffffff)),),
                        SizedBox(width: 40,),
                        Row(
                          children: [
                            Text('남성',style: TextStyle(color: Color(0xFFffffff)),),
                            Radio(
                                value: 1,
                                groupValue: gender,
                                onChanged: (value) {
                                  if(value != gender){
                                    setState(() {
                                      gender = value!;
                                      print(gender);
                                    });
                                  }
                                }
                            ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Row(
                          children: [
                            Text('여성',style: TextStyle(color: Color(0xFFffffff))),
                            Radio(
                                value: 2,
                                groupValue: gender,
                                onChanged: (value) {
                                  if(value != gender){
                                    setState(() {
                                      gender = value!;
                                      print(gender);
                                    });
                                  }
                                }),

                          ],
                        ),

                      ],
                    ),

                  ],
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
                        child: Icon(
                          Icons.mail,
                          color: Color(0xFFffffff),
                        ),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFFffffff)),
                      hintText: 'Email을 입력하세요',
                      hintStyle: TextStyle(color: Color(0xFFffffff)),
                      border: InputBorder.none),
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF161443),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.only(left: 13),
                  ),
                  onPressed: () async {
                    print("그룸페이지 호출==>값을 받아야 한다");
                    final result =
                        await Navigator.pushNamed(context, '/persongroupinsert');

                    lastChoiceGNoList = result as List<int>;
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.group,
                          color: Color(0xFFffffff),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "그룹",
                            style: TextStyle(color: Color(0xFFffffff), fontSize: 16),
                          )),
                      Container(
                        width: 250,
                        height: 50,
                        color: Color(0xFF161443),
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: lastChoiceGNoList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Row(
                                  children: [
                                    Text("${lastChoiceGNoList[index]}",
                                      style: TextStyle(color: Color(0xFFffffff),fontSize: 15),)
                                  ],
                                ),
                              ],
                            );
                          }
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
                        child: Icon(
                          Icons.edit_document,
                          color: Color(0xFFffffff),
                        ),
                      ),
                      labelText: '메모',
                      labelStyle: TextStyle(color: Color(0xFFffffff)),
                      hintText: '메모를 입력하세요',
                      hintStyle: TextStyle(color: Color(0xFFffffff)),
                      border: InputBorder.none),
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
                  child: TextButton(
                      style:
                      TextButton.styleFrom(backgroundColor: Color(0x0f0e36)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("취소",
                          style: TextStyle(
                              color: Color(0xFF81D1FB),
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                  width: 160,
                  height: 80,
                  margin: EdgeInsets.only(left: 41),
                  child: TextButton(
                      style:
                      TextButton.styleFrom(backgroundColor: Color(0x0f0e36)),
                      onPressed: () {
                        writeAddressInsert();


                      },
                      child: Text("등록",
                          style: TextStyle(
                              color: Color(0xFF81D1FB),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      )
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  //


  //주소등록
  Future<AddressbookVo> writeAddressInsert() async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      //



      // 서버 요청
      final response = await dio.post(
        'http://localhost:9099/api/jh/personwriteinsert',

        data: {
          // 예시 data  map->json자동변경
          'name': _nameController.text,
          'hp': _hpController.text,
          'gender': gender,
          'email': _emailController.text,
          'memo': _memoController.text,
          'groupNoList': lastChoiceGNoList
        },

      );

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data["apiData"]); // json->map 자동변경



        //return PersonVo.fromJson(response.data["apiData"]);
        Navigator.pushNamed(context,'/addresspage');

        return AddressbookVo.fromJson(response.data["apiData"]);
        //Navigator.pushNamed( context, "/list");
      } else {
        //접속실패 404, 502등등 api서버 문제
        throw Exception('api 서버 문제');
      }
    } catch (e) {
      //예외 발생
      throw Exception('Failed to load person: $e');
    }
  }

  //주소_그룹등록
  Future<void> writeAddressGroup() async {
    try {
      /*----요청처리-------------------*/
      //Dio 객체 생성 및 설정
      var dio = Dio();

      // 헤더설정:json으로 전송
      dio.options.headers['Content-Type'] = 'application/json';

      //



      // 서버 요청
      final response = await dio.post(
        'http://localhost:9099/api/jh',
        data: {
          if(lastChoiceGNoList.length == 0){

          }else{
            for(int i = 0; i < lastChoiceGNoList.length; i++){

            }
          }
          // 예시 data  map->json자동변경
        },


      );

      /*----응답처리-------------------*/
      if (response.statusCode == 200) {
        //접속성공 200 이면
        print(response.data); // json->map 자동변경
        //return PersonVo.fromJson(response.data["apiData"]);

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





}
