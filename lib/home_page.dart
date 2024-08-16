// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:budget_buddy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  IconData toIconIndex(String iconReference) {
    //IconData iconRefrence = Icons.bedroom_baby_rounded;
    IconData iconResult = Icons.shopping_bag;
    // print("this is function icon");
    if (iconReference == '1') {
      iconResult = Icons.shopping_bag;
    } else if (iconReference == '2') {
      iconResult = Icons.house;
    } else if (iconReference == '3') {
      iconResult = Icons.restaurant;
    } else if (iconReference == '4') {
      iconResult = Icons.wallet_giftcard;
    } else if (iconReference == '5') {
      iconResult = Icons.phone;
    } else if (iconReference == '6') {
      iconResult = Icons.fitness_center;
    } else if (iconReference == '7') {
      iconResult = Icons.car_repair;
    }
    // print('this is toiconindex $iconReference');
    return iconResult;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Start the animation when the card is built
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List items = [
    {
      "title": 'hello everyone1',
      "icon": Icon(Icons.shopping_bag),
      "price": '\$240'
    },
    {
      "title": 'hello everyone2',
      "icon": Icon(Icons.shopping_bag),
      "price": '\$240'
    },
    {
      "title": 'hello everyone3',
      "icon": Icon(Icons.shopping_bag),
      "price": '\$240'
    },
    {
      "title": 'hello everyone4',
      "icon": Icon(Icons.shopping_bag),
      "price": '\$240'
    }
  ];

  List items2 = [
    {"title": 'saleem 1', "icon": Icon(Icons.shopping_bag), "price": '\$240'},
    {"title": 'saleem 2', "icon": Icon(Icons.shopping_bag), "price": '\$240'},
    {"title": 'saleem 3', "icon": Icon(Icons.shopping_bag), "price": '\$240'},
    {"title": 'saleem 4', "icon": Icon(Icons.shopping_bag), "price": '\$240'}
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: background_color,
          appBar: AppBar(
            backgroundColor: Colors.green,
            leading: //Logo (replace this with your logo widget)
                Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'lib/assets/logo.png',
                      color: Colors.white,
                    )),
            title: Column(
              children: [
                Text(
                  'Remaining Balance:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$569',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            actions: [
              Column(children: [
                Text(
                  'Target Amount:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$500',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ])
            ],
          ),
          body: SafeArea(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2, //flex: 2,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      // transform: Matrix4.rotationZ(0.3),
                      // borderRadius: BorderRadius.circular(10.0)),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: Colors.blue,
                            width: 2), //Color.fromARGB(255, 19, 7, 7),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      // margin: EdgeInsets.all(20.0),
                      // padding: EdgeInsets.all(30),
                      child: Center(
                        child: Text('Your spending this month is: \$240',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      )),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4, //flex: 2,
                  child: LayoutBuilder(builder: ((context, constraints) {
                    return ListView.builder(
                        itemCount: items.length, // The total number of items
                        itemBuilder: (BuildContext context, int index) {
                          return ScaleTransition(
                            scale: _scaleAnimation,
                            child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.blue,
                                        width:
                                            2), //Color.fromARGB(255, 19, 7, 7),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(items[index]["title"],
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold)),
                                      Text(items[index]["price"],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.blue,
                                        width:
                                            2), //Color.fromARGB(255, 19, 7, 7),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(items[index]["title"],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                        });
                  })),
                ),
              ]))),
    );
    //);
  }
}
