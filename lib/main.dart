import 'package:flutter/material.dart';
import 'package:test/cart.dart';
import 'package:test/home.dart';
import 'package:test/profile.dart';

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
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      backgroundColor: Colors.teal,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (tappedIndex) {
          setState(() {
            currentIndex = tappedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'),
        ],
      ),
      drawer: Drawer(
        child: HomeScreen(),
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Wrap(
      //       children: [
      //         for (int i = 0; i < 50; i++)
      //           Container(
      //               color: i % 2 == 0 ? Colors.black : Colors.white,
      //               height: MediaQuery.of(context).size.width / 5,
      //               width: MediaQuery.of(context).size.width / 5),
      //       ],
      //     ),
      //   ),
      // ),
      // body: SafeArea(
      //   child: Container(
      //     // color: Colors.grey,
      //     width: double.maxFinite,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       // crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         Container(
      //           color: Colors.red,
      //           height: 100,
      //           width: 100,
      //         ),
      //         Container(
      //           color: Colors.blue,
      //           height: 100,
      //           width: 100,
      //         ),
      //         Container(
      //           color: Colors.yellow,
      //           height: 100,
      //           width: 100,
      //         ),
      //         Container(
      //           color: Colors.green,
      //           height: 100,
      //           width: 100,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   var count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.blue,
//             // shape:BoxShape.circle
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//               color: Colors.red,
//               // shape:BoxShape.circle
//             ),
//             padding: EdgeInsets.all(20),
//             margin: EdgeInsets.all(20),
//             child: Container(
//               color: Colors.black,
//               child: Text(
//                 'My Container',
//                 style: TextStyle(
//                   fontSize: 40,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       // body: Column(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     const Center(
//       //       child: Text(
//       //         'The count is :',
//       //         style: TextStyle(
//       //           fontSize: 50,
//       //           color: Colors.blue,
//       //         ),
//       //       ),
//       //     ),
//       //     Center(
//       //       child: Text(
//       //         count.toString(),
//       //         style: TextStyle(
//       //           fontSize: 50,
//       //         ),
//       //       ),
//       //     ),
//       // TextButton(
//       //   onPressed: () {
//       //     print(count);

//       //     setState(() {
//       //       count++;
//       //     });

//       //     print(count);
//       //   },
//       //   child: Text(
//       //     'Click',
//       //     style: TextStyle(
//       //       fontSize: 50,
//       //       color: Colors.red,
//       //     ),
//       //   ),
//       // )
//       //   ],
//       // ),
//       appBar: AppBar(
//         leading: const Icon(Icons.menu),
//         title: const Text('My App'),
//         centerTitle: true,
//         actions: const [
//           Icon(Icons.search),
//           Icon(Icons.more_vert),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   child: Icon(Icons.add),
//       //   onPressed: () {
//       //     setState(() {
//       //       count++;
//       //     });
//       //   },
//       // ),
//     );
//   }
// }

