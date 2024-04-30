import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF0F0E36),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(30),
            color: Color(0xFF0F0E36),
            // height: 800,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    "그룹",
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          print("그룹추가버튼클릭");
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
                                      children: <Widget>[
                                        TextField(
                                          style: TextStyle(
                                              color: Color(0xffffffff)),
                                          decoration: InputDecoration(
                                            hintText: '추가할 그룹입력',
                                            hintStyle: TextStyle(
                                                color: Color(0xff545151)),
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
                                                  color: Color(0xffffffff)))),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("등록",
                                              style: TextStyle(
                                                  color: Color(0xffffffff))))
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
                              Container(
                                child: Icon(
                                  Icons.group,
                                  size: 40,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              Container(
                                width: 230,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  "친구",
                                  style: TextStyle(
                                      color: Color(0xFFffffff), fontSize: 20),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {
                                      print("친구그룹버튼클릭");
                                      Navigator.pushNamed(
                                          context, '/grouplist');
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
                                child: Icon(
                                  Icons.group,
                                  size: 40,
                                  color: Color(0xffd3d3d3),
                                ),
                              ),
                              Container(
                                width: 230,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  "가족",
                                  style: TextStyle(
                                      color: Color(0xFFffffff), fontSize: 20),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {
                                      print("가족그룹버튼클릭");
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
                                child: Icon(
                                  Icons.group,
                                  size: 40,
                                  color: Color(0xffd3d3d3),
                                ),
                              ),
                              Container(
                                width: 230,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  "회사",
                                  style: TextStyle(
                                      color: Color(0xFFffffff), fontSize: 20),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {
                                      print("회사그룹버튼클릭");
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
                                child: Icon(
                                  Icons.group,
                                  size: 40,
                                  color: Color(0xffd3d3d3),
                                ),
                              ),
                              Container(
                                width: 230,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  "학원",
                                  style: TextStyle(
                                      color: Color(0xFFffffff), fontSize: 20),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {
                                      print("학원그룹버튼클릭");
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
                                child: Icon(
                                  Icons.group,
                                  size: 40,
                                  color: Color(0xffd3d3d3),
                                ),
                              ),
                              Container(
                                width: 230,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  "모임",
                                  style: TextStyle(
                                      color: Color(0xFFffffff), fontSize: 20),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {
                                      print("모임그룹버튼클릭");
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
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
