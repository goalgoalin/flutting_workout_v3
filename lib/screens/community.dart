import 'package:flutter/material.dart';
import 'health_gym_map.dart';
import 'equipment_usage.dart';
import 'home.dart';

class CommunityP extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityP> {
  final List<Map<String, String>> _posts = [];

  void _navigateToPostForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostFormScreen(
          onPostAdded: (title, content) {
            setState(() {
              _posts.add({'title': title, 'content': content});
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '커뮤니티',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF561689),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );// Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () => _navigateToPostForm(context),
          )
        ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthGymMapScreen()),
                );
              },
            ),
          ],
        ),
      ), // 사이드 메뉴 예시
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(''),
                backgroundColor: Color(0XFF561689),),
              title: Text(post['title'] ?? ''),
              subtitle: Text(post['content'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}

class PostFormScreen extends StatefulWidget {
  final Function(String, String) onPostAdded;

  PostFormScreen({required this.onPostAdded});

  @override
  _PostFormScreenState createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _submitPost() {
    if (_formKey.currentState!.validate()) {
      widget.onPostAdded(_titleController.text, _contentController.text);
      Navigator.pop(context); // 작성 후 메인 화면으로 돌아가기
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '커뮤니티',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF561689),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityP()),
            );// Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '제목을 입력하세요',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '내용을 입력하세요',
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF561689),
                  ),
                  onPressed: _submitPost,
                  child: Text('올리기',
                    style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
