import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspeechrecognizerifly_example/utils/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

class Nicknamepage extends StatefulWidget {
  // Nicknamepage({Key? key}) : super(key: key);

  @override
  _NicknamepageState createState() => _NicknamepageState();
}

class _NicknamepageState extends State<Nicknamepage> {
  TextEditingController _nicknameController = TextEditingController();
  DatabaseHelper db = DatabaseHelper();
  String nickname;
  String username;
  void getDataPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    username = pref.getString('username');
    var result = await db.userinfo(username);
    setState(() {
      nickname=result.nickname;
    });
  }
  void submitupdate() async {
    var result = await db.upnickname(_nicknameController.text, username);
    if (result ==1) {
      Fluttertoast.showToast(
          msg: "昵称更新成功 !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 24);
      setState(() {
        nickname=_nicknameController.text;
      });
      _nicknameController.clear();
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
        title: Text("修改昵称"),
        leading: new IconButton(
          tooltip: '返回上一页',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )).then((data) {
            });
          },
        ),
      ),
      body:Column(
        children: [
          SizedBox(height: 100),
          Text("你的昵称：$nickname"),
          TextFormField(
            controller: _nicknameController,
            validator: (e) {
              return e.toLowerCase().trim().isEmpty
                  ? '请输入昵称'
                  : null;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: '昵称',
              prefixIcon: Icon(
                Icons.face,
              ),
            ),
          ),
          RaisedButton(
            child:Text('确认更改'),
            // 背景颜色
            color:Colors.blue,
            // 文字颜色
            textColor: Colors.white,
            // 按钮阴影
            elevation: 10,
            onPressed: (){
              submitupdate();
            },
          ),
        ],
      ),
    );
  }
}
