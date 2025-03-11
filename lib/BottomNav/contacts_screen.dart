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
                GroupsList(),
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
        ],
      ),
    );
  }
}

class ContactsList extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "An Cửu", "avatar": "images/Friend/fr1.jpg"},
    {"name": "Anh Đức", "avatar": "images/Friend/fr2.jpg"},
    {"name": "Bảo Châu", "avatar": "images/Friend/fr3.jpg"},
    {"name": "Thu Trang", "avatar": "images/Friend/fr4.jpg"},
    {"name": "Bùi Thu Trang", "avatar": "images/Friend/fr5.jpg"},
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
        );
      },
    );
  }
}

class GroupsList extends StatelessWidget {
  final List<Map<String, String>> groups = [
    {"name": "🔥 NroKamui (DAME ẢO)",
      "avatar": "images/Story/st0.jpg",
      "status": "1 phút trước"},
    {"name": "Bảy Viên Ngọc Rồng 6",
      "avatar": "images/Story/st1.jpg",
      "status": "1 phút trước"},
    {"name": "Nro Hero",
      "avatar": "images/Story/st2.jpg",
      "status": "4 giờ trước"},
    {"name": "K12-UTM Khoá luận Tốt nghiệp",
      "avatar": "images/Story/st3.jpg",
      "status": "19 giờ trước"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(groups[index]['avatar']!),
          ),
          title: Text(groups[index]['name']!),
          subtitle: Text(groups[index]['status']!),
        );
      },
    );
  }
}
