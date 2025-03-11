import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/meo.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nguyễn Mai Huấn", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Xem trang cá nhân", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          _buildMenuItem(Icons.cloud, "zCloud", "Không gian lưu trữ dữ liệu trên đám mây"),
          _buildMenuItem(Icons.style, "zStyle – Nổi bật trên Zalo", "Hình nền và nhạc cho cuộc gọi Zalo"),
          _buildMenuItem(Icons.cloud_queue, "Cloud của tôi", "Lưu trữ các tin nhắn quan trọng"),
          _buildMenuItem(Icons.storage, "Dữ liệu trên máy", "Quản lý dữ liệu Zalo của bạn"),
          _buildMenuItem(Icons.qr_code, "Ví QR", "Lưu trữ và xuất trình các mã QR quan trọng"),
          Divider(),
          _buildMenuItem(Icons.security, "Tài khoản và bảo mật", ""),
          _buildMenuItem(Icons.lock, "Quyền riêng tư", ""),
        ],
      ),

    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}

