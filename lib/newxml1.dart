import 'dart:ffi';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:expandable/expandable.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firedart/auth/token_store.dart';
import 'package:firedart/auth/user_gateway.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/database.dart';
import 'package:flutter_test2/loadFromDB.dart';
import 'package:flutter_test2/loadFromFB.dart';
import 'loadFromXml.dart';
import 'package:flutter_test2/main.dart';
import 'package:hovering/hovering.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';

String msg = "";

class NewXML1 extends StatefulWidget {
  final group1 = AutoSizeGroup();
  final group2 = AutoSizeGroup();
  int isSelected = -1;
  Directory? selectedFile;
  int selectedIndex = -1;
  List<FileSystemEntity> listforview = [];

  NewXML1({Key? key}) : super(key: key);

  @override
  State<NewXML1> createState() => __Newxml1();
}

class __Newxml1 extends State<NewXML1> {
  @override
  void initState() {
    //FirebaseAuth.initialize(apiKey, VolatileStore());
    //Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                        style: const TextStyle(fontSize: 35),
                                        minFontSize: 15,
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
                                        minFontSize: 15,
                                        maxFontSize: 35,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HoverButton(
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
                                        minFontSize: 15,
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
                                        minFontSize: 15,
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
                                      child: Builder(
                                        builder: (context) {
                                          if (widget.isSelected == 0) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: Container()),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: AutoSizeText(
                                                      "You need to choose an unmodified and well formated .xml file . Otherwise you should pick the load local file option",
                                                      textAlign:
                                                          TextAlign.center,
                                                      //group: widget.group1,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          //textAlign:
                                                          //TextAlign.center,
                                                          color: Colors.white,
                                                          fontSize: 45),
                                                      minFontSize: 25,
                                                      maxFontSize: 45,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: HoverButton(
                                                        //minWidth: 300,
                                                        onpressed: () {
                                                          _pickfile();
                                                        },
                                                        color: Colors.white,
                                                        hoverColor: const Color
                                                                .fromARGB(
                                                            255, 16, 82, 249),
                                                        textColor: const Color
                                                                .fromARGB(
                                                            255, 16, 82, 249),
                                                        shape:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          16,
                                                                          82,
                                                                          249),
                                                                  width: 5.0),
                                                        ),
                                                        hoverShape:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 5.0),
                                                        ),
                                                        hoverTextColor:
                                                            Colors.white,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        hoverPadding:
                                                            const EdgeInsets
                                                                .all(20.0),

                                                        //child: Expanded(
                                                        child:
                                                            const AutoSizeText(
                                                          "Pick File",
                                                          //group: widget.group1,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: 35),
                                                          minFontSize: 25,
                                                          maxFontSize: 35,
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Container()),
                                              ],
                                            );
                                          } else if (widget.isSelected == 1) {
                                            getAllDatabases();
                                            if (widget.listforview.isEmpty) {
                                              return const Center(
                                                  child: AutoSizeText(
                                                "No DataBases found..",
                                                textAlign: TextAlign.center,
                                                //group: widget.group1,
                                                maxLines: 3,
                                                style: TextStyle(
                                                    //textAlign:
                                                    //TextAlign.center,
                                                    color: Colors.white,
                                                    fontSize: 45),
                                                minFontSize: 15,
                                                maxFontSize: 45,
                                              ));
                                            } else {
                                              return Column(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container()),
                                                  const Expanded(
                                                      flex: 2,
                                                      child: AutoSizeText(
                                                        "Chose one of the availabe DataBases",
                                                        textAlign:
                                                            TextAlign.center,
                                                        //group: widget.group1,
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            //textAlign:
                                                            //TextAlign.center,
                                                            color: Colors.white,
                                                            fontSize: 45),
                                                        minFontSize: 15,
                                                        maxFontSize: 45,
                                                      )),
                                                  Expanded(
                                                    flex: 8,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: Container()),
                                                        Expanded(
                                                          flex: 3,
                                                          child:
                                                              ListView.builder(
                                                                  controller:
                                                                      ScrollController(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount: widget
                                                                      .listforview
                                                                      .length,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (widget.selectedIndex !=
                                                                              index) {
                                                                            widget.selectedIndex =
                                                                                index;
                                                                            widget.selectedFile =
                                                                                Directory(widget.listforview[index].path);
                                                                          } else {
                                                                            widget.selectedIndex =
                                                                                -1;
                                                                            widget.selectedFile =
                                                                                null;
                                                                          }
                                                                        });
                                                                      },
                                                                      child: Card(
                                                                          color: widget.selectedIndex == index ? const Color.fromARGB(255, 16, 82, 249) : Colors.white,
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: AutoSizeText(
                                                                                  widget.listforview[index].path.split('\\').last.substring(0, widget.listforview[index].path.split('\\').last.length - 3),
                                                                                  textAlign: TextAlign.center,
                                                                                  group: widget.group2,
                                                                                  maxLines: 1,
                                                                                  style: TextStyle(
                                                                                      //textAlign:
                                                                                      //TextAlign.center,
                                                                                      color: widget.selectedIndex == index ? Colors.white : const Color.fromARGB(255, 16, 82, 249),
                                                                                      fontSize: 25),
                                                                                  minFontSize: 5,
                                                                                  maxFontSize: 25,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )),
                                                                    );
                                                                  }),
                                                        ),
                                                        Expanded(
                                                            flex: 1,
                                                            child: Container()),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container()),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          HoverButton(
                                                            //minWidth: 300,
                                                            onpressed:
                                                                () async {
                                                              if (widget
                                                                      .selectedFile !=
                                                                  null) {
                                                                openDeleteDialog(
                                                                    context);
                                                              }
                                                            },
                                                            color: Colors.white,
                                                            hoverColor:
                                                                Colors.red,
                                                            textColor:
                                                                Colors.red,
                                                            shape:
                                                                const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          5.0),
                                                            ),
                                                            hoverShape:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 5.0),
                                                            ),
                                                            hoverTextColor:
                                                                Colors.white,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            hoverPadding:
                                                                const EdgeInsets
                                                                    .all(20.0),

                                                            //child: Expanded(
                                                            child:
                                                                const AutoSizeText(
                                                              "Delete DB",
                                                              //group: widget.group1,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontSize: 35),
                                                              minFontSize: 15,
                                                              maxFontSize: 35,
                                                            ),
                                                          ),
                                                          HoverButton(
                                                            //minWidth: 300,
                                                            onpressed: () {
                                                              if (widget
                                                                      .selectedIndex !=
                                                                  -1) {
                                                                SQLHelper
                                                                        .dbDir =
                                                                    widget
                                                                        .selectedFile!
                                                                        .path
                                                                        .split(
                                                                            '\\')
                                                                        .last;
                                                                Navigator
                                                                    .pushReplacement(
                                                                  context,
                                                                  PageRouteBuilder(
                                                                    pageBuilder: (context,
                                                                            animation4,
                                                                            animation2) =>
                                                                        DbLoad(
                                                                            dbDir:
                                                                                widget.selectedFile as Directory),
                                                                    transitionDuration:
                                                                        Duration
                                                                            .zero,
                                                                    reverseTransitionDuration:
                                                                        Duration
                                                                            .zero,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            color: Colors.white,
                                                            hoverColor:
                                                                Colors.green,
                                                            textColor:
                                                                Colors.green,
                                                            shape:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .green,
                                                                  width: 5.0),
                                                            ),
                                                            hoverShape:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 5.0),
                                                            ),
                                                            hoverTextColor:
                                                                Colors.white,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            hoverPadding:
                                                                const EdgeInsets
                                                                    .all(20.0),

                                                            //child: Expanded(
                                                            child:
                                                                const AutoSizeText(
                                                              "Select DB",
                                                              //group: widget.group1,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontSize: 35),
                                                              minFontSize: 15,
                                                              maxFontSize: 35,
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container())
                                                ],
                                              );
                                            }
                                            //return Text("Test1");
                                          } else if (widget.isSelected == 2) {
                                            final _formKey =
                                                GlobalKey<FormState>();
                                            TextEditingController
                                                _emailTextController =
                                                TextEditingController();
                                            TextEditingController
                                                _passwordTextController =
                                                TextEditingController();
                                            return Column(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: Container()),
                                                Expanded(
                                                  flex: 4,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container()),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Container(
                                                          color: Colors.white,
                                                          child: Form(
                                                            key: _formKey,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Container()),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Container()),
                                                                      Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Image.asset("assets/img/firebase.png")),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            AutoSizeText(
                                                                          (msg == "")
                                                                              ? "SIGN IN USING FIREBASE"
                                                                              : msg,
                                                                          style:
                                                                              TextStyle(color: (msg == "") ? Colors.black : Colors.red),
                                                                          maxFontSize:
                                                                              30,
                                                                          minFontSize:
                                                                              5,
                                                                          maxLines: (msg == "")
                                                                              ? 1
                                                                              : 10,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Container()),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Row(
                                                                    children: [
                                                                      const Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              AutoSizeText(
                                                                            "EMAIL:",
                                                                            style:
                                                                                TextStyle(),
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            maxLines:
                                                                                1,
                                                                            minFontSize:
                                                                                5,
                                                                          )),
                                                                      Expanded(
                                                                        flex: 5,
                                                                        child:
                                                                            TextFormField(
                                                                          style:
                                                                              const TextStyle(color: Colors.black),
                                                                          controller:
                                                                              _emailTextController,
                                                                          //focusNode: _focusEmail,
                                                                          validator: (value) =>
                                                                              Validator.validateEmail(email: value!),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Row(
                                                                    children: [
                                                                      const Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              AutoSizeText(
                                                                            "PASSWORD:",
                                                                            style:
                                                                                TextStyle(),
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            maxLines:
                                                                                1,
                                                                            minFontSize:
                                                                                5,
                                                                          )),
                                                                      Expanded(
                                                                        flex: 5,
                                                                        child:
                                                                            TextFormField(
                                                                          style:
                                                                              const TextStyle(color: Colors.black),
                                                                          controller:
                                                                              _passwordTextController,
                                                                          //focusNode: _focusPassword,
                                                                          obscureText:
                                                                              true,
                                                                          validator: (value) =>
                                                                              Validator.validatePassword(password: value!),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 5,
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () async {
                                                                            if (_formKey.currentState!.validate()) {
                                                                              User? user = await FireAuth.signInUsingEmailPassword(email: _emailTextController.text, password: _passwordTextController.text, context: context);
                                                                              setState(() {});
                                                                              if (user != null) {
                                                                                print(user.id);

                                                                                DocumentReference usersDB = await Firestore.instance.collection(user.id).document("Products");
                                                                                SQLHelper.userFB = usersDB;
                                                                                //await usersDB.delete();
                                                                                Navigator.pushReplacement(
                                                                                  context,
                                                                                  PageRouteBuilder(
                                                                                    pageBuilder: (context, animation1, animation2) => FBLoad(
                                                                                      userDB: usersDB,
                                                                                    ),
                                                                                    transitionDuration: Duration.zero,
                                                                                    reverseTransitionDuration: Duration.zero,
                                                                                  ),
                                                                                  // MaterialPageRoute(
                                                                                  //   builder: (context) => Testing(
                                                                                  //     xmlfile: file,
                                                                                  //   ),
                                                                                  // ),
                                                                                );
                                                                              }
                                                                            }
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Sign In',
                                                                            style:
                                                                                TextStyle(color: Colors.black),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container()),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Container()),
                                              ],
                                            );
                                          } else {
                                            return Text("error");
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                )),
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

  void _pickfile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['xml']);

    if (result != null) {
      File file = File(result.files.single.path.toString());
      //print(file.toString());
      //print(result.names);

      //final newfile = await savefileTemp(file);
      SQLHelper.dbDir = "null.db";
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => Testing(
            xmlfile: file,
          ),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        // MaterialPageRoute(
        //   builder: (context) => Testing(
        //     xmlfile: file,
        //   ),
        // ),
      );
    }
  }

  void getAllDatabases() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    Directory dir = Directory('${appDir.path}\\Atlantas\\DataBases');
    //final List<FileSystemEntity> entities = await dir.list().toList();
    //dir.listSync();
    final List<FileSystemEntity> entities = dir.listSync();
    setState(() {
      widget.listforview = dir.listSync();
    });
    //return dir.listSync();
  }

  Future openDeleteDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        // List<TextEditingController> _controller =
        //     List.generate(3, (i) => TextEditingController());

        return AlertDialog(
          shape: const RoundedRectangleBorder(
              side:
                  BorderSide(color: Color.fromARGB(255, 16, 82, 249), width: 5),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Container(
              height: height * 0.2,
              width: width * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Are you sure you want to delete the DB"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () async {
                                var file = File(widget.selectedFile!.path);
                                await file.delete();
                                closealert(context);
                              },
                              child: const Text("Yes")),
                          TextButton(
                              onPressed: () {
                                closealert(context);
                              },
                              child: const Text("No")),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        );
      });

  void closealert(BuildContext context) {
    Navigator.of(context).pop();
  }

  // static Future<User?> signInUsingEmailPassword({
  //   required String email,
  //   required String password,
  //   required BuildContext context,
  // }) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;

  //   try {
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided.');
  //     }
  //   }

  //   return user;
  // }
}

