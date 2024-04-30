import 'package:flutter/material.dart';

class PersonGroupInsert extends StatelessWidget {
  const PersonGroupInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F0E36),
        title: Text(
          "그룹선택",
          style: TextStyle(fontSize: 18, color: Color(0xFF81D1FB)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF81D1FB),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로가기 버튼 클릭 시 이전 화면으로 이동
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: 1000,
          color: Color(0xFF0F0E36),
          padding: EdgeInsets.fromLTRB(40, 60, 40, 20),
          child: _PersonGroupInsert(),
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
  //변수
  bool? _Null = false;
  bool? _Friend = false;
  bool? _Family = false;
  bool? _aaaa = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        // height: 270,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFF161443), borderRadius: BorderRadius.circular(20)),
        child: Column(
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
                      value: _Null,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _Null = value;
                        });
                      }),
                  Text("지정 안함", style: TextStyle(color: Color(0xFFffffff)))
                ],
              ),
            ),
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
                      value: _Friend,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _Friend = value;
                        });
                      }),
                  Text("친구", style: TextStyle(color: Color(0xFFffffff)))
                ],
              ),
            ),
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
                      value: _Family,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _Family = value;
                        });
                      }),
                  Text("가족", style: TextStyle(color: Color(0xFFffffff)))
                ],
              ),
            ),
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
                      value: _aaaa,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _aaaa = value;
                        });
                      }),
                  Text("동료", style: TextStyle(color: Color(0xFFffffff)))
                ],
              ),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF161443)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("+",
                          style: TextStyle(
                              color: Color(0xFF06F004), fontSize: 20)),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("그룹추가(시간 남으면)",
                              style: TextStyle(color: Color(0xFFffffff))))
                    ],
                  )),
            ),
          ],
        ),
      ),
    ]);
  }
}
