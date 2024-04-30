import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                                  child: Text(
                                    "저장된 연락처 38개",
                                    style: TextStyle(
                                      // color: Color(0xFFffffff),
                                      fontSize: 10,
                                    ),
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
                          style:
                              TextStyle(color: Color(0xFF5158F0), fontSize: 20),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            print("그룹추가");
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
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF26295E), width: 1.0))),
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.only(bottom: 10),

                            child:
                            Row(

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



                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
