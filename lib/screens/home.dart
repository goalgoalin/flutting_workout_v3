import 'package:flutter/material.dart';
import 'package:flutting_workout/screens/routine_add.dart';
import 'community.dart';
import 'health_gym_map.dart';
import 'equipment_usage.dart';
import 'My.dart';
import 'routine.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _routine = [];
  
  int _currentIndex = 0;

  final List<Widget> _children = [

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _children[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.white,  
        appBar: AppBar(
        title: const Text('', style: 
        TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255),)),
        backgroundColor: Color(0xFF561689),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(image: AssetImage('assets/flirting_icon2.jpg'),
                fit: BoxFit.contain),
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 80)),
                ],
              ),
            ),
            ListTile(
              title: Text('기구 사용 안내'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EquipmentP()),
                );
              },
            ),
            ListTile(
              title: Text('내 주변 헬스장'),
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => HealthGymMapScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24.0,
                  backgroundColor: Colors.purple.shade100,
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF561689),
                    size: 32.0,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoutineScreen(savedRoutine: _routine)),
                );
              },
              child: Container(
                color: Color(0xFF561689),
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    '헬스 루틴 관리',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'MY',
          ),
        ],
      onTap: ((value)=>_onNavItemTap(value, context)),
      ),
    ),    
  ); 
}

_onNavItemTap(int value, BuildContext context) {
  switch(value) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommunityP()),
      );
    break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyPage()),
     );
    break;
    }
  }
}