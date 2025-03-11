import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                ContactsList(),
                Center(child: Text("Danh sách nhóm")),
                Center(child: Text("Official Accounts")),
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
          Tab(text: "Bạn bè"),
          Tab(text: "Nhóm"),
          Tab(text: "OA"),
        ],
      ),
    );
  }
}
class ContactsList extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "An Cửu", "avatar": "images/Friend/fr1.jpg"},
    {"name": "Bảo Châu", "avatar": "images/Friend/fr2.jpg"},
    {"name": "Luu Thu Trang", "avatar": "images/Friend/fr3.jpg"},
    {"name": "Bùi Thu Trang", "avatar": "images/Friend/fr4.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(contacts[index]['avatar']!),
          ),
          title: Text(contacts[index]['name']!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.video_call),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
