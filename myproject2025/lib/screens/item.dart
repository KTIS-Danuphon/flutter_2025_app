// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myproject2025/screens/addform.dart';

import '../modals/person.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  List data = [];

  @override
  void initState() {
    super.initState();
    select(); // เรียกเมื่อเริ่ม
  }

  void select() async {
    final url = Uri.parse(
        "http://172.20.6.74:8081/php_api_flutter/crud_data/data_farm_request_login.php");

    try {
      final response = await http.post(
        url,
        body: {"token": "get_data", "user_id": "123", "other": "test value"},
      );

      //print("RAW RESPONSE: ${response.body}"); // <== ตรงนี้จะเห็นข้อมูลที่ PHP ส่งกลับ

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse is Map && jsonResponse.containsKey("data1")) {
          setState(() {
            data = jsonResponse["data1"];
          });
        } else {
          // print("JSON ไม่ได้มี key 'data1'");
        }
      } else {
        // print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // print("Connection error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue),
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('แจ้งเตือน'),
                                  content: Text(
                                      "คุณกดที่ ${data[index]['name']} แล้ว!"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('ปิด'),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // ปิด dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            data[index]['name'],
                            style: GoogleFonts.kodchasan(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "อายุ ${data[index]['age']} ปี , อาชีพ : ${data[index]['job']}",
                          style: GoogleFonts.kodchasan(
                              fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    // Image.asset(
                    // data[index].job,
                    // width: 70,
                    // height: 70,
                    // )
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddForm()));
              },
              icon: const Icon(
                Icons.add,
                size: 40,
                color: Colors.blue,
              )),
        )
      ],
    );
  }
}
