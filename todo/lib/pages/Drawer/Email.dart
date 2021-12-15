import 'package:flutter/material.dart';
import 'package:flutterspeechrecognizerifly_example/utils/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

class Emailpage extends StatefulWidget {

  @override
  _EmailpageState createState() => _EmailpageState();
}

class _EmailpageState extends State<Emailpage> {
  TextEditingController _emailController = TextEditingController();
  DatabaseHelper db = DatabaseHelper();
  String email;
  String username;
  void getDataPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    username = pref.getString('username');
    var result = await db.userinfo(username);
    setState(() {
      email = result.email;
    });
  }

  void submitupdate() async {
    int result = await db.upemail(_emailController.text, username);
    if (result == 1) {
      Fluttertoast.showToast(
          msg: "邮箱更新成功 !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 24);

      setState(() {
        email = _emailController.text;
      });
      _emailController.clear();
    } else {
      print("更新失败");
      print(email);
    }
  }

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改邮箱"),
        leading: new IconButton(
          tooltip: '返回上一页',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )).then((data) {});
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Text("你的邮箱：$email"),
          TextFormField(
            controller: _emailController,
            validator: (e) {
              return e.toLowerCase().trim().isEmpty ? '请输入邮箱' : null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: '邮箱',
              prefixIcon: Icon(
                Icons.email,
              ),
            ),
          ),
          RaisedButton(
            child: Text('确认更改'),
            // 背景颜色
            color: Colors.blue,
            // 文字颜色
            textColor: Colors.white,
            // 按钮阴影
            elevation: 10,
            onPressed: () {
              submitupdate();
              // Navigator.pushNamed(context, '/email');
            },
          ),
        ],
      ),
    );
  }
}
