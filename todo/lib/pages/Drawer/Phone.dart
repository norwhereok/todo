import 'package:flutter/material.dart';
import 'package:flutterspeechrecognizerifly_example/utils/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

class Phonepage extends StatefulWidget {
  // Phonepage({Key? key}) : super(key: key);

  @override
  _PhonepageState createState() => _PhonepageState();
}

class _PhonepageState extends State<Phonepage> {
  TextEditingController _phoneController = TextEditingController();
  DatabaseHelper db = DatabaseHelper();
  String phone;
  String username;
  void getDataPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    username = pref.getString('username');
    var result = await db.userinfo(username);
    setState(() {
      phone=result.phone;
    });
  }
  void submitupdate() async {
    var result = await db.upphone(_phoneController.text, username);
    if (result ==1) {
      Fluttertoast.showToast(
          msg: "手机号更新成功 !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 24);
      setState(() {
        phone=_phoneController.text;
      });
      _phoneController.clear();
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
        title: Text("修改手机号"),
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
          Text("你的手机号：$phone"),
          TextFormField(
            controller: _phoneController,
            validator: (e) {
              return e.toLowerCase().trim().isEmpty
                  ? '请输入手机号'
                  : null;
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: '手机号',
              prefixIcon: Icon(
                Icons.phone,
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
