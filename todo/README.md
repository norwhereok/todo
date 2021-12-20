## 基于语音输入的作业管理APP项目说明书_第三次报告

|         项目名称          |                  基于语音输入的任务管理系统                  |
| :-----------------------: | :----------------------------------------------------------: |
|       **项目类型**        |                  基于语音输入的任务管理APP                   |
|       **成员信息**        | 31901028 徐海东<br />31901022 刘    炫<br />31901025 邵育华<br />31901097 金妍池 |
|       **团队组号**        |                   周二上午软件工程——第11组                   |
|  **需求分析_第一次报告**  |     https://www.cnblogs.com/Clearlove-7/p/15586868.html      |
|  **原型设计_第二次报告**  |     https://www.cnblogs.com/Clearlove-7/p/15621155.html      |
| **项目说明书_第三次报告** |     https://www.cnblogs.com/Clearlove-7/p/15694537.html      |

### 一、项目背景

​        在这个快节奏的生活中，任务繁重，每分每秒都显得极为宝贵，因此有效地利用时间、合理地安排个人计划对于每个人来说是必不可少的。对于学生来说也是这样，作业多、时间紧张，一些学生因为这些因素难免会遗漏某些作业。围绕着这点，我们小组试想开发一个以语音输入代替文本输入节约时间为目标的作业管理系统。这样既可以减少文本输入的时间，又可以记录自己作业的截止时间，让自己有个合理的安排。

### 二、系统简介

​        该系统是以语音输入代替文本输入节约时间为目标的作业管理系统。该系统以语音输入为主体，集语音管理作业、手动管理作业等功能于一体，为学生提供一个作业管理平台。

### 三、开发工具

|        模块        | 开发工具 |
| :----------------: | :------: |
|     原型图设计     |   墨刀   |
|       前后端       | Flutter  |
| 语音识别和合成接口 | 科大讯飞 |

### 四、需求分析

#### ★ 语音输入代替文本输入

1. 用户可以通过手动操作即文本输入来管理自己的作业

2. 用户也可以通过语音系统管理模块，来管理自己的作业。

3. 管理作业模块需要包含新建、删除、修改。

### 五、流程图

![image-20211203151503484](https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/image-20211203151503484.png)

### 六、ER图

![image-20211203125930491](https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/image-20211203125930491.png)

|  User用户表   | 字段含义 | Task作业表  | 字段含义 |
| :-----------: | :------: | :---------: | :------: |
|    User_id    |  用户ID  |   Task_id   |  作业ID  |
|   User_name   |  用户名  |   Content   | 作业内容 |
|      Pwd      | 用户密码 | Start_time  | 开始时间 |
|   User_tel    | 联系方式 |  End_time   | 结束时间 |
|   User_mail   | 用户邮箱 | Task_status | 作业状态 |
| Register_time | 注册时间 |             |          |

