import 'package:flutter/material.dart';

class groupEditForm extends StatelessWidget {
  const groupEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f0e36),
      body: _groupEditForm(),
      bottomNavigationBar: Container(
        // width: 10,
        // height: 30,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: TextButton(
                  onPressed: (){
                    print("취소 버튼 클릭");
                    Navigator.pushNamed(context, "/grouplist");
                  },
                  child: Text(
                    "취소",
                    style: TextStyle(color: Color(0xff81d1fb)),

                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: TextButton(
                  onPressed: (){
                    print("수정 버튼 클릭");
                    Navigator.pushNamed(context, "/grouplist");
                  },
                  child: Text(
                    "수정",
                    style: TextStyle(color: Color(0xff81d1fb)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _groupEditForm extends StatefulWidget {
  const _groupEditForm({super.key});

  @override
  State<_groupEditForm> createState() => _groupEditFormState();
}

class _groupEditFormState extends State<_groupEditForm> {

  final TextEditingController _groupNameController=TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.fromLTRB(0, 30, 170, 0),
                      child: Text("그룹명",
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
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "새로운 그룹 이름을 입력해 주세요",
                          hintStyle: TextStyle(
                            color: Color(0xff545151),
                            fontSize: 15,
                            fontWeight: FontWeight.w100,


                          ),
                          counterText: '',
                          // border: UnderlineInputBorder()
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
