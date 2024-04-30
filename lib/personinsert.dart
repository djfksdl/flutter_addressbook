import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonInsertForm extends StatelessWidget {
  const PersonInsertForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0F0E36),
        padding: EdgeInsets.fromLTRB(40,40,30,20),
        child: _PersonInsertForm(),
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0x0f0e36)
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0x0f0e36)
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "등록",
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
class _PersonInsertForm extends StatefulWidget {
  const _PersonInsertForm({super.key});

  @override
  State<_PersonInsertForm> createState() => _PersonInsertFormState();
}

class _PersonInsertFormState extends State<_PersonInsertForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hpController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  String men = "남성";

  @override
  Widget build(BuildContext context) {


    return Column(
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
}
