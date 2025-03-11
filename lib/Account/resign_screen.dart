import 'package:flutter/material.dart';
import 'package:zalo_clone/Account/login.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Nhập số điện thoại',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: '+84',
                    items: [DropdownMenuItem(value: '+84', child: Text('+84'))],
                    ///
                    onChanged: (value) {},
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              value: isChecked1,
              onChanged: (value) {
                setState(() {
                  isChecked1 = value!;
                });
              },
              title: Text.rich(
                TextSpan(
                  text: 'Tôi đồng ý với các ',style: TextStyle(fontSize: 13),
                  children: [
                    TextSpan(
                      text: 'điều khoản sử dụng Zalo',
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            CheckboxListTile(
              value: isChecked2,
              onChanged: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              },
              title: Text.rich(
                TextSpan(
                  text: 'Tôi đồng ý với ',style: TextStyle(fontSize: 13),
                  children: [
                    TextSpan(
                      text: 'điều khoản Mạng xã hội của Zalo',
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (isChecked1 && isChecked2 && phoneController.text.isNotEmpty)
                  ? () {}
                  : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Tiếp tục'),
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Text(
                  'Bạn đã có tài khoản? Đăng nhập ngay',
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PhoneNumberScreen(),
  ));
}
