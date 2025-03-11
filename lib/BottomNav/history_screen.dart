import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          _buildStatusInput(),
          _buildMomentsSection(),
          Expanded(child: _buildPostList()),
        ],
      ),
    );
  }

  Widget _buildStatusInput() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/meo.jpg'),
            radius: 25,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Hôm nay bạn thế nào?",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.image, color: Colors.green), onPressed: () {}),
          IconButton(icon: Icon(Icons.video_call, color: Colors.purple), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildMomentsSection() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Khoảnh khắc", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(7, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/Friend/fr$index.jpg'),
                        radius: 30,
                      ),
                      SizedBox(height: 5),
                      Text("Khoảnh khắc"),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostList() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/Friend/fr$index.jpg'),
                ),
                title: Text("Người dùng $index"),
                subtitle: Text("7 phút trước"),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Bài đăng số $index. Đây là nhan skin free."),
              ),
              Image.asset('images/Story/st$index.jpg'),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
                  IconButton(icon: Icon(Icons.comment), onPressed: () {}),
                  IconButton(icon: Icon(Icons.share), onPressed: () {}),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  }
