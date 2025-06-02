// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:myproject2025/screens/addform.dart';

import '../modals/person.dart';
import 'package:google_fonts/google_fonts.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: data[index].job.color),
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
                                      'คุณกดที่ ${data[index].name} แล้ว!'),
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
                            data[index].name,
                            style: GoogleFonts.kodchasan(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "อายุ ${data[index].age} ปี , อาชีพ : ${data[index].job.title}",
                          style: GoogleFonts.kodchasan(
                              fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    Image.asset(
                      data[index].job.image,
                      width: 70,
                      height: 70,
                    )
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
