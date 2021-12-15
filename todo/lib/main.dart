// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:flutter/services.dart';
// import 'package:flutterspeechrecognizerifly/flutterspeechrecognizerifly.dart';
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final Flutterspeechrecognizerifly ifly = Flutterspeechrecognizerifly();
//   // final FlutterTts ifly1 = FlutterTts();
//   String _platformVersion = 'Unknown';
//   String _recgonizerRet1 = "";
//   String _recgonizerRet2 = "";
//   String _func = "";
//   String _context = "";
//   String _time = "";
//
//   int state = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     var ret = ifly.init("5ed77343");
//     // var ret1 = ifly1.init("5ed77343");
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await ifly.platformVersion;
//       // platformVersion = await ifly1.platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//
//     });
//   }
//   int getNum(String s){
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//             child: ListView(
//               children: <Widget>[
//                 Text('Running on: $_platformVersion\n'),
//                 Text('有UI语音识别结果: $_recgonizerRet1\n'),
//                 Text('无UI语音识别结果: $_recgonizerRet2\n'),
//                 Text('识别结果: ',style: TextStyle(fontSize: 20,color: Colors.red),),
//                 Text("功能: $_func"),
//                 Text("内容: $_context"),
//                 Text("日期时间: $_time"),
//                 RaisedButton(
//                   onPressed: () async{
//                     setState(() {
//                       _recgonizerRet1 = "";
//                       _recgonizerRet2 = "";
//                       _func = "";
//                       _context="";
//                       _time="";
//                     });
//                     // var ret = await ifly.init("5ed77343");
//                     // print(ret);
//                   },
//                   child: Text("初始化", style: TextStyle(fontSize: 14, color: Colors.blue),),
//                 ),
//                 RaisedButton(
//                   onPressed: () async{
//                     // var ret = await ifly.init("5ed77343");
//                     switch(state) {
//                       case 0:{
//                         _func = "";
//                         _context="";
//                         _time="";
//                         await ifly.tts((Map<String, dynamic> message) async {
//                           print("xuh111");
//                         }, string: "请问:要添加、修改还是删除作业呢？");
//                         print('xuhaidong111');
//                         // TODO 识别功能 OK
//                         break;
//
//                       }
//                       case 1:{
//                         String str = "没听清你说的操作，请重试";
//                         await ifly.start((Map<String, dynamic> message) async {
//
//                           print("flutter onOpenNotification: $message");
//
//                            setState(() {
//                              // 返回 删除 修改 添加 未知功能
//                             _recgonizerRet1 += message["text"];
//                             _func = message["text"];
//                             print("states1"+_recgonizerRet1);
//                             switch(_func){
//                               case "删除":
//                                 str = "请问：删除的作业的内容是什么呢？";
//                                 break;
//                               case "添加":
//                                 str = "请问：添加的作业是什么内容呢？";
//                                 break;
//                               case "修改":
//                                 str = "请问：修改的作业是什么内容呢？";
//                                 break;
//                             }
//                           });
//                           print("states2"+_func+"\n");
//                           await ifly.tts((Map<String, dynamic> message) async {
//                             print("xuh111");
//                           }, string: str);
//                         }, useView: true, step: 1);
//                         print('xuhaidong222');
//                         break;
//                       }
//                       case 2:{
//                         await ifly.start((Map<String, dynamic> message) async {
//                           print("flutter onOpenNotification: $message");
//                           setState(() {
//                             _recgonizerRet1 += message["text"];
//                             _context = message["text"];
//                           });
//                           await ifly.tts((Map<String, dynamic> message) async {
//                             print("xuh111");
//                           }, string: "作业时间是什么时候呢？");
//                         }, useView: true, step: 2);
//                         // TODO 内容
//                         break;
//                       }
//                       case 3:{
//                         await ifly.start((Map<String, dynamic> message) async {
//                           print("flutter onOpenNotification: $message");
//                           setState(() {
//                             _recgonizerRet1 += message["text"];
//                             _time = message["text"];
//                           });
//                         }, useView: true, step: 3);
//                         // TODO 时间
//                         break;
//                       }
//
//                     }
//                     sleep(Duration(microseconds: 500));
//                     print('states=  '+state.toString()+_func.compareTo("未知功能").toString());
//                     state += 1;
//                     if(state==4 || _func.compareTo("未知功能") == 0){
//                       print("intocompare");
//                       state=0;
//                       _func="";
//                     }
//
//                   },
//
//                   child: Text("带UI语音识别", style: TextStyle(fontSize: 14, color: Colors.blue),),
//                 ),
//                 // RaisedButton(
//                 //   onPressed: () async{
//                 //     ifly.start((Map<String, dynamic> message) async {
//                 //       print("flutter onOpenNotification: $message");
//                 //       setState(() {
//                 //         _recgonizerRet2 += message["text"];
//                 //       });
//                 //       // var ret = await ifly.init("5ed77343");
//                 //       // print(ret);
//                 //     }, useView: false);
//                 //
//                 //   },
//                 //   child: Text("无UI语音识别", style: TextStyle(fontSize: 14, color: Colors.blue),),
//                 // ),
//                 RaisedButton(
//                     onPressed: () async{
//                       ifly.tts((Map<String, dynamic> message) async {
//                         print("flutter onOpenNotification: $message");
//                         setState(() {
//                           _recgonizerRet2 += message["text"];
//                         });
//                       }, string: "请问要添加、修改还是删除作业呀？");
//                     },
//                   child: Text("语音合成"),
//                 )
//               ],
//             )
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterspeechrecognizerifly_example/pages/home_page.dart';
import 'package:flutterspeechrecognizerifly_example/routes/Routes.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: Locale('zh'),
      title: "Flutter Demo",
      theme: ThemeData(
        highlightColor: Colors.transparent,//不显示点击button之类的一圈阴影效果
      ),
      // home: HomePage(),
      initialRoute: '/',     //初始化的时候加载的路由
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