*  User(用户类)
   * login() 登陆
   * register() 注册
   * info_modify() 用户个人信息(联系方式、邮箱）修改
   * pwd_modify() 密码修改
*  Task(作业类)
   * Task_add() 添加作业
   * Task_del() 删除作业
   * Task_modify() 修改作业内容
   * Task_finish() 完成作业

### 七、时序图

- #### 语音管理模块：


​		用户点击主界面的语音按钮进入语音系统。语音系统会提示需要创建、修改、完成还是删除任务，用户语音输入后，语音系统得知你要的功能。下一步提示你需要输入的内容。

![image-20211203122707149](https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/image-20211203122707149.png)

- #### 文本操作管理模块：


##### 	删除、修改、完成任务操作时序图

![image-20211130231943003](https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/image-20211130231943003.png)

​	**创建任务时序图**

![image-20211130231952617](https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/image-20211130231952617.png)

### 八、数据流图

![image-20211203132536910](https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/image-20211203132536910.png)

### 九、成员分工

|     任务分配     |    人员安排    |
| :--------------: | :------------: |
|     制定分工     |  徐海东、刘炫  |
|   制定项目计划   |    全体成员    |
|    可行性研究    |    全体成员    |
| 安卓端UI初始设计 |  刘炫、徐海东  |
|   安卓端UI搭建   |      刘炫      |
| 安卓端前后端链接 |  徐海东、刘炫  |
|    数据库搭建    |     邵育华     |
|   后端代码实现   |     金妍池     |
|     界面美化     |     金妍池     |
|     软件测试     |     邵育华     |
|   项目方案撰写   |  邵育华、刘炫  |
|     博客撰写     | 金妍池、徐海东 |
|     项目总结     |    全体人员    |

### 十、原型设计

#### **[墨刀链接](https://modao.cc/app/0432091cfd1ecebfe3d8671192aa2626e44c90c6)**

|                           登录界面                           |                          个人信息栏                          |                           注册界面                           |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E7%99%BB%E5%BD%95.png" alt="登录" style="zoom:50%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E4%B8%AA%E4%BA%BA%E4%BF%A1%E6%81%AF%E6%A0%8F.png" alt="个人信息栏" style="zoom:50%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E6%B3%A8%E5%86%8C.png" alt="注册" style="zoom:50%;" /> |
|                     **主界面—全部作业**                      |                    **主界面—未完成作业**                     |                    **主界面—已完成作业**                     |
| <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E4%B8%BB%E7%95%8C%E9%9D%A2-%E5%85%A8%E9%83%A8%E4%BD%9C%E4%B8%9A.png" alt="主界面-全部作业" style="zoom:50%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E4%B8%BB%E7%95%8C%E9%9D%A2-%E6%9C%AA%E5%AE%8C%E6%88%90%E4%BD%9C%E4%B8%9A.png" alt="主界面-未完成作业" style="zoom:50%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E4%B8%BB%E7%95%8C%E9%9D%A2-%E5%B7%B2%E5%AE%8C%E6%88%90%E4%BD%9C%E4%B8%9A.png" alt="主界面-已完成作业" style="zoom:50%;" /> |
|                         **添加作业**                         |                         **修改密码**                         |                        **修改手机号**                        |
| <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E6%B7%BB%E5%8A%A0%E4%BD%9C%E4%B8%9A.png" alt="添加作业" style="zoom:50%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E4%BF%AE%E6%94%B9%E5%AF%86%E7%A0%81.png" alt="修改密码" style="zoom:50%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/%E4%BF%AE%E6%94%B9%E6%89%8B%E6%9C%BA%E5%8F%B7.png" alt="修改手机号" style="zoom:50%;" /> |

### 十一、程序原型

|                           登录界面                           |                          个人信息栏                          |                           注册界面                           |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/EC57A05E36E4111EEBC5674DEC8C74CA.jpg" alt="img" style="zoom:25%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/38454306445F2F7867BF3B43EC9A0E54.jpg" alt="img" style="zoom:25%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/A4CA0C9B9BE1EF9F88D4B65E0311B227.jpg" alt="img" style="zoom:25%;" /> |
|                     **主界面—全部作业**                      |                    **主界面—未完成作业**                     |                    **主界面—已完成作业**                     |
| <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/AD375DCC161FD23D8CA5831EF8B92B9B-16399270702631.jpg" alt="img" style="zoom:25%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/647370B6AA7DF75AD1B1451CE66545D7.jpg" alt="img" style="zoom:25%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/E438E050857668638E8142B86E4C780A.jpg" alt="img" style="zoom:25%;" /> |
|                         **添加作业**                         |                         **选择时间**                         |                         **选择日期**                         |
| <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/B24F0E05E5F0A7EFC318BFEE2FB788F3.jpg" alt="img" style="zoom:25%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/1EBA2718168B2FE7CAE2C6B93A56EF80.jpg" alt="img" style="zoom:25%;" /> | <img src="https://ximo-1306450197.cos.ap-shanghai.myqcloud.com/markdown/C9B5F9337EE1E7BA6115620B8A3839ED.jpg" alt="img" style="zoom:25%;" /> |

### 

### 十二、APP Code实现与功能分析

代码上传至：https://github.com/norwhereok/todo
