import 'package:flutter/material.dart';

enum Job {
  programmerlight(title:"โปรแกรมเมอร์ขาว",image: "assets/images/man-technologist-light-skin-tone.png",color: Colors.black12),
  programmerdark(title:"โปรแกรมเมอร์ดำ",image: "assets/images/man-technologist-dark-skin-tone.png",color: Colors.black45),
  mage(title:"เมจ",image: "assets/images/man-mage.png",color: Colors.blueAccent),
  vampire(title:"แวมไพร์",image: "assets/images/vampire-light-skin-tone.png",color: Colors.redAccent);
  
  const Job({required this.title,required this.image,required this.color});
  final String title;
  final String image;
  final Color color;
}

class Person {
  Person({required this.name, required this.age, required this.job});
  String name;
  int age;
  Job job; //รูปแบบ enum
}

//<Person> เก็บข้อมูล object จาก class Person เท่านั้น
List<Person> data = [
  Person(name: "เกม", age: 27, job: Job.programmerlight),
  Person(name: "บอล", age: 24, job: Job.programmerdark),
  Person(name: "เบรฟ", age: 25, job: Job.vampire),
];
