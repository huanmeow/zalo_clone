import 'package:flutter/material.dart';
import 'auth_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Vui lòng nhập số điện thoại để lấy lại mật khẩu")),
      );
      return;
    }
    setState(() {
      _isLoading = true;
    });
    await _authService.resetPassword(_emailController.text);
    setState(() {
      _isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Liên kết đặt lại mật khẩu đã được gửi")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lấy lại mật khẩu"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Số điện thoại",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _resetPassword,
              child: Text("Gửi yêu cầu đặt lại mật khẩu"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}