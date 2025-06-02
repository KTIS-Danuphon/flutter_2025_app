import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject2025/main.dart';
import 'package:myproject2025/modals/person.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formkey = GlobalKey<FormState>();
  // ignore: unused_field
  String _name = '';
  int _age = 29;
  Job _job = Job.vampire;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Title2",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          title: const Text("แบบฟอร์มกรอกข้อมูล"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 20,
                      decoration: const InputDecoration(
                          label: Text(
                        "ชื่อ",
                        style: TextStyle(fontSize: 20),
                      )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "กรอกชื่อ";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly, // ✅ อนุญาตเฉพาะตัวเลข 0-9
                      ],
                      decoration: const InputDecoration(
                          label: Text(
                        "อายุ",
                        style: TextStyle(fontSize: 20),
                      )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "กรอกอายุ";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _age = int.parse(value.toString());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        value: _job,
                        decoration: const InputDecoration(
                            label: Text(
                          "อาชีพ",
                          style: TextStyle(fontSize: 20),
                        )),
                        items: Job.values.map((key) {
                          return DropdownMenuItem(
                              value: key, child: Text("อาชีพ ${key.title}"));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _job = value!;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    FilledButton(
                        // onPressed: () {
                        //   if(_formkey.currentState!.validate()){
                        //      _formkey.currentState!.validate();
                        //   _formkey.currentState!.save();
                        //   data.add(Person(name: _name, age: _age, job: _job));
                        //   _formkey.currentState!.reset();

                        //   print(data.length);
                        //   }

                        // }
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();

                            // เพิ่มข้อมูล
                            data.add(Person(name: _name, age: _age, job: _job));

                            _formkey.currentState!.reset();

                            // แสดง Alert แจ้งบันทึกข้อมูล
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("บันทึกข้อมูล"),
                                  content: const Text("บันทึกข้อมูลสำเร็จ"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // ปิด Alert ก่อน
                                        // ไปยังหน้าใหม่
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyApp()),
                                        );
                                      },
                                      child: const Text("ตกลง"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          "บันทึก",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ))),
      ),
    );
  }
}
