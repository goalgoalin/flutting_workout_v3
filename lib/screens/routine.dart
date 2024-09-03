import 'package:flutter/material.dart';
import 'routine_add.dart';
import 'home.dart';

class RoutineScreen extends StatefulWidget {
  final List<Map<String, dynamic>> savedRoutine;

  RoutineScreen({required this.savedRoutine});

  @override
  _RoutineScreenState createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0XFF561689),
        title: Text(
          '헬스 루틴 관리',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: /*_login,*/
              () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthRoutineScreen()),
                ); // 로그인 버튼 동작
              },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.all(12.0), // 텍스트 주위에 여백을 줍니다.
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF561689), width: 2.0), // 박스의 테두리 색상과 두께
                  borderRadius: BorderRadius.circular(8.0), // 박스의 둥근 모서리
                  color: Colors.white, // 박스 내부 배경색
                ),
                child: Text(
                  '${_selectedDate.toLocal()}'.split(' ')[0],
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.savedRoutine.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.fitness_center, color: Color(0XFF561689)),
                    title: Text(widget.savedRoutine[index]['exerciseName']),
                    trailing: Text(widget.savedRoutine[index]['exerciseCount'].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}