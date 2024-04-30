import 'package:flutter/material.dart';
import 'category.dart';
import 'bookmark.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  var _index = 0;

  List<Widget> _pages = [
    BookmarkPage(),
    CategoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: _pages[_index],
        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            currentIndex: _index,

            onTap: (value) {
              setState(() {
                _index = value;
                print(_index);
              });
            },

            backgroundColor: Color(0xFF0F0E36),
            selectedItemColor: Color(0xFFFFFC75), // 선택된 아이템의 색상
            unselectedItemColor: Color(0xFF81D1FB),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: '즐겨찾기',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: '연락처',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: '그룹',
              ),
            ],
            // selectedItemColor: Colors.amber[800],
            // onTap: _onItemTapped,
          ),
        ));
  }
}

