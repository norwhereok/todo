import 'package:flutter/material.dart';
import 'package:flutterspeechrecognizerifly_example/model/user.dart';
import 'package:flutterspeechrecognizerifly_example/utils/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  DatabaseHelper db = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void check() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      isLoading = true;
      setState(() {});
      submitDataRegister();
    }
    Navigator.pushNamed(context, '/');
  }

  void submitDataRegister() async {
    var result = await db.saveUser(
      user.fromMap({
        'username': _usernameController.text,
        'nickname': _nicknameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'password': _passwordController.text,
      }),
    );
    // print(result);
    if (result != null) {
      Fluttertoast.showToast(
          msg: "注册成功 !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 24);

      _usernameController.clear();
      _nicknameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _phoneController.clear();
      _rePasswordController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Center(
                  //   child: FlutterLogo(
                  //     size: 150,
                  //     style: FlutterLogoStyle.stacked,
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? '请输入用户名'
                                    : null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: '用户名',
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                            ),
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
                            TextFormField(
                              controller: _emailController,
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? '请输入邮箱'
                                    : null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: '邮箱',
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                            ),
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
                            TextFormField(
                              controller: _passwordController,
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? '请输入密码'
                                    : null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: '密码',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _rePasswordController,
                              validator: (e) {
                                if (e.toLowerCase().trim().isEmpty)
                                  return '请输入确认密码';
                                if (_rePasswordController.text
                                    .toLowerCase()
                                    .trim() !=
                                    _passwordController.text
                                        .toLowerCase()
                                        .trim()) {
                                  return '两次输入密码必须一致';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: '确认密码',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            RaisedButton(
                              onPressed: check,
                              child: Text('注册'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "已经有账号? ",
                        style: TextStyle(
                          letterSpacing: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "登陆",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            letterSpacing: 2,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}