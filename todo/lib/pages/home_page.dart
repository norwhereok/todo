import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterspeechrecognizerifly/flutterspeechrecognizerifly.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterspeechrecognizerifly_example/model/task.dart';
import 'package:flutterspeechrecognizerifly_example/pages/detail_task.dart';
import 'package:flutterspeechrecognizerifly_example/utils/db_helper.dart';
import 'package:flutterspeechrecognizerifly_example/utils/toast.dart';
import 'package:flutterspeechrecognizerifly_example/utils/task_dao.dart';
import 'package:flutterspeechrecognizerifly_example/pages/sign_in/login.dart';
import 'add_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final Flutterspeechrecognizerifly ifly = Flutterspeechrecognizerifly();
  String _platformVersion = 'Unknown';
  String _recgonizerRet1 = "";
  String _recgonizerRet2 = "";
  String _func = "";
  String _context = "";
  String _time = "";

  int state = 0;
  String email = '';
  String username = '';
  String password = '';
  String phone = '';
  String nickname = '';
  List<Task> tasks = [];
  TaskDao taskDao;
  DatabaseHelper db = DatabaseHelper();

  final List<Tab> _tabs = <Tab>[
    Tab(text: "全部"),
    Tab(text: "未完成"),
    Tab(text: "已完成"),
  ];
  var _tabController;

  void getDataPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    username = pref.getString('username');
    var result = await db.userinfo(username);
    setState(() {
      username = pref.getString('username');
      email = result.email;
      phone = result.phone;
      nickname = result.nickname;
    });
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  void initState() {
    getDataPref();
    super.initState();
    // initPlatformState();
    var ret = ifly.init("5ed77343");
    taskDao = TaskDao();
    _tabController = TabController(vsync: this, length: _tabs.length);
    taskDao.tasks(username).then((value) {
      setState(() {
        tasks = value;
      });
    });
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          taskDao.tasks(username).then((value) {
            setState(() {
              tasks = value;
            });
          });
          break;
        case 1:
          taskDao.tasksWhere(0, username).then((value) {
            setState(() {
              tasks = value;
            });
          });
          break;
        case 2:
          taskDao.tasksWhere(1, username).then((value) {
            setState(() {
              tasks = value;
            });
          });
          break;
      }
    });

    taskDao.tasks(username).then((value) {
      setState(() {
        tasks = value;
      });
    });
  }

  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     platformVersion = await ifly.platformVersion;
  //     // platformVersion = await ifly1.platformVersion;
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () => _jumpToAddTaskPage(context),
          )
        ],
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text("$username"),
                  accountEmail: Text(dateTime.toString().substring(0, 19)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/3.png"),
                    // backgroundImage: NetworkImage("https://www.itying.com/images/flutter/3.png"),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/2.png"),
                    fit: BoxFit.cover,
                  )),
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.face)),
              title: Text("昵称：$nickname"),
              onTap: () {
                // Navigator.of(context).pop();  //隐藏侧边栏
                Navigator.pushNamed(context, '/nickname');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.mail)),
              title: Text("邮箱：$email"),
              onTap: () {
                // Navigator.of(context).pop();  //隐藏侧边栏
                Navigator.pushNamed(context, '/email');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.phone)),
              title: Text("手机号：$phone"),
              onTap: () {
                // Navigator.of(context).pop();  //隐藏侧边栏
                Navigator.pushNamed(context, '/phone');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.android)),
              title: Text("版本号：V0.1"),
            ),
            Divider(),
            SizedBox(height: 50),
            RaisedButton(
              child: Text('更改密码'),
              // 背景颜色
              color: Colors.blue,
              // 文字颜色
              textColor: Colors.white,
              // 按钮阴影
              elevation: 10,
              onPressed: () {
                Navigator.pushNamed(context, '/pwd');
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
                child: Text('退出登陆'),
                // 背景颜色
                color: Colors.blue,
                // 文字颜色
                textColor: Colors.white,
                // 按钮阴影
                elevation: 10,
                onPressed: logout
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.mic,
          size: 40,
        ),
        // 点击事件
        onPressed: () async {
          switch (state) {
            case 0:
              {
                _func = "";
                _context = "";
                _time = "";
                await ifly.tts(string: "请问:要添加、修改还是删除作业呢？");
                print('xuhaidong111');
                // TODO 识别功能 OK
                break;
              }
            case 1:
              {
                String str = "没听清你说的操作，请重试";
                await ifly.start((Map<String, dynamic> message) async {
                  print("flutter onOpenNotification: $message");

                  setState(() {
                    // 返回 删除 修改 添加 未知功能
                    _recgonizerRet1 += message["text"];
                    _func = message["text"];
                    print("states1" + _recgonizerRet1);
                    switch (_func) {
                      case "删除":
                        str = "请问：删除的作业的内容是什么呢？";
                        break;
                      case "添加":
                        str = "请问：添加的作业是什么内容呢？";
                        break;
                      case "修改":
                        str = "请问：修改的作业是什么内容呢？";
                        break;
                    }
                  });
                  if (_func == "未知功能") {
                    state = 0;
                  }
                  print("states2" + _func + "\n");
                  await ifly.tts(string: str);
                }, useView: true, step: 1);
                print('xuhaidong222');
                break;
              }
            case 2:
              {
                await ifly.start((Map<String, dynamic> message) async {
                  print("flutter onOpenNotification: $message");
                  setState(() {
                    _recgonizerRet1 += message["text"];
                    _context = message["text"];
                  });
                  await ifly.tts(string: "作业时间是什么时候呢？");
                }, useView: true, step: 2);
                // TODO 内容
                break;
              }
            case 3:
              {
                await ifly.start((Map<String, dynamic> message) async {
                  print("flutter onOpenNotification: $message");
                  setState(() {
                    _recgonizerRet1 += message["text"];
                    _time = message["text"];
                  });
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('context', _context);
                  pref.setString('time', _time);
                  print("内容：$_context");
                  print("时间：$_time");
                  print("马上跳转");
                  Navigator.pushNamed(context, '/add',
                      arguments: {"context": _context, "time": _time});
                }, useView: true, step: 3);

                // TODO 时间
                break;
              }
          }
          ;
          state += 1;
          print('states=  ' +
              state.toString() +
              _func.compareTo("未知功能").toString());
          if (state == 4 || _func.compareTo("未知功能") == 0) {
            print("intocompare");
            state = 0;
            _func = "";
          }
        },
        // 背景颜色
        // backgroundColor: Colors.yellow,
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => _jumpToDetailPage(context, index),
            title: _buildContent(index),
            subtitle: Text('截止时间:${tasks[index].endTimeStr}'),
            leading: _buildIsFinish(index),
            trailing: _buildDelete(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildContent(index) {
    return Text(
      tasks[index].content,
      style: TextStyle(fontSize: 18),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildIsFinish(index) {
    return GestureDetector(
      child: tasks[index].isFinish
          ? Icon(Icons.check_circle)
          : Icon(Icons.check_circle_outline),
      onTap: () {
        tasks[index].isFinish = !tasks[index].isFinish;
        taskDao.updateTask(tasks[index], username);
        if (_tabController.index != 0) {
          tasks.removeAt(index);
        }
        setState(() {});
      },
    );
  }

  Widget _buildDelete(index) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        taskDao.deleteTask(tasks[index].id, username);
        setState(() {
          tasks.removeAt(index);
        });
        Toast.toast(context, msg: "删除成功！", position: ToastPostion.top);
      },
    );
  }

  void _jumpToAddTaskPage(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => AddTaskPage()))
        .then((value) {
      taskDao.tasks(username).then((value) {
        setState(() {
          tasks = value;
        });
      });
    });
  }

  void _jumpToDetailPage(context, index) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (ctx) => DetailPage(taskDao, tasks[index])))
        .then((res) {
      taskDao.tasks(username).then((value) {
        setState(() {
          tasks = value;
        });
      });
    });
  }
}
