import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'The count is :',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     print(count);

          //     setState(() {
          //       count++;
          //     });

          //     print(count);
          //   },
          //   child: Text(
          //     'Click',
          //     style: TextStyle(
          //       fontSize: 50,
          //       color: Colors.red,
          //     ),
          //   ),
          // )
        ],
      ),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('My App'),
        centerTitle: true,
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}
