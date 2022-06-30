import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:firedart/auth/user_gateway.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter_test2/attribute.dart';
import 'package:flutter_test2/loadFromXml.dart';
import 'package:xml/xml.dart' as xml;

import 'package:flutter/material.dart';

import './second.dart';
import './database.dart';

import './items.dart';
import 'package:loading_indicator/loading_indicator.dart';

class FBLoad extends StatefulWidget {
  DocumentReference userDB;
  FBLoad({required this.userDB, Key? key}) : super(key: key);

  @override
  State<FBLoad> createState() => _FBLoadState();
}

class _FBLoadState extends State<FBLoad> {
  //static bool isRead = false;

  List<Items> _itemlist = [];
  List<Attribute> listS = [];
  List<String> listStemp = [];

  Future<List<Items>> fetchItems(BuildContext context) async {
    debugPrint('fetchItems Starting...');

    await Future.delayed(const Duration(seconds: 1));
    SQLHelper.dbDir = 'firebase.db';
    CollectionReference temp5 = SQLHelper.userFB!.collection("Types");
    final temp6 = await temp5.get();

    var itemslisttemp2 =
        jsonDecode(temp6.first.map.values.first.toString()) as List;

    List<Attribute> temp3 =
        itemslisttemp2.map((tagJson) => Attribute.fromJson(tagJson)).toList();

    listS = temp3;

    CollectionReference temp7 = SQLHelper.userFB!.collection("Items");
    final temp = await temp7.get();

    List<Items> temp2 = [];
    temp.asMap().forEach((index, element) {
      temp2.add(Items());
      var itemslisttemp =
          jsonDecode(element.map.values.first.toString()) as List;
      temp2[index].item =
          itemslisttemp.map((tagJson) => Attribute.fromJson(tagJson)).toList();
    });

    //List<Items> temp2 = [];
    // temp.asMap().forEach((index, element) {
    //   temp2.add(Items());
    //   //print(element.values.toList().last);
    //   var itemslisttemp = jsonDecode(element.values.last.toString()) as List;
    //   temp2[index].item =
    //       itemslisttemp.map((tagJson) => Attribute.fromJson(tagJson)).toList();
    // });

    //temp2.add(Items());

    if (temp2.isEmpty) {
      Items temp4 = Items();
      temp4.addItems("Name", "Delete after adding more items");
      temp2.add(temp4);
    }
    if (listS.isEmpty) {
      Attribute temp5 = Attribute("DeleteAfterwards", "Name");
      listS.add(temp5);
    }
    return temp2;
  }

  Future<List<Items>> getItems(BuildContext context) async {
    _itemlist = await fetchItems(context);
    // String jsonItems = jsonEncode(_itemlist[0].item);
    // var itemslisttemp = jsonDecode(jsonItems) as List;
    // _itemlist[0].item =
    //     itemslisttemp.map((tagJson) => Attribute.fromJson(tagJson)).toList();
    //print(_itemlist[0].item);
    return _itemlist;
  }

  @override
  Widget build(BuildContext context) {
    bool fetchingFinised = false;
    return MaterialApp(
        home: Scaffold(
      body: WindowBorder(
        width: 1,
        color: Colors.white,
        child: Column(
          children: [
            Hero(
              tag: "winbar",
              child: Container(
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
            ),
            Expanded(
              child: FractionallySizedBox(
                  heightFactor: 0.7,
                  widthFactor: 0.7,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 5,
                              color: const Color.fromARGB(255, 16, 82, 249)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder(
                              future: getItems(context),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Column(
                                      children: [
                                        Expanded(flex: 2, child: Container()),
                                        const Expanded(
                                          flex: 2,
                                          child: LoadingIndicator(
                                            indicatorType: Indicator.ballPulse,
                                            colors: [
                                              Color.fromARGB(255, 16, 82, 249)
                                            ],
                                            strokeWidth: 0.5,
                                          ),
                                        ),
                                        const Expanded(
                                            flex: 1,
                                            child: AutoSizeText(
                                              "Loading file...",
                                              style: TextStyle(fontSize: 30),
                                              maxFontSize: 30,
                                              minFontSize: 15,
                                            )),
                                        Expanded(flex: 1, child: Container()),
                                      ],
                                    );
                                  default:
                                    if (snapshot.hasError)
                                      return Text('Error: ${snapshot.error}');
                                    else {
                                      // TextEditingController myController =
                                      //     TextEditingController();
                                      // List<int> indexList = [];
                                      // listS.asMap().forEach((index, element) {
                                      //   if (element.atribute == "Null") {
                                      //     indexList.add(index);
                                      //   }
                                      // });
                                      // if (indexList.isNotEmpty) {
                                      //   return Container(
                                      //       child: Row(
                                      //     children: [
                                      //       Text(listS[indexList[0]]
                                      //           .name
                                      //           .toString()),
                                      //       Expanded(
                                      //         child: TextField(
                                      //           controller: myController,
                                      //         ),
                                      //       ),
                                      //       IconButton(
                                      //           onPressed: () {
                                      //             listS[indexList[0]].atribute =
                                      //                 myController.text;
                                      //             setState(() {
                                      //               indexList.removeAt(0);
                                      //             });
                                      //           },
                                      //           icon: const Icon(
                                      //               Icons.turn_right_sharp)),
                                      //     ],
                                      //   ));
                                      // } else {
                                      //   return IconButton(
                                      //     icon: Icon(Icons.arrow_forward),
                                      //     onPressed: () {
                                      //       Navigator.pushReplacement(
                                      //         context,
                                      //         PageRouteBuilder(
                                      //           pageBuilder: (context,
                                      //                   animation4,
                                      //                   animation2) =>
                                      //               SecondPage(
                                      //             listitems: _itemlist,
                                      //             listd: _itemlist,
                                      //             listS: listS,
                                      //             dropdownValue: listS[0],
                                      //           ),
                                      //           transitionDuration:
                                      //               Duration.zero,
                                      //           reverseTransitionDuration:
                                      //               Duration.zero,
                                      //         ),
                                      //       );
                                      //     },
                                      //   );
                                      // }
                                      return IconButton(
                                        icon: Icon(Icons.arrow_forward),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation4,
                                                      animation2) =>
                                                  SecondPage(
                                                listitems: _itemlist,
                                                listd: _itemlist,
                                                listS: listS,
                                                dropdownValue: listS[0],
                                              ),
                                              transitionDuration: Duration.zero,
                                              reverseTransitionDuration:
                                                  Duration.zero,
                                            ),
                                          );
                                        },
                                      );
                                      //
                                    }
                                }
                              },
                            ),
                          ],
                        ),
                      ))),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 21, 24),
    ));
  }
}
