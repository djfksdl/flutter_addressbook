import 'package:flutter/material.dart';

class GroupListPage extends StatefulWidget {
  const GroupListPage({super.key});

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(30),
          color: Color(0xFF0F0E36),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  "친구",
                  style: TextStyle(
                      color: Color(0xFFffffff),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 460,
                child: Text(
                  "저장된 연락처 38개",
                  style: TextStyle(color: Color(0xFFffffff), fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "ㄱ",
                      style: TextStyle(color: Color(0xFF5158F0), fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print("그룹편집버튼클릭");
                        Navigator.pushNamed(context, '/groupeditform');
                      },
                      icon: Icon(
                        Icons.edit,
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
                  width: 430,
                  child: Column(
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50
                                ,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              child: Image.asset(
                                'assets/images/girl.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "강나연",
                                style: TextStyle(
                                    color: Color(0xFFffffff), fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),

    );


  }
}
