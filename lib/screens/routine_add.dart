import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutting_workout/Service/api_service.dart';
import 'routine.dart';

class HealthRoutineScreen extends StatefulWidget {
  @override
  _HealthRoutineScreenState createState() => _HealthRoutineScreenState();
}

class _HealthRoutineScreenState extends State<HealthRoutineScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _routine = [];
  final List<TextEditingController> _exerciseNameControllers = [];
  final List<TextEditingController> _countControllers = [];
  final ApiService apiService =
      ApiService('http://localhost:8080'); // 기본 URL을 설정

  String _userId = "taehun"; // 임시로 하드코딩된 사용자 ID

  void _addExercise() {
    setState(() {
      _exerciseNameControllers.add(TextEditingController());
      _countControllers.add(TextEditingController());
    });
  }

  void _removeExercise() {
    if (_exerciseNameControllers.isNotEmpty && _countControllers.isNotEmpty) {
      setState(() {
        _exerciseNameControllers.removeLast();
        _countControllers.removeLast();
      });
    }
  }

  Future<void> _submitRoutine() async {
    try {
      List<Map<String, dynamic>> routine = [];

      for (int i = 0; i < _exerciseNameControllers.length; i++) {
        routine.add({
          'exerciseName': _exerciseNameControllers[i].text,
          'exerciseCount': _countControllers[i].text,
        });
      }

      final response = await apiService.manageHealthRoutine(_userId, routine);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(responseBody['message'])));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoutineScreen(savedRoutine: _routine),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to submit routine')));
        debugPrint('Error: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e, stacktrace) {
      debugPrint('Exception occurred: $e');
      debugPrint('Stacktrace: $stacktrace');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('An error occurred while submitting routine')));
    }
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
        title: Text('헬스 루틴 관리',
          style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _exerciseNameControllers.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: _exerciseNameControllers[index],
                            decoration: InputDecoration(
                              labelText: 'Exercise Name',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  _exerciseNameControllers[index].clear();
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return '운동 이름을 입력해 주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Flexible(
                          child: TextFormField(
                            controller: _countControllers[index],
                            decoration: InputDecoration(
                              labelText: 'Count',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  _countControllers[index].clear();
                                },
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return '몇 회 시행했는지 입력해 주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _addExercise,
                    child: Text('+'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: _removeExercise,
                    child: Text('-'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _submitRoutine();
                  }
                },
                child: Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}