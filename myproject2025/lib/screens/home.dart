import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                // print("btn click");
              },
              child: const Text(
                "ClickMe",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 10,
          ),
          FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
              onPressed: () {},
              child: const Text("ClickMe",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  side: const BorderSide(color: Colors.red, width: 2)),
              onPressed: () {},
              child: const Text("ClickMe",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white),
              onPressed: () {},
              child: const Text("ClickMe",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
