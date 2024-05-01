import 'package:flutter/material.dart';

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
        child: Column(
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
                    child: Text("정우성",
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
                      Text(" 010-2222-2222",
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
                          child: Text("asdf@naver.com", style: TextStyle(
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
                        child: Text("이쁜 친구", style: TextStyle(
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
        ),
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
                                child: ElevatedButton(onPressed: (){}, child: Text("삭제하기", style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Color(
                                    0xff888888)),),
                              ),
                              Container(
                                width: 500,
                                height: 40,
                                child: ElevatedButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text("취소", style: TextStyle(color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Color(
                                    0xff888888))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            } //
          },
        ),
      ),
    );
  }
}