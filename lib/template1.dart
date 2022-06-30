import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/main.dart';
import 'package:hovering/hovering.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NewXML1 extends StatefulWidget {
  final group1 = AutoSizeGroup();
  int isSelected = -1;
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HoverButton(
                                      //minWidth: 300,
                                      onpressed: () {
                                        if (widget.isSelected != 0) {
                                          setState(() {
                                            widget.isSelected = 0;
                                          });
                                        }
                                      },
                                      color: widget.isSelected != 0
                                          ? const Color.fromARGB(
                                              255, 16, 82, 249)
                                          : const Color.fromARGB(
                                              255, 17, 21, 24),
                                      hoverColor:
                                          const Color.fromARGB(255, 17, 21, 24),
                                      textColor: widget.isSelected != 0
                                          ? const Color.fromARGB(
                                              255, 17, 21, 24)
                                          : const Color.fromARGB(
                                              255, 16, 82, 249),
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: widget.isSelected != 0
                                                ? const Color.fromARGB(
                                                    255, 17, 21, 24)
                                                : const Color.fromARGB(
                                                    255, 16, 82, 249),
                                            width: 5.0),
                                      ),
                                      hoverShape: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 16, 82, 249),
                                            width: 5.0),
                                      ),
                                      hoverTextColor: const Color.fromARGB(
                                          255, 16, 82, 249),
                                      padding: const EdgeInsets.all(20.0),
                                      hoverPadding: const EdgeInsets.all(20.0),

                                      //child: Expanded(
                                      child: AutoSizeText(
                                        "Load .xml file",
                                        group: widget.group1,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 35),
                                        minFontSize: 10,
                                        maxFontSize: 35,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HoverButton(
                                      //minWidth: 300,
                                      onpressed: () {
                                        if (widget.isSelected != 1) {
                                          setState(() {
                                            widget.isSelected = 1;
                                          });
                                        }
                                      },
                                      color: widget.isSelected != 1
                                          ? const Color.fromARGB(
                                              255, 16, 82, 249)
                                          : const Color.fromARGB(
                                              255, 17, 21, 24),
                                      hoverColor:
                                          const Color.fromARGB(255, 17, 21, 24),
                                      textColor: widget.isSelected != 1
                                          ? const Color.fromARGB(
                                              255, 17, 21, 24)
                                          : const Color.fromARGB(
                                              255, 16, 82, 249),
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: widget.isSelected != 1
                                                ? const Color.fromARGB(
                                                    255, 17, 21, 24)
                                                : const Color.fromARGB(
                                                    255, 16, 82, 249),
                                            width: 5.0),
                                      ),
                                      hoverShape: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 16, 82, 249),
                                            width: 5.0),
                                      ),
                                      hoverTextColor: const Color.fromARGB(
                                          255, 16, 82, 249),
                                      padding: const EdgeInsets.all(20.0),
                                      hoverPadding: const EdgeInsets.all(20.0),

                                      //child: Expanded(
                                      child: AutoSizeText(
                                        "Load local file",
                                        group: widget.group1,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 35),
                                        minFontSize: 10,
                                        maxFontSize: 35,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HoverButton(
                                      //minWidth: 300,
                                      onpressed: () {
                                        if (widget.isSelected != 2) {
                                          setState(() {
                                            widget.isSelected = 2;
                                          });
                                        }
                                      },
                                      color: widget.isSelected != 2
                                          ? const Color.fromARGB(
                                              255, 16, 82, 249)
                                          : const Color.fromARGB(
                                              255, 17, 21, 24),
                                      hoverColor:
                                          const Color.fromARGB(255, 17, 21, 24),
                                      textColor: widget.isSelected != 2
                                          ? const Color.fromARGB(
                                              255, 17, 21, 24)
                                          : const Color.fromARGB(
                                              255, 16, 82, 249),
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: widget.isSelected != 2
                                                ? const Color.fromARGB(
                                                    255, 17, 21, 24)
                                                : const Color.fromARGB(
                                                    255, 16, 82, 249),
                                            width: 5.0),
                                      ),
                                      hoverShape: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 16, 82, 249),
                                            width: 5.0),
                                      ),
                                      hoverTextColor: const Color.fromARGB(
                                          255, 16, 82, 249),
                                      padding: const EdgeInsets.all(20.0),
                                      hoverPadding: const EdgeInsets.all(20.0),

                                      //child: Expanded(
                                      child: AutoSizeText(
                                        "Load Firebase",
                                        group: widget.group1,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 35),
                                        minFontSize: 10,
                                        maxFontSize: 35,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HoverButton(
                                      //minWidth: 300,
                                      onpressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation4,
                                                    animation2) =>
                                                Home(),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                        );
                                      },
                                      color: const Color.fromARGB(
                                          255, 16, 82, 249),
                                      hoverColor:
                                          const Color.fromARGB(255, 17, 21, 24),
                                      textColor:
                                          const Color.fromARGB(255, 17, 21, 24),
                                      shape: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(255, 17, 21, 24),
                                            width: 5.0),
                                      ),
                                      hoverShape: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 16, 82, 249),
                                            width: 5.0),
                                      ),
                                      hoverTextColor: const Color.fromARGB(
                                          255, 16, 82, 249),
                                      padding: const EdgeInsets.all(20.0),
                                      hoverPadding: const EdgeInsets.all(20.0),

                                      child: AutoSizeText(
                                        "back",
                                        maxLines: 1,
                                        group: widget.group1,
                                        style: TextStyle(fontSize: 50),
                                        minFontSize: 10,
                                        maxFontSize: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: AnimatedOpacity(
                                  opacity: widget.isSelected != -1 ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 25),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 17, 21, 24),
                                          border: Border.all(
                                              width: 5,
                                              color: const Color.fromARGB(
                                                  255, 16, 82, 249))),
                                      child: FittedBox(child: Text("test")),
                                    ),
                                  ),
                                )),
                            // Expanded(
                            //   flex: 5,
                            //   child: Column(
                            //     children: [
                            //       Expanded(
                            //           child: AnimatedOpacity(
                            //               opacity: widget.isSelected != -1
                            //                   ? 1.0
                            //                   : 0.0,
                            //               duration:
                            //                   const Duration(milliseconds: 500),
                            //               child: Expanded(
                            //                 child: Container(
                            //                   color: Colors.red,
                            //                   child: Text("test"),
                            //                 ),
                            //               )))
                            //     ],
                            //   ),
                            // ),
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
