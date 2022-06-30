import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewXML1 extends StatefulWidget {
  NewXML1({Key? key}) : super(key: key);

  @override
  State<NewXML1> createState() => __Newxml1();
}

class __Newxml1 extends State<NewXML1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: WindowBorder(
        width: 2,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 16, 82, 249),
              child: WindowTitleBarBox(
                  child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  MinimizeWindowButton(),
                  MaximizeWindowButton(),
                  CloseWindowButton(),
                ],
              )),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 21, 24),
    ));
  }
}