class Validator {
  static String? validateName({required String name}) {
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }
}

class FireAuth {
  // static Future<User?> registerUsingEmailPassword({
  //   required String name,
  //   required String email,
  //   required String password,
  // }) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     user = userCredential.user;
  //     await user!.updateProfile(displayName: name);
  //     await user.reload();
  //     user = auth.currentUser;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return user;
  // }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    //Firestore.initialize(projectId);
    var auth = FirebaseAuth.instance;
    User? user2;
    // FirebaseAuth.initialize(apiKey, VolatileStore());
    // Firestore.initialize(projectId); // Firestore reuses the auth client
    try {
      // Monitor sign-in state
      // auth.signInState
      //     .listen((state) => print("Signed ${state ? "in" : "out"}"));

      // Sign in with user credentials
      await auth.signIn(email, password);

      // Get user object
      var user = await auth.getUser();

      var ref = Firestore.instance.collection('test').document('doc');

      // Subscribe to changes to that document
      ref.stream.listen((document) => print('updated: $document'));

      // Update the document
      await ref.update({'value': 'test'});

      // Get a snapshot of the document
      var document = await ref.get();
      print('snapshot: ${document['value']}');

      auth.signOut();

      // Allow some time to get the signed out event
      await Future.delayed(Duration(seconds: 1));
      print(user);
      return user;
    } catch (e) {
      msg = e.toString();
      //print(e);

    }
    return user2;
    //return user;
  }

  //return user;
}
