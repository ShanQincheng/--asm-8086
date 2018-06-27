# Grade-Management-Module

[![License](https://img.shields.io/crates/l/rustc-serialize.svg)](https://raw.githubusercontent.com/ShanQincheng/jmuSupplicant/master/LICENSE)

### 8086汇编语言编写的，成绩管理模块

## Usage

完成学生的姓名和成绩输入。  
计算出平均成绩，并显示出来。  
其中，及格的成绩用蓝色显示，不及格的成绩用红色显示。  

  
输入界面参考如下:  
  "是否需要输入?"  
  "请输入学生姓名:"  
  "请输入学生成绩:”。  

## Design Principle 
1. 数据段设置姓名缓冲区，及格成绩的字符串缓冲区，不及格成绩的字符串缓冲区，四门成绩的存储单元，平均成绩的存储单元。
2. 用户输入的姓名字符串存储到姓名缓冲区中，将用户输入的四门成绩分别存放到相应的存储单元中，计算出四门成绩的平均成绩存放到平均成绩的存储单元中。筛选出及格成绩与不及格成绩，分别将及格成绩以字符串形式存入及格成绩的字符串缓冲区，不及格成绩以字符串形式存入不及格成绩的字符串缓冲区。
3. 印输出学生姓名，换行打印输出所有成绩，换行打印输出黑底红字属性的不及格成绩字符串，换行打印输出黑底蓝字属性的及格成绩字符串，换行打印输出平均成绩。


## Flow diagram
![flow diagram pic](https://github.com/ShanQincheng/Grade-Management-Module/blob/master/images/flow_diagram.png)

## Running Example
![running example pic](https://github.com/ShanQincheng/Grade-Management-Module/blob/master/images/running_example.png)

### License

Apache version 2.0
