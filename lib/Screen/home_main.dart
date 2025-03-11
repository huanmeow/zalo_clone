import 'package:flutter/material.dart';
import 'package:zalo_clone/BottomNav/history_screen.dart';
import '../BottomNav/chat_screen.dart';
import '../BottomNav/contacts_screen.dart';
import '../BottomNav/profile_screen.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    ChatScreen(),
    ContactsScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Tìm kiếm",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedIndex], // Hiển thị màn hình tương ứng
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex, // Đảm bảo mục được chọn hiển thị đúng
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Tin nhắn"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Danh bạ"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Nhật ký"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
        ],
      ),
    );
  }
}
