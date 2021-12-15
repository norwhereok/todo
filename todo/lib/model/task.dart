class Task{
  int id;
  String content;
  String username;
  DateTime endTime;
  bool isFinish;

  Task({this.id, this.username, this.content, this.endTime, this.isFinish});

  Task.fromMap(Map<String,dynamic> map){
    this.id = map["id"];
    this.username = map["username"];
    this.content = map["content"];
    this.endTime = DateTime.parse(map["endTime"]);
    this.isFinish = map["isFinish"]==1;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'content': content,
      'endTime': endTimeStr,
      'isFinish': isFinishInt
    };
  }

  String get endTimeStr {
    return "${this.endTime.year.toString()}-${this.endTime.month.toString().padLeft(2, '0')}-${this.endTime.day.toString().padLeft(2, '0')} ${this.endTime.hour.toString().padLeft(2, '0')}:${this.endTime.minute.toString().padLeft(2, '0')}";
  }

  int get isFinishInt {
    return this.isFinish? 1:0 ;
  }

  @override
  String toString() {
    return 'Task{id: $id, username: $username, content: $content, endTime: $endTime, isFinish: $isFinish}';
  }
}