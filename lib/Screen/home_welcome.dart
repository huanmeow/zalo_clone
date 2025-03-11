import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zalo_clone/Screen/slider_images.dart';
import '../Account/login.dart';
import '../Account/resign_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  String _selectedLanguage = "Tiếng Việt";

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),

          // Nút đổi ngôn ngữ với viền bo tròn
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 16),
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //         border: Border.all(color: Colors.grey.shade300), // Viền nhẹ
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey,
          //             blurRadius: 4,
          //             offset: Offset(0, 2),
          //           ),
          //         ],
          //       ),
          //       child: PopupMenuButton<String>(
          //         onSelected: _changeLanguage,
          //         itemBuilder: (context) => [
          //           const PopupMenuItem(value: "Tiếng Việt", child: Text("Tiếng Việt")),
          //           const PopupMenuItem(value: "English", child: Text("English")),
          //         ],
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text(_selectedLanguage, style: const TextStyle(color: Colors.black)),
          //             const Icon(Icons.arrow_drop_down, color: Colors.black),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          const SizedBox(height: 20),

          // Logo Zalo căn giữa
          Center(
            child: Text(
              "Zalo",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Slider hình ảnh
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                SliderItem(
                  image: "images/Wel/wc1.png",
                  title: "Gọi video ổn định",
                  description: "Trò chuyện thật đã với chất lượng video ổn định mọi lúc, mọi nơi",
                ),
                SliderItem(
                  image: "images/Wel/wc2.png",
                  title: "Nhắn tin nhanh chóng",
                  description: "Gửi tin nhắn tức thì với bạn bè và gia đình",
                ),
                SliderItem(
                  image: "images/Wel/wc3.png",
                  title: "Bảo mật cao",
                  description: "Các cuộc trò chuyện của bạn luôn được bảo vệ",
                ),
              ],
            ),
          ),

          // Indicator
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
              dotHeight: 6,
              dotWidth: 6,
            ),
          ),

          const SizedBox(height: 20),

          // Nút Đăng nhập & Tạo tài khoản
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (_)=>LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Đăng nhập"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (_)=>PhoneNumberScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black87,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Tạo tài khoản mới"),
                ),

              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
