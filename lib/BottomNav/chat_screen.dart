import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBarSection(tabController: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MessagesList(),
                OtherSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  final TabController tabController;
  const TabBarSection({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        indicatorColor: Colors.blue,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(text: "Ưu tiên"),
          Tab(text: "Khác"),
        ],
      ),
    );
  }
}

class OtherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("images/Friend/fr7.jpg"),
          ),
          title: Text("Cloud của tôi"),
          subtitle: Text("Bạn: [Hình ảnh]"),
          trailing: Text("17 giờ", style: TextStyle(color: Colors.grey)),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Thêm các trò chuyện không ưu tiên vào đây để dễ dàng quản lý và tránh bị làm phiền",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),
          onPressed: (
              ) {},
          child: Text("Thêm trò chuyện"),
        ),
      ],
    );
  }
}

class MessagesList extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {"name": "NroKamui (DAME ẢO)", "avatar": "images/Friend/fr1.jpg", "time": "24 giây"},
    {"name": "Bảy Viên Ngọc Rồng 6", "avatar": "images/Friend/fr2.jpg", "time": "8 phút"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(messages[index]['avatar']!),
          ),
          title: Text(messages[index]['name']!),
          trailing: Text(messages[index]['time']!, style: TextStyle(color: Colors.grey)),
        );
      },
    );
  }
}
